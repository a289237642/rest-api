#encoding=utf-8
#__Author__: weesmile
#__Date__: 2018-07-28
from django.shortcuts import redirect,reverse
from django.http import JsonResponse
def login_decoration(func):
    def inner(request,*args,**kwargs):
        if request.user.is_authenticated():
            return func(request,*args,**kwargs)
        else:
            if request.is_ajax():
                return JsonResponse({'status':'nologin'})
            url = request.get_full_path()
            #request.path和request.get_full_path之间的区别
            ret = redirect(reverse('users:user_login'))
            ret.set_cookie('url',url)
            return ret
    return inner



