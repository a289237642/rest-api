from django.shortcuts import render, redirect, reverse, HttpResponse
from .forms import UserRegisterForm, UserLoginForm, UserForgetForm, UserResetForm, UserChangeInfoForm, \
    UserChangeImageform, UserSendCodeForm, UserChangeEmailForm
from .models import UserProfile, EmailVerify
from django.db.models import Q
from django.contrib.auth import authenticate, login, logout
from helptools.send_mail_tool import send_email_verify
from django.http import JsonResponse
from datetime import datetime
from operations.models import UserCourseInfo, UserLoveInfo, UserMessageInfo
from orgs.models import OrgInfo, TeacherInfo
from courses.models import CourseInfo
from .models import Banner
from django.views import View


class IndexView(View):
    def get(self, request):
        all_banners = Banner.objects.all().order_by('-add_time')[:5]
        all_bannercourses = CourseInfo.objects.filter(is_banner=True).order_by('-click_num')[:3]
        all_courses = CourseInfo.objects.filter(is_banner=False).order_by('-add_time')[:6]
        all_orgs = OrgInfo.objects.all().order_by('-click_num')[:15]
        return render(request, 'index.html', {
            'all_banners': all_banners,
            'all_bannercourses': all_bannercourses,
            'all_courses': all_courses,
            'all_orgs': all_orgs
        })


class UserRegisterView(View):
    def get(self, request):
        user_register_form = UserRegisterForm()
        return render(request, 'users/register.html', {
            'user_register_form': user_register_form
        })

    def post(self, request):
        user_register_form = UserRegisterForm(request.POST)
        if user_register_form.is_valid():
            email = user_register_form.cleaned_data['email']
            password = user_register_form.cleaned_data['password']
            user = UserProfile.objects.filter(Q(email=email) | Q(username=email))
            if user:
                return render(request, 'users/register.html', {
                    'msg': '用户已经存在'
                })
            else:
                a = UserProfile()
                a.username = email
                a.email = email
                a.set_password(password)
                a.save()

                # 注册成功之后先创建一条消息存储，然后发邮件
                msg = UserMessageInfo()
                msg.userinfo = a.id
                msg.message = '欢迎注册尚在线'
                msg.save()

                send_email_verify(email, 'register')

                return HttpResponse('您的邮件已经发送，请尽快去激活')
        else:
            return render(request, 'users/register.html', {
                'user_register_form': user_register_form
            })


def user_login(request):
    if request.method == 'GET':
        return render(request, 'users/login.html', {
        })
    else:
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
                    msg.message = '欢迎登录尚在线'
                    msg.save()
                    # return redirect(reverse('index'))
                    url = request.COOKIES.get('url', '/')
                    ret = redirect(url)
                    ret.delete_cookie('url')
                    return ret
                else:
                    return HttpResponse('请去激活')
            else:
                return render(request, 'users/login.html', {
                    'msg': '用户名或者密码有误'
                })
        else:
            return render(request, 'users/login.html', {
                'user_login_form': user_login_form
            })


def user_active(request, code):
    if code:
        email_ver = EmailVerify.objects.filter(code=code)[0]
        email = email_ver.email
        user = UserProfile.objects.filter(email=email)[0]
        user.is_start = True
        user.save()
        return redirect(reverse('users:user_login'))
    else:
        pass


def user_logout(request):
    logout(request)
    return redirect(reverse('index'))


def user_forget(request):
    if request.method == 'GET':
        user_forget_form = UserForgetForm()
        return render(request, 'users/user_forget.html', {
            'user_forget_form': user_forget_form
        })
    else:
        user_forget_form = UserForgetForm(request.POST)
        if user_forget_form.is_valid():
            email = user_forget_form.cleaned_data['email']
            user = UserProfile.objects.filter(email=email)
            if user:
                send_email_verify(email, 'forget')
                return HttpResponse('请速去激活重置密码')
            else:
                return HttpResponse('您输入的邮箱不存在')
        else:
            return render(request, 'users/user_forget.html', {
                'user_forget_form': user_forget_form
            })


def user_reset(request, code):
    if request.method == 'GET':
        if code:
            email_ver = EmailVerify.objects.filter(code=code)[0]
            email = email_ver.email
            user = UserProfile.objects.filter(email=email)[0]
            return render(request, 'users/user_reset.html', {
                'user_id': user.id
            })
        else:
            pass
    else:
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
                        return render(request, 'users/user_reset.html', {
                            'msg': '两次密码不一致'
                        })
                else:
                    pass
            else:
                pass
        else:
            return render(request, 'users/user_reset.html', {
                'user_reset_form': user_reset_form
            })


