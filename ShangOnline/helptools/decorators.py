#encoding=utf-8
#__Author__: weesmile
#__Date__: 2018-06-23

from django.shortcuts import redirect,reverse
from django.http import JsonResponse
#闭包
#装饰器：
# login_decorator(f1)()
# @login_decorator
# f1

def login_decorator(func):
    '''
    这个函数是一个登录验证的装饰器，它还包含了对ajax登录的验证
    :param func: func是对谁去装饰，这个参数是被装饰的一个函数
    :return: 装饰器装饰过后，返回的一个新功能函数
    '''
    def login_handler(request,*args,**kwargs):
        if request.user.is_authenticated():
            return func(request,*args,**kwargs)
        else:
            if request.is_ajax():#这个方法可以判断当前的请求是不是ajax请求
                return JsonResponse({'status':'nologin'})
            url = request.get_full_path()
            # request.get_full_path()这个方法可以获取全的路径，包含协议和ip、get请求参数
            #request.path它获取的只是路径部分，不包含协议和ip也不包含get请求参数
            ret = redirect(reverse('users:user_login'))
            ret.set_cookie('url',url)
            return ret
    return login_handler