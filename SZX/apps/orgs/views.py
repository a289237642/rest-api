from django.shortcuts import render, redirect, reverse
from django.views import View
from orgs.models import OrgInfo, CityInfo
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage


# Create your views here.
class OrgListView(View):
    def get(self, request):
        # 拿到所有的数据
        all_orgs = OrgInfo.objects.all()
        all_citys = CityInfo.objects.all()

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

        pagenum = request.GET.get('pagenum', '')
        pa = Paginator(all_orgs, 3)
        try:
            page_list = pa.page(pagenum)
        except PageNotAnInteger:
            page_list = pa.page(1)
        except EmptyPage:
            page_list = pa.page(pa.num_pages)

        sort_orgs = all_orgs.order_by("-add_time")[:3]
        return render(request, 'orgs/org-list.html', {
            'all_orgs': all_orgs,
            'all_citys': all_citys,
            'sort_orgs': sort_orgs,
            'page_list': page_list,
            'pagenum': pagenum,
            'sort': sort,
            'cat': cat,
            'cityid': cityid,
        })
