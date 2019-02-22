from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import SessionAuthentication
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from utils.permissions import IsOwnerOrReadOnly
from rest_framework import mixins

from .models import ShopingCart,OrderInfo,OrderGoods

from .serializers import OrderDetailSerializer,OrderSerializer,ShopingCartSerializer,ShopingCartDetailSerializer

class ShopingCartViewSet(viewsets.ModelViewSet):
	"""
	list:
		得到购物车列表
	create:
		添加商品到购车
	delete:
		删除购物车某商品
	update:
		修改购物车商品
	"""
	# serializer_class = ShopingCartSerializer
	# 这个时候删除某个地址的时候就会验证是否是对应用户的地址--IsOwnerOrReadOnly
	permission_classes = (IsAuthenticated, IsOwnerOrReadOnly,)

	# JWT认证
	authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)

	# 设置支持外键字段http://118.190.202.67:8000/shopcarts/1/那么1就是商品id
	lookup_field = "goods_id"

	#根据/shopcarts/和/shopcarts/1/返回不同的数据
	def get_serializer_class(self):
		if self.action == "list":
			return ShopingCartDetailSerializer
		else:
			return ShopingCartSerializer

	def get_queryset(self):
		# 返回当前登录用户的信息
		return ShopingCart.objects.filter(user=self.request.user)

	#当添加商品到购物车的时候库存数减少
	def perform_create(self, serializer):
		shop_cart = serializer.save()
		# print(instance)
		goods = shop_cart.goods
		#商品的库存减少
		goods.goods_num -= shop_cart.nums
		goods.save()
	#当重购物车删除要购买的商品的时候库存增加（不购买了）
	def perform_destroy(self, instance):
		print(instance)
		goods = instance.goods
		#商品库存增加
		goods.goods_num += instance.nums
		goods.save()
		instance.delete()


	#修改思路
	#使用保存后的库存数减掉保存前的库存数，-=它们的差值

	def perform_update(self, serializer):
		#得到保存前的库存数
		old_shop_cart = ShopingCart.objects.get(id=serializer.instance.id)
		#当前购物车的商品数量
		pre_goods_num = old_shop_cart.nums
		# 保存之后的库存数
		new_shop_cart = serializer.save()
		new_goods_num = new_shop_cart.nums

		#差值
		nums = new_goods_num - pre_goods_num

		#得到购物车里面对应的商品类
		goods = old_shop_cart.goods

		goods.goods_num -= nums

		goods.save()









class OrderViewSet(mixins.RetrieveModelMixin,mixins.CreateModelMixin,mixins.ListModelMixin,mixins.DestroyModelMixin,viewsets.GenericViewSet):
	"""订单管理
	list:
		获取个人订单
	create:
		添加订单
	delete:
		删除订单
	retrieve:
		订单详情信息

	"""
	# serializer_class = ShopingCartSerializer
	# 这个时候删除某个地址的时候就会验证是否是对应用户的地址--IsOwnerOrReadOnly
	permission_classes = (IsAuthenticated, IsOwnerOrReadOnly,)
	# JWT认证
	authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
	#序列化器
	# serializer_class = OrderSerializer
	def get_queryset(self):
		#过滤得到当前用户的订单列表
		return OrderInfo.objects.filter(user=self.request.user)

	def get_serializer_class(self):
		if self.action == "retrieve":
			return OrderDetailSerializer
		else:
			return OrderSerializer


	#重新改方法用户提交订单
	def perform_create(self, serializer):
		order = serializer.save()
		#得到当前用户购物车所有信息
		shop_carts = ShopingCart.objects.filter(user=self.request.user)
		for shop_cart in shop_carts:
			#把数据和OrderGoods对应起来
			order_goods = OrderGoods()
			#订单
			order_goods.order = order
			#商品
			order_goods.goods = shop_cart.goods
			#商品数量
			order_goods.goods_num = shop_cart.nums
			#保存订单和商品关联的Model
			order_goods.save()

			#把该条信息在购车中删除--订单提交后，清空购物车
			shop_cart.delete()
		return order


