# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import  datetime
# Create your models here.
class UserProfile(AbstractUser):
    nike_name = models.CharField(max_length=20,verbose_name="用户昵称",default="新用户")
    phone = models.CharField(max_length=11,verbose_name="联系方式",null=True,blank=True)
    address= models.CharField(max_length=200,verbose_name="地址",null=True,blank=True)
    image = models.ImageField(max_length=100,verbose_name="用户头像",upload_to='users/%y/%m/%d',null=True,blank=True)
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")
    def __str__(self):
        return self.username

    class Meta:
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name

# class ReciveInfo(models.Model):


