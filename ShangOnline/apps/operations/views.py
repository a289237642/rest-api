from django.shortcuts import render
from .forms import UserAskForm,UserCommentForm
from .models import UserAskInfo,UserLoveInfo,UserCommentInfo
from django.http import JsonResponse
# Create your views here.
from helptools.decorators import login_decorator
def user_ask(request):
    user_ask_form = UserAskForm(request.POST)
    if user_ask_form.is_valid():
        # name = user_ask_form.cleaned_data['name']
        # phone = user_ask_form.cleaned_data['phone']
        # course = user_ask_form.cleaned_data['course']
        # a = UserAskInfo()
        # a.name = name
        # a.phone = phone
        # a.course = course
        # a.save()
        user_ask_form.save(commit=True)
        return JsonResponse({'status':'ok','msg':'咨询成功，请等待回复'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '咨询失败，重新填写'})

@login_decorator
def user_love(request):
    lovetype = request.GET.get('lovetype','')
    loveid = request.GET.get('loveid', '')
    #当类型和id同时存在才有可能性继续
    if lovetype and loveid:
        #需要在表当中去查找以前是否有这个收藏的对象
        love = UserLoveInfo.objects.filter(userinfo=request.user,love_type=int(lovetype),love_id=int(loveid))
        #如果表里面有这个收藏对象执行以下if语句块
        if love:
            #确定有这个对象，我们需要通过这个对象的收藏状态来设定收藏和取消收藏
            if love[0].love_status:
                love[0].love_status = False
                love[0].save()
                return JsonResponse({'status':'ok','msg':'收藏'})
            else:
                love[0].love_status = True
                love[0].save()
                return JsonResponse({'status': 'ok', 'msg': '取消收藏'})
        #如果表里面没有这个收藏对象执行以下else语句块
        else:
            a = UserLoveInfo()
            a.userinfo = request.user
            a.love_status = True
            a.love_type = int(lovetype)
            a.love_id = int(loveid)
            a.save()
            return JsonResponse({'status': 'ok', 'msg': '取消收藏'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '收藏失败'})


def user_comment(request):
    user_comment_form = UserCommentForm(request.POST)
    if user_comment_form.is_valid():
        content = user_comment_form.cleaned_data['content']
        courseid = user_comment_form.cleaned_data['courseid']
        a = UserCommentInfo()
        a.userinfo = request.user
        a.comment_content = content
        a.courseinfo_id = int(courseid)
        a.save()
        return JsonResponse({'status':'ok'})
    else:
        return JsonResponse({'status':'fail','msg':'评论失败'})

def user_deletelove(request):
    loveid = request.GET.get('loveid','')
    lovetype = request.GET.get('lovetype', '')
    if loveid and lovetype:
        love  = UserLoveInfo.objects.filter(userinfo=request.user,love_type=int(lovetype),love_id=int(loveid))
        if love:
            love[0].love_status = False
            love[0].save()
            return JsonResponse({'status':'ok'})
        else:
            return JsonResponse({'status': 'fail'})
    else:
        return JsonResponse({'status': 'fail'})