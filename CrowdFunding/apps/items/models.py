from datetime import datetime, timedelta

from django.db import models

from users.models import UserProfile


# Create your models here.

class Funding(models.Model):
    CATEGORY = (
        (1, '科技'),
        (2, '设计'),
        (3, '公益'),
        (4, '农业'),
    )

    STATUS = (
        (1, '众筹中'),
        (2, '众筹成功'),
        (3, '众筹失败'),
    )

    category = models.IntegerField(default=1, choices=CATEGORY, verbose_name='众筹类型')
    name = models.CharField(max_length=30, verbose_name='项目名称')
    brief = models.CharField(max_length=50, verbose_name='简介')
    target_amount = models.FloatField(verbose_name='筹资金额')
    curr_amount = models.FloatField(default=0, verbose_name='已筹金额')
    curr_support = models.IntegerField(default=0, verbose_name='支持人数')
    days_num = models.IntegerField(default=30, verbose_name='筹资天数')
    # 需要计算得到
    dead_line = models.DateTimeField(null=True, blank=True, verbose_name='截止日期')
    status = models.IntegerField(default=1, choices=STATUS, verbose_name='状态')
    fav_num = models.IntegerField(default=0, verbose_name='收藏数')

    front_image = models.ImageField(max_length=100, upload_to='fundings/%y/%m', verbose_name='项目头图')
    detail_image = models.ImageField(max_length=100, upload_to='fundings/%y/%m', verbose_name='项目详情（图）')

    sponser_brief = models.CharField(max_length=40, verbose_name='自我介绍')
    sponser_desc = models.CharField(max_length=160, verbose_name='详细自我介绍')
    contact_phone = models.CharField(max_length=11, verbose_name='联系电话')
    service_tel = models.CharField(max_length=11, verbose_name='客服电话')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    alipay_id = models.CharField(max_length=50, verbose_name='企业账户', null=True, blank=True)
    legal_person = models.CharField(max_length=18, verbose_name='法人身份证号码', null=True, blank=True)

    # 即使设置null=True,blank=True，外键也无法为空！！！！！
    user = models.ForeignKey(UserProfile, verbose_name='用户', null=True, blank=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '众筹信息'
        verbose_name_plural = verbose_name


class PayBack(models.Model):
    CATEGORY = (
        (1, '实物回报'),
        (2, '虚拟物品回报'),
    )

    category = models.IntegerField(default=1, choices=CATEGORY, verbose_name='回报类型')
    payment = models.FloatField(verbose_name='支付金额')
    payback_content = models.CharField(max_length=200, verbose_name='回报内容')
    image = models.ImageField(max_length=100, upload_to='fundings/%y/%m', verbose_name='说明图片')
    # 0 表示不限回报数量
    payback_num = models.IntegerField(default=0, verbose_name='回报数量')
    # 0 表示不限购
    limitation = models.IntegerField(default=0, verbose_name='单笔限购')
    freight = models.FloatField(default=0, verbose_name='运费')
    invoice = models.BooleanField(default=False, verbose_name='可否开发票')
    payback_time = models.IntegerField(verbose_name='回报时间')
    support_num = models.IntegerField(default=0, verbose_name='支持人数')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    funding = models.ForeignKey(Funding, verbose_name='众筹项目')

    def __str__(self):
        return self.funding.name

    class Meta:
        verbose_name = '回报信息'
        verbose_name_plural = verbose_name
