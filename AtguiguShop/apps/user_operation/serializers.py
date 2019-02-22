from rest_framework import serializers
from rest_framework.validators import UniqueTogetherValidator
from .models import UserAddress,UserFav,UserLeavingMessage
from goods.serializers import GoodsSerializer


#用户收藏商品详细信息
class UserFavDetailSerializer(serializers.ModelSerializer):
	"""用户收藏详商品细信息"""
	goods = GoodsSerializer()

	class Meta:
		#使用代码验证提交的时候，有没有重复
		model = UserFav
		fields = ("goods","id")


#用户收藏
class UserFavViewSerializer(serializers.ModelSerializer):
	"""用户收藏"""
	user = serializers.HiddenField(
		default=serializers.CurrentUserDefault()
	)
	class Meta:
		#使用代码验证提交的时候，有没有重复
		validators = [
			UniqueTogetherValidator(
				queryset=UserFav.objects.all(),
				#验证User和Goods两个mode关联重复
				fields=('user', 'goods'),
				message="已经收藏"
			)
		]
		model = UserFav
		fields = ("user","goods","id")


class LeavingMessageSerializers(serializers.ModelSerializer):
	#得到当前用户,在fields里面填写
	user = serializers.HiddenField(
		default=serializers.CurrentUserDefault()
	)
	#read_only：对添加后时间给前端，但是再添加的时候有可以不用填写时间；
	#format时间格式化
	add_time = serializers.DateTimeField(read_only=True,format='%Y-%m-%d %H:%M')
	class Meta:
		model = UserLeavingMessage
		fields = ("user","subject","msg_type","message","file","add_time","id")


class UserAddressSerializers(serializers.ModelSerializer):
	# 得到当前用户,在fields里面填写
	user = serializers.HiddenField(
		default=serializers.CurrentUserDefault()
	)
	# read_only：对添加后时间给前端，但是再添加的时候有可以不用填写时间；
	# format时间格式化
	add_time = serializers.DateTimeField(read_only=True, format='%Y-%m-%d %H:%M')

	class Meta:
		model = UserAddress
		fields = ("id","user", "province", "city", "district", "address", "signer_name", "signer_mobile","add_time")