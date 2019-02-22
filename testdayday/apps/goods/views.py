# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from .models import Goods,Category
from carts.models import CartInfo
from django.core.paginator import Paginator,PageNotAnInteger,EmptyPage
from django.db.models import Q,F
# Create your views here.
def goods_detail(request,goods_id):
    good_old = Goods.objects.filter(id=1,goods_price=10)
    print(good_old)
    # all_goods = Goods.objects.all()
    good = Goods.objects.filter(id=int(goods_id))[0]
    good.goods_click = good.goods_click + 1
    good.save()
    new_goods = good.category.goods_set.order_by('-add_time')[:2]
    count = CartInfo.objects.filter(user_id=request.user.id).count()
    response =  render(request,'goods/detail.html',{
        'good':good,
        'new_goods':new_goods,
        'count':count
    })



    goods_ids = request.COOKIES.get('goods_ids','')
    if goods_ids:
        goods_ids = goods_ids.split(',') #['1']
        # print(goods_ids)
        if goods_ids.count(str(goods_id))>=1:
            goods_ids.remove(str(goods_id))
        goods_ids.append(str(goods_id))
        # print(goods_ids)
        if len(goods_ids)>=6:
            del goods_ids[0]
        goods_ids = ','.join(goods_ids)#'1,2'
        # print(goods_ids)
        response.set_cookie('goods_ids', str(goods_ids))
    else:
        response.set_cookie('goods_ids',str(goods_id))
    # print(goods_ids)
    return response



def goods_list(request,cat_id,sort_id,page_index):
    # all_goods = Goods.objects.all()
    count = CartInfo.objects.filter(user_id=request.user.id).count()
    print(page_index)
    if cat_id:
        catgory = Category.objects.filter(id=int(cat_id))[0]
        goods_list = catgory.goods_set.all()
        tui_goods = catgory.goods_set.all().order_by('-goods_num')[:2]
        pa = Paginator(goods_list,2)
        try:
            pages = pa.page(page_index)
        except PageNotAnInteger:
            pages = pa.page(1)
        except EmptyPage:
            pages = pa.page(pa.num_pages)
        return render(request,'goods/list.html',{
            'catgory':catgory,
            'tui_goods':tui_goods,
            'cat_id':cat_id,
            'sort_id':int(sort_id),
            'pages':pages,
            'count':count
        })