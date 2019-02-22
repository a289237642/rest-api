#encoding=utf-8
__author__ = 'weesmile'
__date__ = '2017/12/9 0009 上午 10:01'
from django.conf.urls import url
from .views import carts_list,carts_add,carts_update,carts_delete,carts_select
urlpatterns = [
    url(r'carts_list/$',carts_list,name='carts_list'),
    url(r'carts_add/(\d+)/(\d+)/$', carts_add, name='carts_add'),
    url(r'carts_update/(\d+)/(\d+)/$', carts_update, name='carts_update'),
    url(r'carts_delete/(\d+)/$', carts_delete, name='carts_delete'),
    url(r'carts_select/$', carts_select, name='carts_select'),
]