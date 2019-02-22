from django.shortcuts import render
from .models import ProjectInfo, ImageInfo, CatgoryInfo
from django.views import View
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from datetime import timedelta, datetime


class ItemDetailView(View):
    """项目详情"""

    def get(self, request, pro_id):
        all_catgoryInfo = ProjectInfo.objects.all().order_by("-add_time")[:2]
        if pro_id:
            item = ProjectInfo.objects.filter(id=int(pro_id))[0]
            many_day = (item.end_time - datetime.now()).days

        return render(request, 'items/project.html',
                      {'item': item,
                       'many_day': many_day,
                       'all_catgoryInfo': all_catgoryInfo,
                       })

    def post(self, request):
        pass


class ItemListView(View):
    """项目列表"""

    # 处理截止日期
    def handleTime(self, all_project):
        for ti in all_project:
            ti.end_time = ti.add_time + timedelta(days=ti.days)
            ti.save()

    def get(self, request):
        all_catgoryInfo = CatgoryInfo.objects.all()
        all_project = ProjectInfo.objects.all()
        self.handleTime(all_project)
        # 搜索
        keywords = request.GET.get('keywords', '')
        if keywords:
            all_project = all_project.filter(title__contains=keywords)
        # 根据状态排序
        cat = request.GET.get('cat', '')
        if cat:
            all_project = all_project.filter(status=cat)

        # 根据分类排序
        catgoryid = request.GET.get('catgoryid', '')
        if catgoryid:
            all_project = all_project.filter(categoryinfo__id=int(catgoryid))
        # 排序
        sort = request.GET.get('sort', '')
        if sort == 'news':
            all_project = all_project.order_by("-add_time")
        if sort == 'money':
            all_project = all_project.order_by("-money_total")
        if sort == 'person':
            all_project = all_project.order_by("nums")

        # 分页
        pagenum = request.GET.get('pagenum', 1)
        pa = Paginator(all_project, 2)
        try:
            page_list = pa.page(pagenum)
        except PageNotAnInteger:
            page_list = pa.page(1)
        except EmptyPage:
            page_list = pa.page(pa.num_pages)
        return render(request, 'items/projects.html',
                      {"all_project": all_project,
                       "sort": sort,
                       'all_catgoryInfo': all_catgoryInfo,
                       'catgoryid': catgoryid,
                       'cat': cat,
                       'keywords': keywords,
                       "page_list": page_list})

    def post(self, request):
        pass
