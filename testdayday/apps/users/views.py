# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render,redirect,reverse,HttpResponseRedirect
from .forms import RegisterForm,LoginForm
from .models import UserProfile
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate,login,logout
from goods.models import Category,Goods
from carts.models import CartInfo
from users.decorations import login_decoration
from orders.models import OrderInfo,OrderDetail
def index(request):
    user_id = request.session.get('user_id','')
    all_category = Category.objects.all()
    count = CartInfo.objects.filter(user_id=request.user.id).count()
    # type00= all_category[0].goods_set.all().order_by('-click_num')[:3]
    # type01 = all_category[0].goods_set.all().order_by('-add_time')[:4]
    return render(request,'users/index.html',{
        'all_category':all_category,
        'count':count
    })


def user_register(request):
    if request.method == "GET":
        return render(request,'users/register.html')
    else:
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            username = register_form.cleaned_data['username']
            password = register_form.cleaned_data['password']
            password1 = register_form.cleaned_data['password1']
            email = register_form.cleaned_data['email']
            user = UserProfile.objects.filter(username=username)
            if user:
                return render(request,'users/register.html',{
                    'msg':'用户名已存在'
                })
            else:
                if password==password1:
                    a = UserProfile.objects.create(username=username,password=password1,email=email)
                    a.set_password(password)
                    a.save()
                    return redirect(reverse('users:user_login'))
                else:
                    return render(request, 'users/register.html', {
                        'msg': '两次密码不一致'
                    })
        else:
            return render(request,'users/register.html',{
                    'forms':register_form
                })

def user_login(request):
    if request.method == "GET":
        uname = request.COOKIES.get('uname', '')
        return render(request,'users/login.html',{
            'uname':uname,
        })
    else:
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            username = login_form.cleaned_data['username']
            password = login_form.cleaned_data['password']
            user = authenticate(username=username,password=password)
            if user:
                login(request, user)
                # request.session.set_expiry(0)
                request.session['userid'] = user.id
                xuanze = request.POST.get("xuanze",'')
                url = request.COOKIES.get('url','/')
                ret = HttpResponseRedirect(url)
                if xuanze == 'on':
                    ret.set_cookie('uname',username)
                    return ret
                else:
                    ret.delete_cookie('uname')
                    return ret
            else:
                return render(request,'users/login.html',{
                    'msg':'用户名或者密码错误'
                })
        else:
            return render(request, 'users/login.html', {
                'forms': login_form,
            })

def user_logout(request):
    logout(request)
    return redirect(reverse('index'))
@login_decoration

def user_info(request):
    # user_id = request.session.get('user_id','')
    # user = UserProfile.objects.filter(id = user_id)[0]

    goods_ids = request.COOKIES.get('goods_ids','')
    if goods_ids:
        goods_ids = goods_ids.split(',')
        # print(goods_ids)
        goods_list = Goods.objects.filter(id__in=goods_ids)
        return render(request,'users/user_center_info.html',{
            'goods_list':goods_list
        })
    else:
        return render(request, 'users/user_center_info.html')

def user_address(request):

    return render(request,'users/user_center_site.html')

def user_order(request):
    all_order = OrderInfo.objects.filter(user_id=request.user.id)
    return render(request,'users/user_center_order.html',{
        'all_order':all_order
    })