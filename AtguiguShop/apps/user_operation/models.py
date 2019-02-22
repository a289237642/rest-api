from django.db import models
from django.contrib.auth import get_user_model
from goods.models import Goods
from datetime import datetime
User = get_user_model()
# Create your models here.
class UserFav(models.Model):
	"""
	用户收藏
	"""
	#用户
	user = models.ForeignKey(User,verbose_name="用户")
	#商品
	goods = models.ForeignKey(Goods,verbose_name="商品")
	#添加时间
	add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

	# 重载meta模块,修改Admin后台中显示的名称
	class Meta:
		verbose_name = "用户收藏"
		verbose_name_plural = verbose_name
		#校验User和Goods是否唯一对应
		unique_together = ("user","goods")

	def __str__(self):
		return self.user.username




#用户留言
class UserLeavingMessage(models.Model):
	"""
	用户留言
	"""

	MSG_TYPE = (
		(1,"留言"),
		(2,"投诉"),
		(3,"询问"),
		(4,"售后"),
		(4,"求购"),

	)
	#用户
	user = models.ForeignKey(User, verbose_name="用户")
	#留言主题
	subject = models.CharField(max_length=100,default="",verbose_name="留言主题")
	#留言类型,help_text可以在文档显示
	msg_type = models.IntegerField(default=1,choices=MSG_TYPE,verbose_name="留言类型",help_text="留言类型: 1(留言),2(投诉),3(询问),4(售后),5(求购)")
	#留言内容
	message = models.CharField(max_length=500,verbose_name="留言内容")

	#上传的文件
	file = models.FileField(upload_to="message/images/",verbose_name="上传的文件",help_text="上传的文件")
	#添加时间
	add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

	# 重载meta模块,修改Admin后台中显示的名称
	class Meta:
		verbose_name = "用户留言"
		verbose_name_plural = verbose_name

	def __str__(self):
		return "%s留言:%s" % (self.user.name,self.subject)


#收获地址
class UserAddress(models.Model):
	"""收获地址"""
	#用户
	user = models.ForeignKey(User, verbose_name="用户")
	#省
	province = models.CharField(max_length=50,default="",verbose_name="省")
	#市
	city = models.CharField(max_length=50,verbose_name="市")
	#区域
	district = models.CharField(max_length=100,verbose_name="区")
	#地址
	address = models.CharField(max_length=200,verbose_name="地址",default="")
	# 用户签收信息
	# 签收人
	signer_name = models.CharField(max_length=30, verbose_name="签收人")
	# 签收电话
	signer_mobile = models.CharField(max_length=11, verbose_name="联系电话")
	# 添加时间
	add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

	# 重载meta模块,修改Admin后台中显示的名称
	class Meta:
		verbose_name = "收货地址"
		verbose_name_plural = verbose_name

	def __str__(self):
		return self.address
