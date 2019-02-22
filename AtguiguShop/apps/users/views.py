from django.contrib.auth import get_user_model
from django.db.models import Q
from django.contrib.auth.backends import ModelBackend


from rest_framework import viewsets
from rest_framework import status
from rest_framework.response import Response
from rest_framework import permissions,authentication
from rest_framework_jwt.authentication import JSONWebTokenAuthentication

from rest_framework_jwt.utils import jwt_encode_handler,jwt_payload_handler
from .serializers import MSMSerializer,UserRegSerializer,UserDetailSerializer
from rest_framework import mixins
from utils.yunpian import YunPian
from .models import VerifyCode


import random

#得到用户model


User = get_user_model()

#自定义用户登录
class CustomModelBackend(ModelBackend):
	def authenticate(self, request, username=None, password=None, **kwargs):
		try:
			#根据用户名和电话查看用户
			user = User.objects.get(Q(username=username)|Q(mobile=username))
			#校验密码是否正确，正确就返回，否则不返回
			if user.check_password(password):
				return user
		except Exception as e:
			print(e)
			return None


#短信验证,并且要把验证码保存到数据库CreateModelMixin
class SmsCodeViewset(mixins.CreateModelMixin,viewsets.GenericViewSet):
	"""短信验证,并且要把验证码保存到数据库"""
	# 序列化器，和表单类似有验证功能
	serializer_class = MSMSerializer

	def generating(self):
		"""
		生成四位数字的验证码
		:return:
		"""
		random_str = []
		data = "1234567890"
		for a in range(4):
			random_str.append(random.choice(data))
		return "".join(random_str)


	def create(self, request, *args, **kwargs):
		#得到序列化期
		serializer = self.get_serializer(data=request.data)
		#开始验证，会执行MSMSerializer的validate_mobile方法
		serializer.is_valid(raise_exception=True)
		#前面已经做了三个验证
		mobile = serializer.data["mobile"]
		code = self.generating()
		#集成云片网
		yun_pian = YunPian("4f70824dde066067241393c80c291ea6")
		sms_status = yun_pian.set_msg(mobile,code)
		#看云片的文档，返回0是发生成功，其他字段不用管
		if sms_status["code"] == 0:
			#保存到数据中(这个很重要)
			verifyCode = VerifyCode(code=code,mobile=mobile)
			#保存到数据库中
			verifyCode.save()
			#发送成功
			return Response({"mobile":mobile,"msg":sms_status["msg"]}, status=status.HTTP_201_CREATED)
		else:
			#发送失败
			return Response({"mobile":mobile,"msg":sms_status["msg"]}, status=status.HTTP_400_BAD_REQUEST)


#用户使用短信注册，获取用户详情信息
#得到用户信息
class UserViewset(mixins.UpdateModelMixin,mixins.CreateModelMixin,mixins.RetrieveModelMixin,viewsets.GenericViewSet):
	"""用户注册，获取用户信息"""
	#配置注册序列化器
	# serializer_class = UserRegSerializer

	#得到所有的用户信息
	queryset = User.objects.all()

	#得到和修改和删除用户都要得到用户
	#好处users/x,x是任何数字都返回当前用户
	#但是有一个问题，必须是登录的情况下，才能获取当前用户
	def get_object(self):
		return self.request.user

	#判断是否登录,只是在修改，删除，查询用户采用，那么注册用户的时候用户还是没有登录的
	#要想解决这个问题那么就需要动态权限来解决这个问题
	# permission_classes = (permissions.IsAuthenticated,)

	#认证,
	authentication_classes = (authentication.SessionAuthentication,JSONWebTokenAuthentication)

	#根据不同的操作动态获取权限
	def get_permissions(self):
		"""
		根据不同的动作，返回不同的权限
		"""
		if self.action == "retrieve":  # 请求得到某个用户
			return [permissions.IsAuthenticated()]
		elif self.action == "create":  # 注册
			return []
		return []  # 默认返回kong

	#动态获取序列化器
	def get_serializer_class(self):
		"""
		根据不同的动作，返回不同的序列化器
		"""
		if self.action == "retrieve":#请求得到某个用户
			return UserDetailSerializer
		elif self.action == "create":#注册
			return UserRegSerializer
		return UserDetailSerializer#默认返回UserDetailSerializer

	#当注册用户的时候调用
	def create(self, request, *args, **kwargs):
		serializer = self.get_serializer(data=request.data)
		serializer.is_valid(raise_exception=True)
		user = self.perform_create(serializer)
		#本质就是自动
		re_dict = serializer.data
		#封装成字典
		payload = jwt_payload_handler(user)
		#安装jwt封装token
		re_dict["token"] = jwt_encode_handler(payload)
		re_dict["name"] = user.name if user.name else user.username
		headers = self.get_success_headers(serializer.data)
		return Response(re_dict, status=status.HTTP_201_CREATED, headers=headers)

	def perform_create(self, serializer):
		return serializer.save()

