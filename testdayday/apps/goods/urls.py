#encoding=utf-8
__author__ = 'weesmile'
__date__ = '2017/12/9 0009 上午 10:01'
from django.conf.urls import url
from users.views import user_register,user_login,user_logout
from .views import goods_detail,goods_list
urlpatterns = [
    url(r'^goods_detail/(\d+)/$',goods_detail,name='goods_detail'),
    url(r'^goods_list/(\d+)_(\d+)_(\d+)/$',goods_list,name='goods_list'),
]