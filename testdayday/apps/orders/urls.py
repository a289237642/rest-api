#encoding=utf-8
__author__ = 'weesmile'
__date__ = '2017/12/9 0009 上午 10:01'
from django.conf.urls import url
from .views import orders_begin,orders_add
urlpatterns = [
    url(r'^orders_begin/$',orders_begin,name='orders_begin'),
    url(r'^orders_add/$',orders_add,name='orders_add'),
]