from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

CRETIFY_CATEGORY = (
    (0, '未认证'),
    (1, '商业公司'),
    (2, '个体工商户'),
    (3, '个人经营'),
    (4, '政府及非营利组织'),
)


class UserProfile(AbstractUser):
    name = models.CharField(max_length=30, null=True, blank=True, verbose_name='用户昵称')
    cretify = models.IntegerField(default=0, choices=CRETIFY_CATEGORY, verbose_name='认证类型')
    real_name = models.CharField(max_length=30, null=True, blank=True, verbose_name='真实姓名')
    id_num = models.CharField(max_length=18, null=True, blank=True, verbose_name='身份证号')
    phone = models.CharField(max_length=11, null=True, blank=True, verbose_name='电话号码')
    id_photo = models.ImageField(max_length=200, upload_to='users/%y/%m', verbose_name='手持身份证照片')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    def __str__(self):
        return self.username

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name


class UserAuth(models.Model):
    cretify = models.IntegerField(default=0, choices=CRETIFY_CATEGORY, verbose_name='认证类型')
    real_name = models.CharField(max_length=30, null=True, blank=True, verbose_name='真实姓名')
    id_num = models.CharField(max_length=18, null=True, blank=True, verbose_name='身份证号')
    phone = models.CharField(max_length=11, null=True, blank=True, verbose_name='电话号码')
    id_photo = models.ImageField(max_length=200, upload_to='users/%y/%m', verbose_name='手持身份证照片')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
    # email = models.EmailField(max_length=100,verbose_name='邮箱', null=True, blank=True)

    user = models.ForeignKey(UserProfile, verbose_name='用户')

    def __str__(self):
        return self.real_name

    class Meta:
        verbose_name = '用户认证信息'
        verbose_name_plural = verbose_name


class EmailVerify(models.Model):
    email = models.EmailField(max_length=100, verbose_name='验证邮箱')
    code = models.CharField(max_length=6, verbose_name='验证码')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    def __str__(self):
        return self.code

    class Meta:
        verbose_name = '邮箱验证信息'
        verbose_name_plural = verbose_name


class Address(models.Model):
    signer_name = models.CharField(max_length=30, verbose_name='签收人')
    address = models.CharField(max_length=100, verbose_name='签收地址')
    signer_mobile = models.CharField(max_length=11, verbose_name='签收电话')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    user = models.ForeignKey(UserProfile, verbose_name='用户')

    def __str__(self):
        return self.signer_name

    class Meta:
        verbose_name = '地址信息'
        verbose_name_plural = verbose_name
