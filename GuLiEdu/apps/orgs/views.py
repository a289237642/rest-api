from django.shortcuts import render
from .models import OrgInfo, CityInfo, TeacherInfo
from operations.models import UserLove
from helptools.user_love_status import get_love_status
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.db.models import Q
from django.core.cache import cache
from django.views.decorators.cache import cache_page


# Create your views here.
@cache_page(60 * 15)
def org_list(request):
    # if 'all_orgs' in cache:
    #     all_orgs = cache.get('all_orgs')
    # else:
    #     all_orgs = OrgInfo.objects.all()
    #     cache.set('all_orgs',all_orgs,60*15)
    all_orgs = OrgInfo.objects.all()
    all_citys = CityInfo.objects.all()

    sort_orgs = all_orgs.order_by('-study_num')[:2]

    keyword = request.GET.get('keyword', '')
    if keyword:
        all_orgs = all_orgs.filter(
            Q(name__icontains=keyword) | Q(desc__icontains=keyword) | Q(detail__icontains=keyword))

    # 根据机构类别进行筛选过滤
    cat = request.GET.get('cat', '')
    if cat:
        all_orgs = all_orgs.filter(org_category=cat)

    # 根据城市名称进行筛选过滤
    cid = request.GET.get('cid', '')
    if cid:
        all_orgs = all_orgs.filter(city_id=int(cid))

    # 根据传过来的排序规则进行排序
    sort = request.GET.get('sort', '')
    if sort:
        if sort == 'stunum':
            all_orgs = all_orgs.order_by('-study_num')
        if sort == 'counum':
            all_orgs = all_orgs.order_by('-course_num')

    pa = Paginator(all_orgs, 2)
    pagenum = request.GET.get('pagenum', '')
    try:
        pages = pa.page(pagenum)
    except PageNotAnInteger:
        pages = pa.page(1)
    except EmptyPage:
        pages = pa.page(pa.num_pages)
    return render(request, 'orgs/org-list.html', {
        'all_orgs': all_orgs,
        'pages': pages,
        'all_citys': all_citys,
        'sort_orgs': sort_orgs,
        'cat': cat,
        'cid': cid,
        'sort': sort,
        'keyword': keyword
    })


def org_detail(request, orgid):
    if orgid:
        org = OrgInfo.objects.filter(id=int(orgid))[0]
        org.click_num += 1
        org.save()
        love_statu = get_love_status(request, orgid, 1)
        return render(request, 'orgs/org-detail-homepage.html', {
            'org': org,
            'detail_type': 'home',
            'love_statu': love_statu
        })


def org_detail_course(request, orgid):
    if orgid:
        org = OrgInfo.objects.filter(id=int(orgid))[0]
        all_courses = org.courseinfo_set.all()
        love_statu = get_love_status(request, orgid, 1)
        pa = Paginator(all_courses, 2)
        pagenum = request.GET.get('pagenum', '')
        try:
            pages = pa.page(pagenum)
        except PageNotAnInteger:
            pages = pa.page(1)
        except EmptyPage:
            pages = pa.page(pa.num_pages)
        return render(request, 'orgs/org-detail-course.html', {
            'org': org,
            'pages': pages,
            'detail_type': 'course',
            'love_statu': love_statu
        })


def org_detail_desc(request, orgid):
    if orgid:
        org = OrgInfo.objects.filter(id=int(orgid))[0]
        love_statu = get_love_status(request, orgid, 1)
        return render(request, 'orgs/org-detail-desc.html', {
            'org': org,
            'detail_type': 'desc',
            'love_statu': love_statu
        })


def org_detail_teacher(request, orgid):
    if orgid:
        org = OrgInfo.objects.filter(id=int(orgid))[0]
        love_statu = get_love_status(request, orgid, 1)
        return render(request, 'orgs/org-detail-teachers.html', {
            'org': org,
            'detail_type': 'teacher',
            'love_statu': love_statu
        })


def teacher_list(request):
    all_teachers = TeacherInfo.objects.all()
    sort_teachers = all_teachers.order_by('-add_time')[:2]

    keyword = request.GET.get('keyword', '')
    if keyword:
        all_teachers = all_teachers.filter(name__icontains=keyword)
    sort = request.GET.get('sort', '')
    if sort:
        all_teachers = all_teachers.order_by('-click_num')

    pa = Paginator(all_teachers, 2)
    pagenum = request.GET.get('pagenum', '')
    try:
        pages = pa.page(pagenum)
    except PageNotAnInteger:
        pages = pa.page(1)
    except EmptyPage:
        pages = pa.page(pa.num_pages)
    return render(request, 'orgs/teachers-list.html', {
        'pages': pages,
        'all_teachers': all_teachers,
        'sort_teachers': sort_teachers,
        'sort': sort,
        'keyword': keyword
    })


def teacher_detail(request, teacherid):
    if teacherid:
        teacher = TeacherInfo.objects.filter(id=int(teacherid))[0]
        teacher.click_num += 1
        teacher.save()
        sort_teachers = teacher.org.teacherinfo_set.order_by('-love_num')[:2]
        love_statu = get_love_status(request, teacher.org.id, 1)
        love_teastatu = get_love_status(request, teacher.id, 3)
        return render(request, 'orgs/teacher-detail.html', {
            'teacher': teacher,
            'sort_teachers': sort_teachers,
            'love_statu': love_statu,
            'love_teastatu': love_teastatu
        })
