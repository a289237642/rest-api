from django.shortcuts import render, redirect, reverse, HttpResponse
from .forms import UserRegisterForm, UserLoginForm, UserForgetpwdForm, UserResetpwdForm, UserChangeInfoForm, \
    UserChangeImageForm, UserChangeEmailForm, UserResetEmailForm
from .models import UserProfile, EmailVerifyCode
from django.contrib.auth import authenticate, logout, login
# from helptools.send_mail_tools import send_email_code
from .tasks import send_email_code
from django.http import JsonResponse
from datetime import datetime
from operations.models import UserCourse, UserLove, UserMessage
from orgs.models import OrgInfo, TeacherInfo
from courses.models import CourseInfo
from .models import BannerInfo
from django.core.cache import cache
from django.views.decorators.cache import cache_page


# Create your views here.
@cache_page(10 * 60)
def index(request):
    key = 'all_banners'
    if key in cache:
        all_banners = cache.get(key)
    else:
        all_banners = BannerInfo.objects.all()
        cache.set(key, all_banners, 15 * 60)
    key = 'all_bannercourses'
    if key in cache:
        all_bannercourses = cache.get(key)
    else:
        all_bannercourses = CourseInfo.objects.filter(is_banner=True)[:2]
        cache.set(key, all_bannercourses, 15 * 60)
    key = 'all_courses'
    if key in cache:
        all_courses = cache.get(key)
    else:
        all_courses = CourseInfo.objects.filter(is_banner=False)[:6]
        cache.set(key, all_courses, 15 * 60)
    key = 'all_orgs'
    if key in cache:
        all_orgs = cache.get(key)
    else:
        all_orgs = OrgInfo.objects.all()[:15]
        cache.set(key, all_orgs, 15 * 60)
    return render(request, 'index.html', {
        'all_banners': all_banners,
        'all_bannercourses': all_bannercourses,
        'all_courses': all_courses,
        'all_orgs': all_orgs
    })


def user_register(request):
    if request.method == 'GET':
        user_register_form = UserRegisterForm()
        return render(request, 'users/register.html', {
            'user_register_form': user_register_form
        })
    else:
        user_register_form = UserRegisterForm(request.POST)
        if user_register_form.is_valid():
            email = user_register_form.cleaned_data['email']
            password = user_register_form.cleaned_data['password']

            user = UserProfile.objects.filter(username=email)
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

                send_email_code.delay(email, 'register')

                return HttpResponse('请尽快前往邮箱去激活，否则无法登录')
        else:
            return render(request, 'users/register.html', {
                'user_register_form': user_register_form
            })


def user_login(request):
    if request.method == 'GET':
        return render(request, 'users/login.html')
    else:
        user_login_form = UserLoginForm(request.POST)
        if user_login_form.is_valid():
            email = user_login_form.cleaned_data['email']
            password = user_login_form.cleaned_data['password']
            user = authenticate(username=email, password=password)
            if user:
                if user.is_start:
                    login(request, user)
                    a = UserMessage()
                    a.msg_user = request.user.id
                    a.msg_content = '欢迎登陆谷粒教育网'
                    a.save()
                    url = request.COOKIES.get('url', '/')
                    return redirect(url)
                else:
                    return HttpResponse('你的邮箱未激活，请去邮箱激活后再登录！')

            else:
                return render(request, 'users/login.html', {
                    'msg': '邮箱或者密码错误'
                })
        else:
            return render(request, 'users/login.html', {
                'user_login_form': user_login_form
            })


def user_active(request, email_code):
    if email_code:
        email_ver = EmailVerifyCode.objects.filter(code=email_code)[0]
        email = email_ver.email
        user = UserProfile.objects.filter(username=email)
        if user:
            user[0].is_start = True
            user[0].save()
            email_ver.delete()
            return redirect(reverse('users:user_login'))
        else:
            return HttpResponse('发送验证码的用户不存在')
    else:
        pass


def user_logout(request):
    logout(request)
    return redirect(reverse('index'))


def user_forgetpwd(request):
    '''
    忘记密码以后，返回form表单并且发送邮箱验证码
    :param request:
    :return:
    '''
    if request.method == 'GET':
        user_forgetpwd_form = UserForgetpwdForm()
        return render(request, 'users/forgetpwd.html', {
            'user_forgetpwd_form': user_forgetpwd_form
        })
    else:
        user_forgetpwd_form = UserForgetpwdForm(request.POST)
        if user_forgetpwd_form.is_valid():
            email = user_forgetpwd_form.cleaned_data['email']

            user = UserProfile.objects.filter(username=email)
            if user:
                send_email_code(email, 'forget')
                return HttpResponse('请尽快去邮箱验证重置您的密码')
            else:
                return render(request, 'users/forgetpwd.html', {
                    'msg': '您的邮箱尚未注册'
                })
        else:
            return render(request, 'users/forgetpwd.html', {
                'msg': '您的邮箱填写有误'
            })


