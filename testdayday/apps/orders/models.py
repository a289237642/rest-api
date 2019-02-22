# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from datetime import datetime
from django.db import models
from goods.models import Goods
from users.models import UserProfile

# Create your models here.

class OrderInfo(models.Model):
    order_number = models.CharField(max_length=30,verbose_name="订单号")
    user = models.ForeignKey(UserProfile,verbose_name="所属用户")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="创建时间")
    is_pay= models.BooleanField(default=False,verbose_name="是否支付")
    totle = models.DecimalField(max_digits=7,decimal_places=2,verbose_name="订单总价")
    def __str__(self):
        return self.order_number
    class Meta:
        verbose_name = "订单信息"
        verbose_name_plural = verbose_name

class OrderDetail(models.Model):
    order = models.ForeignKey(OrderInfo,verbose_name="所属订单")
    goods = models.ForeignKey(Goods,verbose_name="所属商品")
    price = models.DecimalField(max_digits=5,decimal_places=2,verbose_name="商品单价")
    count = models.IntegerField(default=1,verbose_name="所买数量")
    def __str__(self):
        return self.goods.goods_name
    class Meta:
        verbose_name = "订单详情"
        verbose_name_plural = verbose_name