def user_info(request):
    return render(request, 'users/usercenter-info.html')


def user_changeimage(request):
    user_changeimage_form = UserChangeImageform(request.POST, request.FILES, instance=request.user)
    if user_changeimage_form.is_valid():
        user_changeimage_form.save(commit=True)
        return JsonResponse({'status': 'ok'})
    else:
        return JsonResponse({'status': 'fail'})


def user_changeinfo(request):
    user_change_info_form = UserChangeInfoForm(request.POST, instance=request.user)
    if user_change_info_form.is_valid():
        user_change_info_form.save(commit=True)
        return JsonResponse({'status': 'ok'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '修改失败'})


def user_sendcode(request):
    user_sendcode_form = UserSendCodeForm(request.POST)
    if user_sendcode_form.is_valid():
        email = user_sendcode_form.cleaned_data['email']
        useremail = UserProfile.objects.filter(Q(email=email) | Q(username=email))
        if useremail:
            return JsonResponse({'status': 'fail', 'msg': '邮箱已经被绑定'})
        else:
            email_ver = EmailVerify.objects.filter(email=email, send_type='changeemail').order_by('-add_time')
            if email_ver:
                if (datetime.now() - email_ver[0].add_time).seconds < 120:
                    return JsonResponse({'status': 'ok', 'msg': '验证码已经发送过。。。'})

            send_email_verify(email, 'changeemail')
            return JsonResponse({'status': 'ok', 'msg': '修改邮箱验证码已经发送'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '邮箱不合法'})


def user_changeemail(request):
    user_changeemail_form = UserChangeEmailForm(request.POST)
    if user_changeemail_form.is_valid():
        email = user_changeemail_form.cleaned_data['email']
        code = user_changeemail_form.cleaned_data['code']
        email_code = EmailVerify.objects.filter(email=email, code=code)
        if email_code:
            request.user.username = email
            request.user.email = email
            request.user.save()
            return JsonResponse({'status': 'ok', 'msg': '修改成功'})
        else:
            return JsonResponse({'status': 'fail', 'msg': '修改失败'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '修改失败'})


def user_course(request):
    usercourse_list = UserCourseInfo.objects.filter(userinfo=request.user)
    all_courses = [usercourse.courseinfo for usercourse in usercourse_list]

    return render(request, 'users/usercenter-mycourse.html', {
        'all_courses': all_courses
    })


def user_loveorg(request):
    userorg_list = UserLoveInfo.objects.filter(userinfo=request.user, love_type=1, love_status=True)
    all_orgids = [userorg.love_id for userorg in userorg_list]
    all_orgs = OrgInfo.objects.filter(id__in=all_orgids)
    return render(request, 'users/usercenter-fav-org.html', {
        'all_orgs': all_orgs
    })


def user_loveteacher(request):
    userteacher_list = UserLoveInfo.objects.filter(userinfo=request.user, love_type=3, love_status=True)
    all_teacherids = [userteacher.love_id for userteacher in userteacher_list]
    all_teachers = TeacherInfo.objects.filter(id__in=all_teacherids)
    return render(request, 'users/usercenter-fav-teacher.html', {
        'all_teachers': all_teachers
    })


def user_lovecourse(request):
    usercourse_list = UserLoveInfo.objects.filter(userinfo=request.user, love_type=2, love_status=True)
    all_courseids = [usercourse.love_id for usercourse in usercourse_list]
    all_courses = CourseInfo.objects.filter(id__in=all_courseids)
    return render(request, 'users/usercenter-fav-course.html', {
        'all_courses': all_courses
    })


def user_message(request):
    all_messages = UserMessageInfo.objects.filter(userinfo=request.user.id)
    return render(request, 'users/usercenter-message.html', {
        'all_messages': all_messages
    })


def user_readmessage(request):
    msgid = request.GET.get('msgid', '')
    if msgid:
        msg = UserMessageInfo.objects.filter(id=int(msgid))[0]
        msg.msg_status = True
        msg.save()
        return JsonResponse({'status': 'ok'})
    else:
        return JsonResponse({'status': 'fail'})


def handler_404(request):
    ret = render(request, '404.html')
    ret.status_code = 404
    return ret


def handler_500(request):
    ret = render(request, '500.html')
    ret.status_code = 500
    return ret