def user_resetpwd(request, email_code):
    if request.method == 'GET':
        if email_code:
            # email_ver = EmailVerifyCode.objects.filter(code=email_code)[0]
            # email = email_ver.email
            # user = UserProfile.objects.filter(username = email)[0]
            return render(request, 'users/password_reset.html', {
                'email_code': email_code
            })
        else:
            pass
    else:
        if email_code:
            email_ver = EmailVerifyCode.objects.filter(code=email_code)[0]
            email = email_ver.email
            user = UserProfile.objects.filter(username=email)[0]
            # user = UserProfile.objects.filter(id = int(email_code))[0]
            user_resetpwd_form = UserResetpwdForm(request.POST)
            if user_resetpwd_form.is_valid():
                password = user_resetpwd_form.cleaned_data['password']
                password1 = user_resetpwd_form.cleaned_data['password1']
                if password == password1:
                    user.set_password(password)
                    user.save()
                    # 删除修改过后留下的邮箱验证码对象
                    email_ver.delete()
                    return redirect(reverse('users:user_login'))
                else:
                    return render(request, 'users/password_reset.html', {
                        'msg': '两次密码不一致',
                        'email_code': email_code
                    })
            else:
                return render(request, 'users/password_reset.html', {
                    'user_resetpwd_form': user_resetpwd_form,
                    'email_code': email_code

                })


def user_centerinfo(request):
    return render(request, 'users/usercenter-info.html')


def user_changeimage(request):
    user_changeimage_form = UserChangeImageForm(request.POST, request.FILES, instance=request.user)
    if user_changeimage_form.is_valid():
        user_changeimage_form.save(commit=True)
        return JsonResponse({'status': 'ok'})
    else:
        pass


def user_changeinfo(request):
    user_changeinfo_form = UserChangeInfoForm(request.POST, instance=request.user)
    if user_changeinfo_form.is_valid():
        user_changeinfo_form.save(commit=True)
        return JsonResponse({'status': 'ok', 'msg': '修改成功'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '修改失败'})


def user_changeemail(request):
    user_changeemail_form = UserChangeEmailForm(request.POST)
    if user_changeemail_form.is_valid():
        email = user_changeemail_form.cleaned_data['email']
        email_list = UserProfile.objects.filter(email=email)
        if email_list:
            return JsonResponse({'status': 'fail', 'msg': '该邮箱已经被绑定'})
        else:
            email_ver = EmailVerifyCode.objects.filter(email=email, send_type='change').order_by('-add_time')
            if email_ver:
                if (datetime.now() - email_ver[0].add_time).seconds > 60:
                    email_ver[0].delete()
                    send_email_code(email, 'change')
                    return JsonResponse({'status': 'ok', 'msg': '验证码已经发送成功'})
                else:
                    return JsonResponse({'status': 'fail', 'msg': '验证码已经发送，请勿重复发送'})
            else:
                send_email_code(email, 'change')
                return JsonResponse({'status': 'ok', 'msg': '验证码已经发送成功'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '邮箱有问题'})


def user_resetemail(request):
    user_resetemail_form = UserResetEmailForm(request.POST)
    if user_resetemail_form.is_valid():
        email = user_resetemail_form.cleaned_data['email']
        code = user_resetemail_form.cleaned_data['code']
        if email and code:
            email_ver = EmailVerifyCode.objects.filter(email=email, code=code)
            if email_ver:
                request.user.email = email
                request.user.username = email
                request.user.save()
                return JsonResponse({'status': 'ok', 'msg': '修改成功'})
            else:
                return JsonResponse({'status': 'fail', 'msg': '修改失败'})
        else:
            return JsonResponse({'status': 'fail', 'msg': '修改失败'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '修改失败'})


def user_centerinfo_mycourse(request):
    all_usercourses = UserCourse.objects.filter(study_man=request.user)
    all_courses = [usercourse.study_course for usercourse in all_usercourses]
    return render(request, 'users/usercenter-mycourse.html', {
        'all_courses': all_courses
    })


def user_centerinfo_loveorg(request):
    all_loveorgs = UserLove.objects.filter(love_man=request.user, love_type=1, love_status=True)
    all_orgids = [loveorg.love_id for loveorg in all_loveorgs]
    all_orgs = OrgInfo.objects.filter(id__in=all_orgids)
    return render(request, 'users/usercenter-fav-org.html', {
        'all_orgs': all_orgs
    })


def user_deletelove(request):
    love_id = request.GET.get('love_id', '')
    love_type = request.GET.get('love_type', '')
    if love_id and love_type:
        love = UserLove.objects.filter(love_man=request.user, love_id=int(love_id), love_type=int(love_type))[0]
        love.love_status = False
        love.save()
        return JsonResponse({'status': 'ok', 'msg': '取消成功'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '取消失败'})


def user_centerinfo_loveteacher(request):
    all_loveteachers = UserLove.objects.filter(love_man=request.user, love_type=3, love_status=True)
    all_teacherids = [loveteacher.love_id for loveteacher in all_loveteachers]
    all_teachers = TeacherInfo.objects.filter(id__in=all_teacherids)
    return render(request, 'users/usercenter-fav-teacher.html', {
        'all_teachers': all_teachers
    })


def user_centerinfo_lovecourse(request):
    all_lovecourses = UserLove.objects.filter(love_man=request.user, love_type=2, love_status=True)
    all_courseids = [lovecourse.love_id for lovecourse in all_lovecourses]
    all_courses = CourseInfo.objects.filter(id__in=all_courseids)
    return render(request, 'users/usercenter-fav-course.html', {
        'all_courses': all_courses
    })


def user_centerinfo_mymessage(request):
    all_msgs = UserMessage.objects.filter(msg_user=request.user.id)
    return render(request, 'users/usercenter-message.html', {
        'all_msgs': all_msgs
    })


def user_changestatus(request):
    msgid = request.GET.get('msgid')
    if msgid:
        msg = UserMessage.objects.filter(id=int(msgid))[0]
        msg.msg_status = True
        msg.save()
        return JsonResponse({'status': 'ok', 'msg': '读取成功'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '读取失败'})
