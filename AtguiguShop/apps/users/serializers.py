import re
from datetime import datetime,timedelta
from rest_framework import serializers
from django.contrib.auth import get_user_model
from AtguiguShop.settings import REGEX_MOBILE
from .models import VerifyCode


#得到用户
User = get_user_model()

#短信序列化器
class MSMSerializer(serializers.Serializer):
	#手机号码
	mobile = serializers.CharField(max_length=11,help_text="手机号码")

	def validate_mobile(self, mobile):
		"""
		验证手机号码，是否注册，手机号是否合法，验证频率
		:param mobile:
		:return:
		"""

		#验证是否注册，如果不是0,显然已经存在--依赖数据库
		if User.objects.filter(mobile=mobile).count():
			#
			raise serializers.ValidationError("用户已经存在")


		#验证手机号是否合法（是否正确手机号），如果不合法None,前面加上not 刚好满足进入if里面
		if not re.match(REGEX_MOBILE,mobile):
			raise serializers.ValidationError("手机号不正确")

		#验证短信发送频率（1分钟只能发送一次）--依赖数据库
		one_mintes_ago = datetime.now() - timedelta(hours=0,minutes=1,seconds=0)
		if  VerifyCode.objects.filter(add_time__gt=one_mintes_ago,mobile=mobile).count():
			#如果存在时间大于一分钟的，返回错误
			raise serializers.ValidationError("距离上次发送未超过60s")

		#如果验证通过返回手机号码
		return mobile

from rest_framework.validators import UniqueValidator
class UserRegSerializer(serializers.ModelSerializer):




	# 因为UserProfile中没有，只能自定义,required=True:code是必须填的字段,注意一定要加上write_only=True
	code = serializers.CharField(label="验证码",required=True, write_only=True, max_length=4, min_length=4, error_messages={
		"blank": "请输入验证码",
		"required": "请输入验证码",
		"max_length": "请输入正确验证码",
		"min_length": "请输入正确验证码",

	}, help_text="验证码")

	#用户名（手机号），验证唯一新UniqueValidator,就不用系统默认的验证了
	username = serializers.CharField(label="用户名",required=True,allow_blank=False,validators=[UniqueValidator(queryset=User.objects.all(),message="用户名不能重复")])

	#密码,write_only不返回
	password = serializers.CharField(label="密码",
		style={'input_type': 'password'},write_only=True
	)

	#自定义保存加密密码--不自定义了
	# def create(self, validated_data):
	# 	#返回的是UserProfile类的实例
	# 	user = super(UserRegSerializer,self).create(validated_data=validated_data)
	# 	#设置密码，是AbstractUser父类AbstractBaseUser的set_password方法
	# 	user.set_password(validated_data["password"])
	# 	#保存user对象
	# 	user.save()
	# 	return user

	#因为UserProfile没有code字段所以要删除
	def validate(self, attrs):
		attrs["mobile"] = attrs["username"]
		del attrs["code"]
		return attrs


	# 1, 验证码不存在
	# 2, 自带的验证，不在最大4，最小4，发送5位肯定是错的
	# 3，过期，输入之前的验证码
	# 4，连续发生了两次验证码，我们只要最后一次验证码，那么如果填写前一个验证码到底正确还是失败呢
	# 5，验证码超过1分钟或者10分钟，是否要提醒呢，这都是问题
	def validate_code(self, code):
		#验证码
		#前端请求的时候把username也就是手机号码放在initial_data里
		#排序的目的，如果有多条验证，取最新的一条验证码，filter有好处就是没有数据返回空列表，不会报错
		verify_codes = VerifyCode.objects.filter(mobile=self.initial_data["username"]).order_by("-add_time")

		if verify_codes:
			#最新的验证码(VerifyCode对象),
			last_record = verify_codes[0]
			#得到5分钟间隔
			five_mintes_ago = datetime.now() - timedelta(hours=0, minutes=5, seconds=0)
			#记录的时间大于5分钟间隔
			if last_record.add_time < five_mintes_ago:
				raise serializers.ValidationError("验证码过期了")

			#校验验证码
			if last_record.code != code:
				raise serializers.ValidationError("验证码错误")
			#最后返回验证码，可以不返回
			# return code
		else:
			raise serializers.ValidationError("验证码错误")


	class Meta:
		model = User
		#要验证的字段
		fields = ("username", "code", "mobile","password")


#得到用户的时候用的序列化器
class UserDetailSerializer(serializers.ModelSerializer):
	"""用户详情序列化器"""
	class Meta:
		model = User
		#要验证的字段
		fields = ("name", "birthday", "gender","email","mobile")