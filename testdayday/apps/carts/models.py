# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from users.models import UserProfile
from goods.models import Goods
# Create your models here.
class CartInfo(models.Model):
    user = models.ForeignKey(UserProfile,verbose_name="所属用户")
    goods = models.ForeignKey(Goods,verbose_name="所属商品")
    number = models.IntegerField(default=0,verbose_name="购买数量")
    is_select = models.BooleanField(default=True,verbose_name="是否选中")

    def __str__(self):
        return self.goods.goods_name

    class Meta:
        verbose_name = "购物车信息"
        verbose_name_plural = verbose_name

