# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import Category,Goods


class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name','add_time']
    list_per_page = 10
    list_filter = ['name']
    search_fields = ['name','add_time']

class GoodsAdmin(admin.ModelAdmin):
    list_display = ['goods_name','goods_price','goods_image','goods_num','category','add_time']
    list_per_page = 10
    list_filter = ['goods_name','goods_price','goods_image','goods_num','category']
    search_fields = ['goods_name','goods_price','goods_image','goods_num','category','add_time']

admin.site.register(Category,CategoryAdmin)
admin.site.register(Goods,GoodsAdmin)