from django.http import JsonResponse
from django.shortcuts import render, redirect, reverse
from django.views import View

from helptools.send_email_tool import send_email_verify
from items.models import Funding
from operations.models import Banner
from django.contrib.auth import authenticate, login, logout

from users.form import UserRegisterForm, UserLoginForm, ApplyForm, ApplyOneForm, ApplyTwoForm, ApplyThreeForm
from users.models import UserProfile, UserAuth, EmailVerify


class UserRestartView(View):
    """
    重新发送密码
    """

    def get(self, request):
        user_list = UserProfile.objects.filter(id=request.GET.get('user_id'))
        if user_list:
            user = user_list[0]

            emailverify_list = EmailVerify.objects.filter(email=user.email)
            for emailverify in emailverify_list:
                emailverify.delete()
            send_email_verify(request.user.email)
            return JsonResponse({'status': 'ok'})

    def post(self, request):
        pass


class UserApplyThreeView(View):
    """认证第三步"""

    def get(self, request):
        return render(request, 'users/applyThree.html')

    def post(self, request):

        auth_info_list = UserAuth.objects.filter(user=request.user)
        if auth_info_list:
            auth_info = auth_info_list[0]
            apply_three_form = ApplyThreeForm(request.POST)
            emailverify_list = EmailVerify.objects.filter(email=request.user.email).order_by('-add_time')
            if apply_three_form.is_valid() and emailverify_list:
                code = apply_three_form.cleaned_data['code']
                emailverify = emailverify_list[0]
                if emailverify.code == code:
                    user = request.user
                    user.cretify = auth_info.cretify
                    user.real_name = auth_info.real_name
                    user.id_num = auth_info.id_num
                    user.phone = auth_info.phone
                    user.id_photo = auth_info.id_photo
                    user.save()
                    auth_info.delete()
                    emailverify.delete()
                    return redirect(reverse("users:user_center"))
                else:
                    return render(request, 'users/applyThree.html', {
                        'msg': '验证码错误，请确定是最新获取的验证码',
                    })
            return render(request, 'users/applyThree.html', {
                'apply_three_form': apply_three_form,
            })


class UserApplyTwoView(View):
    """
    认证第二步
    """

    def get(self, request):
        return render(request, 'users/applyTwo.html')

    def post(self, request):
        auth_info_list = UserAuth.objects.filter(user=request.user)
        if auth_info_list:
            auth_info = auth_info_list[0]
            apply_two_form = ApplyTwoForm(request.POST)
            if apply_two_form.is_valid() and apply_two_form.cleaned_data['email'] == auth_info.user.email:
                send_email_verify(auth_info.user.email)
                return redirect(reverse('users:user_applyThree'))
            else:
                return render(request, 'users/applyTwo.html',
                              {'apply_two_form': apply_two_form,
                               'msg': '请输入你的邮箱'})


class UserApplyOneView(View):
    """
    认证第一步
    """

    def get(self, request):
        return render(request, 'users/applyOne.html')

    def post(self, request):
        auth_info_list = UserAuth.objects.filter(user=request.user)
        if auth_info_list:
            auth_info = auth_info_list[0]
            apply_one_form = ApplyOneForm(request.POST, request.FILES, instance=auth_info)
            if apply_one_form.is_valid():
                apply_one_form.save(commit=True)
                return redirect(reverse('users:user_applyTwo'))
            else:
                return render(request, 'users/applyOne.html', {'msg': '请上传图片'})


class UserApplyView(View):
    """
    认证开始
    """

    def get(self, request):
        return render(request, 'users/apply.html')

    def post(self, request):
        auth_info_list = UserAuth.objects.filter(user=request.user)
        if auth_info_list:
            auth_info = auth_info_list[0]
            apply_form = ApplyForm(request.POST, instance=auth_info)
            if apply_form.is_valid():
                apply_form.save(commit=True)
            return redirect(reverse('users:user_applyOne'))


class UserVerifyView(View):
    """
    认证
    """

    def get(self, request):
        return render(request, 'users/accttype.html')

    def post(self, request):
        category = request.POST.get('category')

        if category:
            auth_info = UserAuth()
            auth_info.user = request.user
            auth_info.cretify = int(category)
            auth_info.save()
            return JsonResponse({'status': 'ok'})
        else:
            return JsonResponse({'status': 'fail', 'msg': '请选择认证类型'})


class UserCenterView(View):
    """
    会员中心
    """

    def get(self, request):
        return render(request, 'users/member.html')

    def post(self):
        pass


class UserLoginView(View):
    """Login in"""

    def get(self, request):
        user_login_form = UserLoginForm()
        return render(request, "users/login.html", {"user_login_form": user_login_form})

    def post(self, request):
        user_login_form = UserLoginForm(request.POST)
        if user_login_form.is_valid():
            username = user_login_form.cleaned_data["username"]
            password = user_login_form.cleaned_data["password"]

            a = authenticate(username=username, password=password)
            if a:
                login(request, a)
                return redirect(reverse("index"))
            else:
                return render(request, 'users/login.html', {'msg': '用户名或者密码有误'})
        else:
            return render(request, 'users/login.html', {'msg': user_login_form})


class UserRegisterView(View):
    """
    register
    """

    def get(self, request):
        user_register_form = UserRegisterForm()
        return render(request, 'users/user_register.html', {'user_register_form': user_register_form})

    def post(self, request):
        user_register_form = UserRegisterForm(request.POST)
        if user_register_form.is_valid():
            username = user_register_form.cleaned_data["username"]
            password = user_register_form.cleaned_data["password"]

            email = user_register_form.cleaned_data["email"]
            user = UserProfile.objects.filter(username=username)
            if user:
                return render(request, 'users/user_register.html', {'msg': '用户已经存在'})
            else:
                a = UserProfile()
                a.username = username
                a.set_password(password)
                a.email = email
                a.save()
                return redirect(reverse('users:user_login'))
        else:
            return render(request, 'users/user_register.html', {'user_register_form': user_register_form})


class UserLogoutView(View):
    """
    退出登录
    """

    def get(self, request):
        logout(request)
        return redirect(reverse('index'))


class IndexView(View):
    """
    首页
    """

    def get(self, request):
        all_banner = Banner.objects.all().order_by("-add_time")[:3]
        rec_list = Funding.objects.all().order_by("-fav_num")[:3]
        category_dict = dict(Funding.CATEGORY)
        category_list = {category_dict[key]: Funding.objects.filter(category=key)[:4] for key in range(1, 5)}

        return render(request, 'index.html',
                      {"all_banner": all_banner, "rec_list": rec_list, "category_list": category_list})

    def post(self, request):
        pass
