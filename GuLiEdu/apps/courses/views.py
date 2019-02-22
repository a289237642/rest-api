from django.shortcuts import render
from .models import CourseInfo
from django.core.paginator import Paginator,PageNotAnInteger,EmptyPage
from django.db.models import F,Q
from helptools.user_love_status import get_love_status
from operations.models import UserCourse,UserComment
from helptools.decorations import login_decoration
# Create your views here.
def course_list(request):
    all_courses = CourseInfo.objects.all()
    sort_courses = all_courses.order_by('-study_num')[:3]

    keyword = request.GET.get('keyword', '')
    if keyword:
        all_courses = all_courses.filter(
            Q(name__icontains=keyword) | Q(desc__icontains=keyword) | Q(detail__icontains=keyword))

    sort = request.GET.get('sort','')
    if sort == 'hot':
        all_courses = all_courses.order_by('-click_num')
    if sort == 'students':
        all_courses = all_courses.order_by('-study_num')

    pagenum = request.GET.get('pagenum','')
    pa = Paginator(all_courses,2)
    try:
        pages = pa.page(pagenum)
    except PageNotAnInteger:
        pages = pa.page(1)
    except EmptyPage:
        pages = pa.page(pa.num_pages)

    return render(request,'courses/course-list.html',{
        'pages':pages,
        'all_courses':all_courses,
        'sort_courses':sort_courses,
        'sort':sort,
        'keyword': keyword
    })

def course_detail(request,courseid):
    if courseid:
        course = CourseInfo.objects.filter(id=int(courseid))[0]
        course.click_num += 1
        course.save()
        relative_courses = CourseInfo.objects.filter(name__icontains=course.name[:2]).exclude(name=course.name)


        #如果我们想要去判断两个字段之间的大小关系或者对一个字段进行运算的时候，需要用F
        # courses = CourseInfo.objects.filter(click_num__gt=F('study_num'))
        # courses = CourseInfo.objects.filter(click_num__gt=F('study_num')*3)

        #我们平时玩的and也就是与，其实都是Q对象的简写形式，如果完整应该以下写法
        # courses = CourseInfo.objects.filter(click_num=100,study_num=2000)
        # courses = CourseInfo.objects.filter(Q(click_num=100)&Q(study_num=2000))
        #如果我们需要用到或者，或逻辑是没有简写形式的，那么就必须要使用Q对象，如下操作：
        # courses = CourseInfo.objects.filter(Q(click_num=100) | Q(study_num=2000))
        #如果需要取反，在前面加~
        # courses = CourseInfo.objects.filter(~Q(click_num=100))
        love_statu = get_love_status(request,course.org.id,1)
        love_coustatu = get_love_status(request, course.id, 2)
        return render(request,'courses/course-detail.html',{
            'course':course,
            'relative_courses':relative_courses,
            'love_statu':love_statu,
            'love_coustatu':love_coustatu
        })

@login_decoration
def course_video(request,courseid):
    if courseid:
        course = CourseInfo.objects.filter(id=int(courseid))[0]
        #根据用户和课程去  用户学习课程的表当中去查找用户是否学习过当前的这个课程
        usercourse = UserCourse.objects.filter(study_man=request.user,study_course_id=course.id)
        if not usercourse:
            a = UserCourse()
            a.study_man = request.user
            a.study_course = course
            a.save()
            course.study_num += 1
            course.save()

        #学过该课程的同学还学过什么课程
        #第一步  根据课程在用户课程表当中，找到所有和这个课程相关的用户课程对象
        usercourse_list = UserCourse.objects.filter(study_course=course)
        #第二步  通过这个找到的对象列表，找出所有学习过这个课程的用户
        user_list = [usercourse.study_man for usercourse in usercourse_list]
        #第三步  通过这个用户列表，找到所有用户的用户课程对象
        usercourse_list =  UserCourse.objects.filter(study_man__in=user_list)
        #第四步  再次通过拿到的用户课程对象列表，去获取到所有的课程
        course_list = [usercourse.study_course for usercourse in usercourse_list]
        # #根据remove去重
        course_list = list(set(course_list))
        # course_list.remove(course)
        # #列表生成式遍历去重
        course_list  = [cou for cou in course_list if cou.id != course.id]

        return render(request,'courses/course-video.html',{
            'course':course,
            'course_list':course_list
        })

def course_comment(request,courseid):
    if courseid:
        course = CourseInfo.objects.filter(id=int(courseid))[0]
        usercourse_list = UserCourse.objects.filter(study_course=course)
        # 第二步  通过这个找到的对象列表，找出所有学习过这个课程的用户
        user_list = [usercourse.study_man for usercourse in usercourse_list]
        # 第三步  通过这个用户列表，找到所有用户的用户课程对象
        usercourse_list = UserCourse.objects.filter(study_man__in=user_list)
        # 第四步  再次通过拿到的用户课程对象列表，去获取到所有的课程
        course_list = [usercourse.study_course for usercourse in usercourse_list]
        # #根据remove去重
        course_list = list(set(course_list))
        # course_list.remove(course)
        # #列表生成式遍历去重
        course_list = [cou for cou in course_list if cou.id != course.id]

        all_comments = UserComment.objects.filter(comment_course=course)

        return render(request, 'courses/course-comment.html', {
            'course': course,
            'course_list': course_list,
            'all_comments':all_comments
        })
