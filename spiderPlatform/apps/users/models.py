from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.
class UserProfile(AbstractUser):
    """用户配置"""
    # 姓名
    name = models.CharField(max_length=30, null=True, blank=True, verbose_name="姓名")
    # 出生年月
    birthday = models.DateField(null=True, blank=True, verbose_name="出生年月")
    # 性别，默认设置是女性
    gender = models.CharField(max_length=6, choices=(("male", "男"), ("female", "女")), default="female",
                              verbose_name="性别")
    # 电话
    mobile = models.CharField(max_length=11, blank=True, null=True, verbose_name="电话")
    # 邮箱
    email = models.EmailField(max_length=100, null=True, blank=True, verbose_name="邮箱")

    # 重载meta模块,修改Admin后台中显示的名称
    class Meta:
        verbose_name = "用户"
        verbose_name_plural = "用户"

    # 返回展现的内容
    def __str__(self):
        # return self.name#会报错
        return self.username  # 这个正常
