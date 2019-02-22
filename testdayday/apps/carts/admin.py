# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import CartInfo
# Register your models here.
class CartInfoAdmin(admin.ModelAdmin):
    list_display = ['user','goods','number']
    fields = ['user','goods','number']
    list_filter = ['user','goods','number']

admin.site.register(CartInfo,CartInfoAdmin)

