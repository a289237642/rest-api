from datetime import datetime

from django.db import models

from items.models import Funding, PayBack
from users.models import UserProfile, Address


# Create your models here.

class UserFav(models.Model):
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
    status = models.BooleanField(default=True, verbose_name='收藏状态')

    user = models.ForeignKey(UserProfile, verbose_name='用户')
    funding = models.ForeignKey(Funding, verbose_name='众筹项目')

    def __str__(self):
        return self.user.username

    class Meta:
        unique_together = ('user', 'funding')

        verbose_name = '用户收藏信息'
        verbose_name_plural = verbose_name


class UserSupport(models.Model):
    num = models.IntegerField(default=1, verbose_name='支持数量')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
    order_amount = models.FloatField(default=0, verbose_name='订单金额')
    success = models.BooleanField(default=False, verbose_name='支付成功')
    order_sn = models.CharField(max_length=30, verbose_name='订单号码', null=True, blank=True)
    trade_sn = models.CharField(max_length=50, verbose_name='交易编号', null=True, blank=True)
    signer_name = models.CharField(max_length=30, verbose_name='签收人', null=True, blank=True)
    address = models.CharField(max_length=100, verbose_name='签收地址', null=True, blank=True)
    signer_mobile = models.CharField(max_length=11, verbose_name='签收电话', null=True, blank=True)
    message = models.CharField(max_length=200, verbose_name='备注', null=True, blank=True)
    invoice_title = models.CharField(max_length=20, verbose_name='发票抬头', null=True, blank=True)
    pay_time = models.DateTimeField(verbose_name='支付时间', null=True, blank=True)

    # address = models.ForeignKey(Address,verbose_name='地址')
    user = models.ForeignKey(UserProfile, verbose_name='用户')
    payback = models.ForeignKey(PayBack, verbose_name='回报')

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name = '用户支持信息'
        verbose_name_plural = verbose_name


class Banner(models.Model):
    image = models.ImageField(max_length=200, verbose_name='轮播图')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    funding = models.ForeignKey(Funding, verbose_name='项目')

    def __str__(self):
        return self.funding.name

    class Meta:
        verbose_name = '轮播图信息'
        verbose_name_plural = verbose_name
