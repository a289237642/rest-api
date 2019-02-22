# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import time
from django.shortcuts import render,redirect,reverse
from carts.models import CartInfo
from .models import OrderInfo,OrderDetail
from django.db import transaction
from django.http import JsonResponse
# Create your views here.
def orders_begin(request):
    cart_info = CartInfo.objects.filter(user_id=request.user.id,is_select=True)
    return render(request,'orders/place_order.html',{
        'cart_info':cart_info,
    })

@transaction.atomic()
def orders_add(request):
    '''
        1、创建订单
        2、根据订单创建订单详情
        3、判断订单详情数量和库存数量的对比
        4、库存大于订单详情，创建成功，返回到用户中心订单页,库存减去订单上商品数量，库存小于订单详情数，回滚事务，返回购物车页
        5、清空所有下过订单的购物车，返回到用户中心
    '''
    tpoint = transaction.savepoint()
    zongjia = request.GET.get('zongjia','')
    cart_ids = request.GET.get('cart_ids','')
    if zongjia:
        neworder = OrderInfo()
        neworder.order_number = '%s'%time.time()
        neworder.user_id = request.user.id
        neworder.totle = float(zongjia)
        neworder.save()
        if cart_ids:
            cart_ids = cart_ids.split(',')
            cart_ids.pop()
            print(cart_ids)
            for cart_id in cart_ids:
                cart = CartInfo.objects.filter(id=int(cart_id))
                if cart:
                    neworderdetail = OrderDetail()
                    neworderdetail.goods_id = cart[0].goods.id
                    neworderdetail.order_id = neworder.id
                    neworderdetail.price = cart[0].goods.goods_price
                    neworderdetail.count = cart[0].number
                    if neworderdetail.count > cart[0].goods.goods_num:
                        transaction.savepoint_rollback(tpoint)
                        return redirect(reverse('carts:carts_list'))
                    else:
                        neworderdetail.save()
                        cart[0].goods.goods_num-=cart[0].number
                        cart[0].goods.save()
            CartInfo.objects.filter(user_id=request.user.id,is_select=True).delete()
            transaction.savepoint_commit(tpoint)
            context = {'result': 'ok'}
            return JsonResponse(context)









