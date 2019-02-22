from rest_framework import serializers
from rest_framework.validators import UniqueTogetherValidator
from goods.serializers import GoodsSerializer
from .models import UserFav, UserLeavingMessage, UserAddress


class UserAddressSerializers(serializers.ModelSerializer):
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())
    add_time = serializers.DateTimeField(read_only=True, format='%Y-%m-%d %H:%M')

    class Meta:
        model = UserAddress
        fields = ("id", "user", "province", "city", "district", "address", "signer_name", "signer_mobile", "add_time")


class UserFavViewSerializer(serializers.ModelSerializer):
    """用户收藏"""
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())

    class Meta:
        model = UserFav
        fields = ("user", "goods", "id")


class UserFavDetailSerializer(serializers.ModelSerializer):
    """用户收藏商品详细信息"""
    goods = GoodsSerializer()

    class Meta:
        # 使用代码验证提交的时候，有没有重复
        model = UserFav
        fields = ("goods", "id")


class LeavingMessageSerializers(serializers.ModelSerializer):
    """得到当前用户在fields里面填写"""
    user = serializers.HiddenField(default=serializers.CurrentUserDefault())
    add_time = serializers.DateTimeField(read_only=True, format='%Y-%m-%d  %H:%M')

    class Meta:
        model = UserLeavingMessage
        fields = ("user", "subject", "msg_type", "message", "file", "add_time", "id")
