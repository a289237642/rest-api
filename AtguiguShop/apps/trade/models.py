from django.db import models

from django.contrib.auth import get_user_model
from goods.models import Goods
from datetime import datetime
# Create your models here.
#-----------------
User = get_user_model()
class ShopingCart(models.Model):
	"""
	购物车
	"""
	#用户,u是unicode码
	user = models.ForeignKey(User,verbose_name=u"用户")
	#商品
	goods = models.ForeignKey(Goods,verbose_name=u"商品")
	#商品数量
	nums = models.IntegerField(default=0,verbose_name="商品数量")
	#添加时间
	add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")

	class Meta:
		verbose_name = "购物车"
		verbose_name_plural = verbose_name
		#用户，商品都要同时存在,购物车联合唯一索引
		unique_together = ("user","goods")

	def __str__(self):
		return self.goods.name


#订单
class OrderInfo(models.Model):
	"""订单"""

	#订单状态：单词变大写或者小写：ctr+shift+u
	ORDER_STATUS = (
		("PAYING","待支付"),
		("TRADE_SUCESS", "支付成功"),
		("TRADE_CLOSE", "支付关闭"),
		("TRADE_FAIL", "支付失败"),
		("TRADE_FINSHED", "交易结束"),
	)

	#用户
	user = models.ForeignKey(User,verbose_name=u"用户")
	#订单号
	#unique=True:其他数据中不能出现和当前订单一样的订单号
	order_sn = models.CharField(null=True,blank=True,max_length=30,unique=True,verbose_name="订单号")
	#交易编号，和第三方交易产生的
	trade_no = models.CharField(max_length=100,unique=True,blank=True,null=True,verbose_name="交易号")
	#支付状态
	pay_status = models.CharField(default="PAYING",null=True,blank=True,max_length=30,choices=ORDER_STATUS,verbose_name="订单状态")
	#订单留言
	post_script = models.CharField(max_length=200,verbose_name="订单留言")
	#订单金额
	order_mount = models.FloatField(default=0.0,verbose_name="订单金额")
	#支付时间，什么时候支付的，这个不需要获取当前的
	pay_time = models.DateTimeField(null=True,blank=True,verbose_name="支付时间")


	#用户签收信息,这个要单独保存，好处是，用户在个人中心修改了地址的情况下，这里不会被修改
	#签收人
	signer_name = models.CharField(max_length=30,verbose_name="签收人")
	#签收电话
	signer_mobile = models.CharField(max_length=11,verbose_name="联系电话")
	#签收地址
	address = models.CharField(max_length=200,verbose_name="收货地址")
	# 添加时间
	add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

	class Meta:
		verbose_name = "订单"
		verbose_name_plural = verbose_name

	def __str__(self):
		return str(self.order_sn)


#因为一个订单可能会有多个商品，所以订单和商品是一对多的关系
#订单详情
class OrderGoods(models.Model):

	"""订单商品详情"""
	#订单
	order = models.ForeignKey(OrderInfo,verbose_name=u"订单",related_name="goods")
	#商品
	goods = models.ForeignKey(Goods,verbose_name=u"商品")
	#商品数量
	goods_num = models.IntegerField(default=0, verbose_name="商品数量")
	#添加时间
	add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

	class Meta:
		verbose_name = "订单商品详情"
		verbose_name_plural = verbose_name

	def __str__(self):
		#打印订单编号
		return str(self.order.order_sn)









