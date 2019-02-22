from rest_framework import serializers
from .models import Goods,ShopingCart,OrderInfo,OrderGoods
from goods.serializers import GoodsSerializer

#购物车详情显示
class ShopingCartDetailSerializer(serializers.ModelSerializer):
	#外键
	goods = GoodsSerializer(many=False)
	class Meta:
		model = ShopingCart
		fields = "__all__"

#1.使用Serializer更加灵活
#2.unique_together校验的时候，如果存在了，再次添加的话,使用ModelSerializer校验就会报错
#3.在ViewSet中重新create也可以(实现post)，但是做一些验证最后实在Serializer里面，这里功能区分很清晰
#4.文档取的字段是根据Serializer中取的指段，否则文档缺失
#5.使用Serializer可以自己验证validate
class ShopingCartSerializer(serializers.Serializer):
	# 得到当前用户,在fields里面填写
	user = serializers.HiddenField(
		default=serializers.CurrentUserDefault()
	)

	#商品数量
	nums = serializers.IntegerField(required=True,min_value=1,error_messages={
		"required":"请选择购买数量",
		"min_value":"购买数量最新为1"
	})

	#商品
	goods = serializers.PrimaryKeyRelatedField(required=True,queryset=Goods.objects.all())

	#自定义怎么保存购物车商品--重点
	def create(self, validated_data):
		#要考虑：有记录和没有记录两种情况
		user = self.context["request"].user

		#商品数量
		nums = validated_data["nums"]

		#商品
		goods = validated_data["goods"]

		#查询是否存在
		exised = ShopingCart.objects.filter(user=user,goods=goods)
		if exised:
			exised = exised[0]
			#添加刚才的数量
			exised.nums += nums
			#保存
			exised.save()
		else:
			#创建
			exised = ShopingCart.objects.create(**validated_data)
		#记得返回
		return exised

	#重新跟新方法解决
	def update(self, instance, validated_data):
		instance.nums = validated_data["nums"]
		instance.save()
		return instance

class OrderSerializer(serializers.ModelSerializer):
	"""订单序列化器"""

	# 得到当前用户,在fields里面填写
	user = serializers.HiddenField(
		default=serializers.CurrentUserDefault()
	)

	#订单号不让前端编写
	order_sn = serializers.CharField(read_only=True)
	#交易号不让前端编写
	trade_sn = serializers.CharField(read_only=True)
	#支付状态
	pay_status = serializers.CharField(read_only=True)
	#支付时间
	pay_time = serializers.DateTimeField(read_only=True)
	#添加时间
	add_time = serializers.DateTimeField(read_only=True)

	#支付宝url
	alipay_url = serializers.SerializerMethodField(read_only=True)

	#obj就是OrderSerializer对象
	def get_alipay_url(self,obj):
		from AtguiguShop.settings import private_key_path, ali_public_path
		from utils.alipay import AliPay
		alipay = AliPay(
			appid="2016091300503105",
			# 异步的通知接口，当在浏览器扫描创建订单后，这个时候关闭页面，此时可以在客户端或者支护宝账号里面看到这个为支付完成的信息
			app_notify_url="http://118.190.202.67:8001/alipay/return/",
			app_private_key_path=private_key_path,
			alipay_public_key_path=ali_public_path,  # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
			debug=True,  # 默认False,
			# 同步接口，支付成功后会跳转的接口
			return_url="http://118.190.202.67:8001/alipay/return/"
		)
		url = alipay.direct_pay(
			subject=obj.order_sn,
			#商品id
			out_trade_no=obj.order_sn,
			#资金
			total_amount=obj.order_mount
		)
		# 沙箱环境
		re_url = "https://openapi.alipaydev.com/gateway.do?{data}".format(data=url)
		# print(re_url)
		return re_url

	#自定义生成订单号信息
	def generate_order_sn(self):
		import time
		from random import randint
		#"当前时间+userid+随机数"
		order_sn = "{time_str}{userid}{randstr}".format(time_str=time.strftime("%Y%m%d%H%M%S"),userid=self.context["request"].user,randstr=randint(10,99))
		return order_sn



	def validate(self, attrs):
		# 添加订单
		attrs["order_sn"] = self.generate_order_sn()
		return attrs

	class Meta:
		model = OrderInfo
		fields = "__all__"


#-------------------
#一个订单对应多个商品，商品再把商品的详细信息列出
class OrderGoodsSerialzier(serializers.ModelSerializer):
	goods = GoodsSerializer(many=False)
	class Meta:
		model = OrderGoods
		fields = "__all__"


#用的时候使用OrderSerializer和OrderDetailSerializer，
class OrderDetailSerializer(serializers.ModelSerializer):
	goods = OrderGoodsSerialzier(many=True)
	# 支付宝url
	alipay_url = serializers.SerializerMethodField(read_only=True)

	# obj就是OrderSerializer对象
	def get_alipay_url(self, obj):
		from AtguiguShop.settings import private_key_path, ali_public_path
		from utils.alipay import AliPay
		alipay = AliPay(
			appid="2016091300503105",
			# 异步的通知接口，当在浏览器扫描创建订单后，这个时候关闭页面，此时可以在客户端或者支护宝账号里面看到这个为支付完成的信息
			app_notify_url="http://127.0.0.1:8000/alipay/return/",
			app_private_key_path=private_key_path,
			alipay_public_key_path=ali_public_path,  # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
			debug=True,  # 默认False,
			# 同步接口，支付成功后会跳转的接口
			return_url="http://127.0.0.1:8000/alipay/return/"
		)
		url = alipay.direct_pay(
			subject=obj.order_sn,
			# 商品id
			out_trade_no=obj.order_sn,
			# 资金
			total_amount=obj.order_mount
		)
		# 沙箱环境
		re_url = "https://openapi.alipaydev.com/gateway.do?{data}".format(data=url)
		# print(re_url)
		return re_url
	class Meta:
		model = OrderInfo
		fields = "__all__"

