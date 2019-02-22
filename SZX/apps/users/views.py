from django.shortcuts import render, redirect, reverse, HttpResponse
from .forms import UserRegisterForm, UserLoginForm, UserForgetForm, UserResetForm
from django.db.models import Q
from .models import UserProfile, EmailVerify, Banner
from helptools.send_mail_tool import send_email_verify
from django.contrib.auth import authenticate, logout, login
from operations.models import UserMessageInfo
from django.views import View


# Create your views here.
# Home Page
class IndexView(View):
    def get(self, request):
        all_banners = Banner.objects.all().order_by("-add_time")[:5]
        return render(request, 'index.html',
                      {'all_banners': all_banners})


# register
class UserRegisterView(View):
    def get(self, request):
        user_register_form = UserRegisterForm()
        return render(request, 'users/user_register.html', {'user_register_form': user_register_form})

    def post(self, request):
        user_register_form = UserRegisterForm(request.POST)
        if user_register_form.is_valid():
            email = user_register_form.cleaned_data['email']
            password = user_register_form.cleaned_data['password']
            user = UserProfile.objects.filter(Q(email=email) | Q(username=email))
            if user:
                return render(request, 'users/user_register.html', {'msg': '用户已经存在'})
            else:
                a = UserProfile()
                a.username = email
                a.email = email
                a.set_password(password)
                a.save()

                msg = UserMessageInfo()
                msg.userinfo = a.id
                msg.message = '欢迎注册'
                msg.save()

                send_email_verify(email, 'register')
                return HttpResponse('你的邮件已发送，请尽快去激活！！！！')
        else:
            return render(request, 'users/user_register.html', {'user_register_form': user_register_form})


# 邮箱激活
class UserActiveView(View):
    def get(self, request, code):
        if code:
            email_ver = EmailVerify.objects.filter(code=code)[0]
            email = email_ver.email
            user = UserProfile.objects.filter(email=email)[0]
            user.is_start = True
            user.save()
            return redirect(reverse('users:user_login'))
        else:
            pass


# login
class UserLoginView(View):
    def get(self, request):
        return render(request, 'users/login.html')

    def post(self, request):
        user_login_form = UserLoginForm(request.POST)
        if user_login_form.is_valid():
            email = user_login_form.cleaned_data['email']
            password = user_login_form.cleaned_data['password']
            a = authenticate(username=email, password=password)
            if a:
                if a.is_start:
                    login(request, a)

                    msg = UserMessageInfo()
                    msg.userinfo = a.id
                    msg.message = '欢迎登录'
                    msg.save()

                    return redirect(reverse('index'))
                else:
                    return HttpResponse('请去激活')
            else:
                return render(request, 'users/login.html', {'msg': '用户名或者密码有误'})
        else:
            return render(request, 'users/login.html', {'user_login_form': user_login_form})


# logout
def user_logout(request):
    logout(request)
    return redirect(reverse('index'))


# UserForgetView
class UserForgetView(View):
    def get(self, request):
        user_forget_form = UserForgetForm()
        return render(request, "users/forgetpwd.html", {"user_forget_form": user_forget_form})

    def post(self, request):
        user_forget_form = UserForgetForm(request.POST)
        if user_forget_form.is_valid():
            email = user_forget_form.cleaned_data['email']
            user = UserProfile.objects.filter(email=email)
            if user:
                send_email_verify(email, 'forget')
                return HttpResponse("请速去激活重置密码")
            else:
                return HttpResponse("您输入的邮箱不存在")
        else:
            return render(request, 'users/forgetpwd.html', {'user_forget_form': user_forget_form})


# UserResetView
class UserResetView(View):
    def get(self, request, code):
        if code:
            email_var = EmailVerify.objects.filter(code=code)[0]
            email = email_var.email
            user = UserProfile.objects.filter(email=email)[0]
            return render(request, 'users/password_reset.html', {'user_id': user.id})

    def post(self, request, code):
        user_reset_form = UserResetForm(request.POST)
        if user_reset_form.is_valid():
            password = user_reset_form.cleaned_data['password']
            password1 = user_reset_form.cleaned_data['password1']
            if code:
                user = UserProfile.objects.filter(id=int(code))
                if user:
                    if password == password1:
                        user[0].set_password(password)
                        user[0].save()
                        return redirect(reverse('users:user_login'))
                    else:
                        return render(request, 'users/password_reset.html', {'msg': '两次密码不一致'})
                else:
                    pass
            else:
                pass
        else:
            return render(request, 'users/password_reset.html', {'user_reset_form': user_reset_form})
