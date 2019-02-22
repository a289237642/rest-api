from django.shortcuts import render
from .forms import UserAskForm,UserCommentForm
from .models import UserAsk,UserLove,UserComment
from django.http import JsonResponse
from orgs.models import OrgInfo,TeacherInfo
from courses.models import CourseInfo
from helptools.decorations import login_decoration
# Create your views here.
def user_ask(request):
    user_ask_form = UserAskForm(request.POST)
    if user_ask_form.is_valid():
        # name = user_ask_form.cleaned_data['name']
        # phone = user_ask_form.cleaned_data['phone']
        # course = user_ask_form.cleaned_data['course']
        #
        # a = UserAsk()
        # a.name = name
        # a.phone = phone
        # a.course = course
        # a.save()
        #使用modelform可以很方便的去创建model对象并保存，form保存会导致model保存
        user_ask_form.save(commit=True)
        return JsonResponse({'status':'ok','msg':'咨询成功，请等待回复'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '咨询失败'})


@login_decoration
def user_love(request):
    love_id = request.GET.get('love_id','')
    love_type = request.GET.get('love_type','')

    if love_id and love_type:
        love = UserLove.objects.filter(love_man=request.user,love_id =int(love_id),love_type=int(love_type))
        #判断收藏类别拿到相应类别的对象，这个对象用来改变相应对象收藏数
        ty = None
        if int(love_type) ==1:
            ty = OrgInfo.objects.filter(id=int(love_id))[0]
        if int(love_type) ==2:
            ty = CourseInfo.objects.filter(id=int(love_id))[0]
        if int(love_type) == 3:
            ty = TeacherInfo.objects.filter(id=int(love_id))[0]

        if love:
            if love[0].love_status:
                love[0].love_status = False
                love[0].save()
                ty.love_num-=1
                ty.save()
                return JsonResponse({'status':'ok','msg':'收藏'})
            else:
                love[0].love_status = True
                love[0].save()
                ty.love_num += 1
                ty.save()
                return JsonResponse({'status': 'ok', 'msg': '取消收藏'})
        else:
            a = UserLove()
            a.love_man = request.user
            a.love_id = int(love_id)
            a.love_type = int(love_type)
            a.love_status = True
            a.save()
            ty.love_num += 1
            ty.save()
            return JsonResponse({'status': 'ok', 'msg': '取消收藏'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '收藏失败'})

def user_comment(request):
    user_comment_form = UserCommentForm(request.POST)
    if user_comment_form.is_valid():
        comment_course = user_comment_form.cleaned_data['comment_course']
        content = user_comment_form.cleaned_data['content']

        a = UserComment()
        a.comment_man = request.user
        a.comment_course_id = comment_course
        a.content = content
        a.save()
        course = CourseInfo.objects.filter(id=int(comment_course))[0]
        course.comment_num += 1
        course.save()
        return JsonResponse({'status':'ok','msg':'评论成功'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '评论失败'})
