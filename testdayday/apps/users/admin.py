# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import UserProfile
# Register your models here.
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ['username','nike_name','image','add_time']
    list_per_page = 3
    list_filter = ['username','nike_name']
    search_fields = ['username','nike_name']

admin.site.register(UserProfile,UserProfileAdmin)