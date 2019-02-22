# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render,redirect,reverse
from .models import CartInfo
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from users.decorations import login_decoration
# Create your views here.
@login_required(login_url='/users/user_login/')
def carts_list(request):
    # user_id = request.session.get('user_id','')
    all_carts = CartInfo.objects.filter(user_id=request.user.id)
    return render(request,'carts/cart.html',{
        'all_carts':all_carts,
    })

# @login_required(login_url='/users/user_login/')
@login_decoration
def carts_add(request,goods_id,goods_num):
    info = CartInfo.objects.filter(user_id=request.user.id,goods_id=int(goods_id))
    if info:
        cart = info[0]
        cart.number = cart.number + int(goods_num)
    else:
        cart = CartInfo()
        cart.goods_id = int(goods_id)
        cart.user_id = request.user.id
        cart.number = int(goods_num)
    cart.save()
    if request.is_ajax():
        shu = CartInfo.objects.filter(user_id=request.user.id).count()
        count = {'count':shu}
        return JsonResponse(count)
    else:
        return redirect(reverse('carts:carts_list'))

def carts_update(request,goods_id,goods_num):
    info = CartInfo.objects.filter(user_id=request.user.id, goods_id=int(goods_id))
    if info:
        cart = info[0]
        cart.number = int(goods_num)
        cart.save()
        context = {'huifu':'ok'}
        return JsonResponse(context)

def carts_delete(request,cartid):
    info = CartInfo.objects.filter(id=cartid)[0]
    info.delete()
    context = {'huifu':'ok'}
    return JsonResponse(context)


def carts_select(request):
    cart_id = request.GET.get('cart_id','')
    val = request.GET.get('val','')
    cart_info = CartInfo.objects.filter(id=int(cart_id))[0]
    if int(val)==1:
        cart_info.is_select = True
    else:
        cart_info.is_select = False
    cart_info.save()
    if request.is_ajax():
        context = {'result':cart_info.is_select}
        return JsonResponse(context)
