from django.shortcuts import render
from .models import CourseInfo
from operations.models import UserLoveInfo, UserCourseInfo, UserCommentInfo
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from helptools.decorators import login_decorator
from django.db.models import Q


# Create your views here.
def course_list(request):
    all_courses = CourseInfo.objects.all()
    rec_courses = all_courses.order_by('-love_num')[:3]

    keywords = request.GET.get = ('keywords', '')
    if keywords:
        all_courses = all_courses.filter(Q(name__icontains=keywords) | Q(desc__icontains=keywords | Q()))

    sort_type = request.GET.get('sort', '')
    if sort_type == 'hot':
        all_courses = all_courses.order_by('-click_num')
    if sort_type == 'students':
        all_courses = all_courses.order_by('-stunum')

    pagenum = request.GET.get('pagenum', 1)
    pa = Paginator(all_courses, 2)
    try:
        page_list = pa.page(pagenum)
    except PageNotAnInteger:
        page_list = pa.page(1)
    except EmptyPage:
        page_list = pa.page(pa.num_pages)

    return render(request, 'courses/course-list.html', {
        'all_courses': all_courses,
        'sort_type': sort_type,
        'page_list': page_list,
        'rec_courses': rec_courses
    })


def course_detail(request, course_id):
    '''

    :param request:
    :param course_id:
    :return:
    '''
    if course_id:
        all_courses = CourseInfo.objects.all()
        course = CourseInfo.objects.filter(id=int(course_id))[0]
        rec_courses = all_courses.filter(name__icontains=course.name[:4])

        is_love = False
        is_loveCourse = False
        if request.user.is_authenticated():
            love = UserLoveInfo.objects.filter(userinfo=request.user, love_type=1, love_id=course.orginfo.id)
            love1 = UserLoveInfo.objects.filter(userinfo=request.user, love_type=2, love_id=course.id)
            if love:
                is_love = love[0].love_status
            else:
                pass

            if love1:
                is_loveCourse = love1[0].love_status
            else:
                pass
        return render(request, 'courses/course-detail.html', {
            'course': course,
            'rec_courses': rec_courses,
            'is_love': is_love,
            'is_loveCourse': is_loveCourse
        })


@login_decorator
def course_video(request, course_id):
    if course_id:
        course = CourseInfo.objects.filter(id=int(course_id))[0]
        # 这个逻辑是用来判断用户学习课程的表当中是否学习过这个课程，如果没有学习过就添加记录
        usercourse = UserCourseInfo.objects.filter(userinfo=request.user, courseinfo_id=int(course_id))
        if not usercourse:
            a = UserCourseInfo()
            a.userinfo = request.user
            a.courseinfo = course
            a.save()

        # 这个逻辑是用来找到学过该课程的学生还学过的课程
        # 第一步，找到所有有关这个课程的 用户课程对象
        usercourseobjs = UserCourseInfo.objects.filter(courseinfo=course)
        # 第二步，通过这个所有的用户课程对象，可以实现找到所有的学过这个课程的用户
        userids_list = [usercourse.userinfo_id for usercourse in usercourseobjs]
        # 第三步，通过遍历这所有的用户，找到所有用户课程
        usercourse_list = UserCourseInfo.objects.filter(userinfo_id__in=userids_list)
        # 第四步，通过第三步找到的用户课程去拿课程
        course_list = [usercourse.courseinfo for usercourse in usercourse_list]
        # 第五步，为了防止重复，我们可以使用集合去重
        course_list = list(set(course_list))
        course_list = [course1 for course1 in course_list if course1.id != course.id][:3]

        return render(request, 'courses/course-video.html', {
            'course': course,
            'course_list': course_list
        })


def course_comment(request, course_id):
    if course_id:
        course = CourseInfo.objects.filter(id=int(course_id))[0]
        # 这个逻辑是用来找到学过该课程的学生还学过的课程
        # 第一步，找到所有有关这个课程的 用户课程对象
        usercourseobjs = UserCourseInfo.objects.filter(courseinfo=course)
        # 第二步，通过这个所有的用户课程对象，可以实现找到所有的学过这个课程的用户
        userids_list = [usercourse.userinfo_id for usercourse in usercourseobjs]
        # 第三步，通过遍历这所有的用户，找到所有用户课程
        usercourse_list = UserCourseInfo.objects.filter(userinfo_id__in=userids_list)
        # 第四步，通过第三步找到的用户课程去拿课程
        course_list = [usercourse.courseinfo for usercourse in usercourse_list]
        # 第五步，为了防止重复，我们可以使用集合去重
        course_list = list(set(course_list))
        course_list = [course1 for course1 in course_list if course1.id != course.id][:3]

        all_comment = UserCommentInfo.objects.filter(courseinfo=course)

        return render(request, 'courses/course-comment.html', {
            'course': course,
            'course_list': course_list,
            'all_comment': all_comment
        })
