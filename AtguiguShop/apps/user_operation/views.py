from rest_framework.viewsets import GenericViewSet,ModelViewSet
from rest_framework import mixins
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.authentication import SessionAuthentication,BasicAuthentication

from .models import UserFav,UserLeavingMessage,UserAddress
from .serializers import UserAddressSerializers,UserFavViewSerializer,UserFavDetailSerializer,LeavingMessageSerializers
from utils.permissions import IsOwnerOrReadOnly

#用户收藏
class UserFavViewSet(mixins.RetrieveModelMixin,mixins.CreateModelMixin,mixins.DestroyModelMixin,mixins.ListModelMixin,GenericViewSet):
	"""用户收藏
	retrieve:
	得到某个收藏
	create:
	添加收藏
	destroy:
	删除收藏
	list:
	得到某个用户的收藏列表

	"""
	#用户列表
	# queryset = UserFav.objects.all()
	#指定序列化器
	# serializer_class = UserFavViewSerializer
	#配置权限校验，校验是否登录
	#这个时候删除某个收藏的时候就会验证是否是对应用户的收藏--IsOwnerOrReadOnly
	permission_classes = (IsAuthenticated,IsOwnerOrReadOnly,)

	#JWT认证
	authentication_classes = (JSONWebTokenAuthentication,SessionAuthentication)
	#设置支持外键字段http://127.0.0.1:8000/userfavs/1/那么1就是商品id
	lookup_field = "goods_id"

	# 动态获取序列化器
	def get_serializer_class(self):
		"""
		根据不同的动作，返回不同的序列化器
		"""
		if self.action == "create": # 注册用户
			return UserFavViewSerializer
		elif self.action == "list":
			return UserFavDetailSerializer

		return UserFavDetailSerializer  # 默认返回UserDetailSerializer


	#得到收藏的时候，只能让其得到当前用户的所有收藏，而不能得到其他用户的收藏
	def get_queryset(self):
		return UserFav.objects.filter(user=self.request.user)

	#重新CreateModelMixin的perform_create方法
	# def perform_create(self, serializer):
	# 	#返回的对象是User
	# 	instance = serializer.save()
	# 	# print(instance,instance)
	# 	#User里面有goods,从调试看出来的
	# 	goods = instance.goods
	# 	goods.fav_num += 1
	# 	goods.save()


#用户留言
class LeavingMessageViewSet(mixins.DestroyModelMixin,mixins.ListModelMixin,mixins.CreateModelMixin,GenericViewSet):
	"""
	list:
	得到所有留言
	delete:
	删除某条留言
	destroy:
	提交留言
	"""
	serializer_class = LeavingMessageSerializers
	# 这个时候删除某个留言的时候就会验证是否是对应用户的留言--IsOwnerOrReadOnly
	permission_classes = (IsAuthenticated, IsOwnerOrReadOnly,)

	# JWT认证
	authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)

	def get_queryset(self):
		#返回当前登录用户的信息
		return UserLeavingMessage.objects.filter(user=self.request.user)


class UserAddressViewSet(ModelViewSet):
	"""
	收货地址管理
	list:
		获取收货地址
	create:
		添加收货地址
	delete:
		删除收货地址
	update:
		修改收货地址

	"""
	serializer_class = UserAddressSerializers
	# 这个时候删除某个地址的时候就会验证是否是对应用户的地址--IsOwnerOrReadOnly
	permission_classes = (IsAuthenticated, IsOwnerOrReadOnly,)

	# JWT认证
	authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)


	def get_queryset(self):
		# 返回当前登录用户的信息
		return UserAddress.objects.filter(user=self.request.user)
