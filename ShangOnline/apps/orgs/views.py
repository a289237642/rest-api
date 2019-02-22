from django.shortcuts import render
from .models import OrgInfo, TeacherInfo, CityInfo
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from operations.models import UserLoveInfo


# Create your views here.
def org_list(request):
    # 拿到所有的数据
    all_orgs = OrgInfo.objects.all()
    all_citys = CityInfo.objects.all()

    # 获取机构的排序
    sort_orgs = all_orgs.order_by('-add_time')[:3]

    # 根据类别过滤
    cat = request.GET.get('cat', '')
    if cat:
        all_orgs = all_orgs.filter(category=cat)

    # 根据城市过滤
    cityid = request.GET.get('cityid', '')
    if cityid:
        all_orgs = all_orgs.filter(cityinfo_id=int(cityid))

    # 排序
    sort = request.GET.get('sort', '')
    if sort == 'studynum':
        all_orgs = all_orgs.order_by('-study_num')
    if sort == 'coursenum':
        all_orgs = all_orgs.order_by('-course_num')

    pagenum = request.GET.get('pagenum', 1)
    pa = Paginator(all_orgs, 2)
    try:
        page_list = pa.page(pagenum)
    except PageNotAnInteger:
        page_list = pa.page(1)
    except EmptyPage:
        page_list = pa.page(pa.num_pages)

    return render(request, 'orgs/org-list.html', {
        'all_orgs': all_orgs,
        'all_citys': all_citys,
        'page_list': page_list,
        'cat': cat,
        'cityid': cityid,
        'sort': sort,
        'sort_orgs': sort_orgs
    })


def org_detail(request, org_id):
    if org_id:
        org = OrgInfo.objects.filter(id=int(org_id))[0]
        is_love = False
        if request.user.is_authenticated():
            love = UserLoveInfo.objects.filter(userinfo=request.user, love_type=1, love_id=int(org_id))
            if love:
                is_love = love[0].love_status
            else:
                pass

        return render(request, 'orgs/org-detail-homepage.html', {
            'org': org,
            'detail_type': 'homepage',
            'is_love': is_love
        })


def org_detail_course(request, org_id):
    if org_id:
        org = OrgInfo.objects.filter(id=int(org_id))[0]
        is_love = False
        if request.user.is_authenticated():
            love = UserLoveInfo.objects.filter(userinfo=request.user, love_type=1, love_id=int(org_id))
            if love:
                is_love = love[0].love_status
            else:
                pass
        return render(request, 'orgs/org-detail-course.html', {
            'org': org,
            'detail_type': 'course',
            'is_love': is_love
        })


def org_detail_desc(request, org_id):
    if org_id:
        org = OrgInfo.objects.filter(id=int(org_id))[0]
        is_love = False
        if request.user.is_authenticated():
            love = UserLoveInfo.objects.filter(userinfo=request.user, love_type=1, love_id=int(org_id))
            if love:
                is_love = love[0].love_status
            else:
                pass
        return render(request, 'orgs/org-detail-desc.html', {
            'org': org,
            'detail_type': 'desc',
            'is_love': is_love
        })


def org_detail_teacher(request, org_id):
    if org_id:
        org = OrgInfo.objects.filter(id=int(org_id))[0]

        is_love = False
        if request.user.is_authenticated():
            love = UserLoveInfo.objects.filter(userinfo=request.user, love_type=1, love_id=int(org_id))
            if love:
                is_love = love[0].love_status
            else:
                pass

        return render(request, 'orgs/org-detail-teachers.html', {
            'org': org,
            'detail_type': 'teacher',
            'is_love': is_love
        })


def teacher_list(request):
    all_teachers = TeacherInfo.objects.all()

    rec_teachers = all_teachers.order_by('-click_num')[:2]

    sort_type = request.GET.get('sort', '')
    if sort_type == 'hot':
        all_teachers = all_teachers.order_by('-love_num')

    pagenum = request.GET.get('pagenum', 1)
    pa = Paginator(all_teachers, 2)
    try:
        page_list = pa.page(pagenum)
    except PageNotAnInteger:
        page_list = pa.page(1)
    except EmptyPage:
        page_list = pa.page(pa.num_pages)

    return render(request, 'orgs/teachers-list.html', {
        'all_teachers': all_teachers,
        'page_list': page_list,
        'sort_type': sort_type,
        'rec_teachers': rec_teachers
    })


def teacher_detail(request, teacher_id):
    all_teachers = TeacherInfo.objects.all()
    rec_teachers = all_teachers.order_by('-click_num')[:2]
    if teacher_id:
        teacher = all_teachers.filter(id=int(teacher_id))[0]
        is_love = False
        is_loveTeacher = False
        if request.user.is_authenticated():
            love = UserLoveInfo.objects.filter(userinfo=request.user, love_type=1, love_id=teacher.orginfo.id)
            love1 = UserLoveInfo.objects.filter(userinfo=request.user, love_type=3, love_id=teacher.id)
            if love:
                is_love = love[0].love_status
            if love1:
                is_loveTeacher = love1[0].love_status

        return render(request, 'orgs/teacher-detail.html', {
            'teacher': teacher,
            'rec_teachers': rec_teachers,
            'is_love': is_love,
            'is_loveTeacher': is_loveTeacher
        })