from rest_framework import views
#因为没有支付没有用到单独的model所有用最底层的view
#重写get和post
from utils.alipay import AliPay
from AtguiguShop.settings import private_key_path,ali_public_path
from datetime import datetime
from rest_framework.response import Response
from django.shortcuts import redirect
class AlipayView(views.APIView):
	#如果用网页登陆支付，走这里
	def get(self, request):
		"""
		处理支付宝返回的return_url
		:param request:
		:return:
		"""

		processed_dict = {}
		for key, value in request.GET.items():
			processed_dict[key] = value
		# 得到签名
		sign = processed_dict.pop("sign", None)
		# 下面代码拷贝过来

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
		#验证通过返回True
		verify_result = alipay.verify(processed_dict, sign)
		print("verify_result================", verify_result)
		if verify_result is True:
			#该交易在支付宝系统中的交易流水号
			trade_no = processed_dict.get("trade_no",None)
			#商户网站唯一订单号
			order_sn = processed_dict.get("out_trade_no",None)
			pay_status = processed_dict.get("pay_status","TRADE_SUCCESS")

			#根据订单号查找已经存在的订单列表
			exited_orders = OrderInfo.objects.filter(order_sn=order_sn)
			for exited_order in exited_orders:
				# 得到一个订单所有的商品详情列表
				order_goods = exited_order.goods.all()
				for order_good in order_goods:
					# 根据某个个订单得到对应的商品
					goods = order_good.goods
					#商品的销量等于购物车的销量加上原来的
					goods.sold_num += order_good.goods_num
					#保存
					goods.save()

				exited_order.trade_no = trade_no
				#修改状态
				exited_order.pay_status = pay_status
				exited_order.pay_time = datetime.now()
				exited_order.save()
				#保存数据
			#发一个成功信息给支付宝，否则支付宝会不停的发消息给我们
			# return Response("success")
			#跳转到首页
			response = redirect("index")
			#设置cookie
			response.set_cookie("nextPath","pay",max_age=2)
			return response
		else:
			#跳转到首页
			response = redirect("index")
			return response






	#如果用沙箱客户端扫描支付走这里
	def post(self,request):
		"""
		处理支付宝的notify_url
		:param request:
		:return:
		"""
		#从post取出数据，把对应
		processed_dict = {}
		for key,value in request.POST.items():
			processed_dict[key] = value
		#得到签名
		sign = processed_dict.pop("sign",None)
		#下面代码拷贝过来

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

		verify_result = alipay.verify(processed_dict, sign)
		print("verify_result================",verify_result)
		if verify_result is True:
			#该交易在支付宝系统中的交易流水号
			trade_no = processed_dict.get("trade_no",None)
			#商户网站唯一订单号
			order_sn = processed_dict.get("out_trade_no",None)
			pay_status = processed_dict.get("pay_status", "TRADE_SUCCESS")

			#根据订单号查找已经存在的订单列表
			exited_orders = OrderInfo.objects.filter(order_sn=order_sn)
			for exited_order in exited_orders:
				# 得到一个订单所有的商品详情列表
				order_goods = exited_order.goods.all()
				for order_good in order_goods:
					# 根据某个个订单得到对应的商品
					goods = order_good.goods
					# 商品的销量等于购物车的销量加上原来的
					goods.sold_num += order_good.goods_num
					# 保存
					goods.save()


				exited_order.trade_no = trade_no
				#修改状态
				exited_order.pay_status = pay_status
				exited_order.pay_time = datetime.now()
				# 保存数据
				exited_order.save()

			#发一个成功信息给支付宝，否则支付宝会不停的发消息给我们
			# return Response("success")
			# 跳转到首页
			response = redirect("index")
			# 设置cookie
			response.set_cookie("nextPath", "pay", max_age=2)
			return response
		else:
			# 跳转到首页
			response = redirect("index")
			return response

