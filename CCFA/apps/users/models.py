from datetime import datetime
from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.
class UserProfile(AbstractUser):
    nick_name = models.CharField(max_length=20, verbose_name="用户昵称", default='')
    birthday = models.DateField(null=True, blank=True, verbose_name="用户生日")
    gender = models.CharField(choices=(('girl', '女'), ('boy', '男')), max_length=5, verbose_name="用户性别", default='girl')
    address = models.CharField(max_length=200, verbose_name="用户地址", null=True, blank=True)
    phone = models.CharField(max_length=11, verbose_name="用户手机", null=True, blank=True)
    card = models.CharField(max_length=18, verbose_name="身份证号码", blank=True, null=True)
    cardImage = models.ImageField(upload_to='card/%y/%m', verbose_name='身份认证图片', null=True, blank=True, max_length=200)
    image = models.ImageField(upload_to='user/%y/%m', verbose_name="用户头像", null=True, blank=True, max_length=200)
    type = models.CharField(choices=(('sy', '商业公司'), ('gt', '个体工商户'), ('gr', '个人经营'), ('zf', '政府及非营利组织')),
                            max_length=20, verbose_name='类型')
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    def __str__(self):
        return self.username

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name


class EmailVerify(models.Model):
    email = models.EmailField(max_length=100, verbose_name="邮箱")
    code = models.CharField(max_length=20, verbose_name="验证码")
    send_type = models.CharField(choices=(('register', '注册'), ('forget', '修改'), ('changeemail', '修改邮箱')), max_length=20,
                                 verbose_name='验证码类型')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='发送时间')

    def __str__(self):
        return self.code

    class Meta:
        verbose_name = '邮箱验证码'
        verbose_name_plural = verbose_name


class Banner(models.Model):
    image = models.ImageField(upload_to='banner/%y/%m', verbose_name="轮播图片", max_length=200)
    # url = models.URLField(max_length=100, verbose_name="轮播图片链接")
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    def __str__(self):
        return str(self.image)

    class Meta:
        verbose_name = '轮播图信息'
        verbose_name_plural = verbose_name
