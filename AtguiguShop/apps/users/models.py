from datetime import datetime

from django.db import models
from django.db.models import Q
from django.contrib.auth.models import AbstractUser









# Create your models here.
class UserProfile(AbstractUser):
	"""用户配置"""
	#姓名
	#max_length=30，最多支持30个字符
	#null=True：Django 将空值以NULL 存储到数据库中，默认值是 False；因为当用手机注册的时候，这个可以为NULL
	#blank=True：如果为True，则该字段允许为空白，默认值是 False；因为当用手机注册的时候，这个可以为NULL
	#verbose_name:admin里面会显示这个别名
	name = models.CharField(max_length=30,null=True,blank=True,verbose_name="姓名")
	#出生年月
	birthday = models.DateField(null=True,blank=True,verbose_name="出生年月")
	#性别，默认设置是女性
	gender = models.CharField(max_length=6,choices=(("male",u"男"),("female",u"女")),default="female",verbose_name="性别")
	#电话
	mobile = models.CharField(max_length=11,blank=True,null=True,verbose_name="电话")
	#邮箱
	email = models.EmailField(max_length=100,null=True,blank=True,verbose_name="邮箱")

	#重载meta模块,修改Admin后台中显示的名称
	class Meta:
		verbose_name = "用户"
		verbose_name_plural = "用户"

	#返回展现的内容
	def __str__(self):
		# return self.name#会报错
		return self.username#这个正常
#短信验证码
class VerifyCode(models.Model):
	#验证码
	code = models.CharField(max_length=11,verbose_name="验证码")
	# 电话
	mobile = models.CharField(max_length=11, verbose_name="电话")
	#添加时间,注意default=datetime.now，不要括号
	add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")

	# 重载meta模块,修改Admin后台中显示的名称
	class Meta:
		verbose_name = "短信验证码"
		#后台显示的时候不在“短信验证码”加上s
		verbose_name_plural = verbose_name

	# 返回展现的内容
	def __str__(self):
		return self.code

