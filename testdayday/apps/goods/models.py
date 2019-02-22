# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from datetime import datetime
# Create your models here.

class Category(models.Model):
    name = models.CharField(max_length=20,verbose_name="商品类别")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "商品类别信息"
        verbose_name_plural = verbose_name

class Goods(models.Model):
    goods_id = models.CharField(max_length=30,verbose_name="商品编号",unique=True)
    goods_name = models.CharField(max_length=30,verbose_name="商品名称",unique=True)
    goods_price = models.DecimalField(max_digits=5,decimal_places=2,verbose_name="商品价格")
    goods_image = models.ImageField(max_length=100,null=True,blank=True,verbose_name="商品图片",upload_to='goods/%y/%m/%d')
    goods_desc = models.CharField(max_length=500,verbose_name="商品描述")
    goods_num = models.IntegerField(default=0,verbose_name="商品库存")
    goods_unit = models.CharField(max_length=10,verbose_name="商品单位")
    category = models.ForeignKey(Category,verbose_name="所属类别")
    goods_click = models.IntegerField(default=0,verbose_name="商品热度")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")

    def __str__(self):
        return self.goods_name

    class Meta:
        verbose_name = '商品信息'
        verbose_name_plural = verbose_name

