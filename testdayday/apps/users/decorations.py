#encoding=utf-8
__author__ = 'weesmile'
__date__ = '2017/12/27 0027 上午 11:30'
from django.shortcuts import render,redirect,reverse
def login_decoration(func):
    def login_handler(request,*args,**kwargs):
        if request.session.has_key('userid'):
            return func(request,*args,**kwargs)
        else:
            url = request.get_full_path()
            ret = redirect(reverse('users:user_login'))
            ret.set_cookie('url',url)
            return ret
    return login_handler

# login_decoration(user_info)