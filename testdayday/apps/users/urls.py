#encoding=utf-8
__author__ = 'weesmile'
__date__ = '2017/12/9 0009 上午 10:01'

from django.conf.urls import url
from .views import user_info
from users.views import user_register,user_login,user_logout,user_address,user_order
urlpatterns = [
    url(r'^user_register/$',user_register,name='user_register'),
    url(r'^user_login/$', user_login, name='user_login'),
    url(r'^user_logout/$', user_logout, name='user_logout'),
    url(r'^user_info/$', user_info, name='user_info'),
    url(r'^user_address/$', user_address, name='user_address'),
    url(r'^user_order/$', user_order, name='user_order'),
]