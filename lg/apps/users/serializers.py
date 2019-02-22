import re
from datetime import datetime, timedelta
from rest_framework import serializers

from lg.settings import REGEX_MOBILE
from .models import VerifyCode
from django.contrib.auth import get_user_model
from rest_framework.validators import UniqueValidator

# 得到用户
User = get_user_model()


# 得到用户的时候用的序列化器
class UserDetailSerializer(serializers.ModelSerializer):
    """用户序列化器"""

    class Meta:
        model = User
        # 要验证的字段
        fields = ("name", "birthday", "gender", "email", "mobile")


# 短信序列化器
class MSMSerializer(serializers.Serializer):
    # 手机号码
    mobile = serializers.CharField(max_length=11, help_text="手机号码")

    def validate_mobile(self, mobile):
        """
        验证手机号码，是否注册，手机号是否合法，验证频率
        :param mobile:
        :return:
        """

        # 验证是否注册，如果不是0,显然已经存在--依赖数据库
        if User.objects.filter(mobile=mobile).count():
            #
            raise serializers.ValidationError("用户已经存在")

        # 验证手机号是否合法（是否正确手机号），如果不合法None,前面加上not 刚好满足进入if里面
        if not re.match(REGEX_MOBILE, mobile):
            raise serializers.ValidationError("手机号不正确")

        # 验证短信发送频率（1分钟只能发送一次）--依赖数据库
        one_mintes_ago = datetime.now() - timedelta(hours=0, minutes=1, seconds=0)
        if VerifyCode.objects.filter(add_time__gt=one_mintes_ago, mobile=mobile).count():
            # 如果存在时间大于一分钟的，返回错误
            raise serializers.ValidationError("距离上次发送未超过60s")

        # 如果验证通过返回手机号码
        return mobile


class UserRegSerializer(serializers.ModelSerializer):
    code = serializers.CharField(required=True, write_only=True, max_length=4, min_length=4, error_messages={
        "blank": "请输入验证码",
        "required": "请输入验证码",
        "max_length": "请输入正确的验证码",
        "min_length": "请输入正确的验证码",
    }, help_text="验证码")
    username = serializers.CharField(required=True, allow_blank=False,
                                     validators=[UniqueValidator(queryset=User.objects.all(), message="用户名不能重复")])
    password = serializers.CharField(label="密码", style={"input_type": "password"}, write_only=True)

    # 自定义保存加密密码
    def create(self, validated_data):
        user = super(UserRegSerializer, self).create(validated_data=validated_data)

        user.set_password(validated_data)
        user.save()
        return user

    def validate(self, attrs):
        attrs["mobile"] = attrs["username"]
        del attrs["code"]
        return attrs

    def validate_code(self, code):
        """验证码"""
        verify_codes = VerifyCode.objects.filter(mobile=self.initial_data["username"]).order_by("-add_time")

        if verify_codes:
            last_record = verify_codes[0]
            five_mintes_ago = datetime.now() - timedelta(hours=0, minutes=5, seconds=0)
            if last_record.add_time < five_mintes_ago:
                raise serializers.ValidationError("验证码过期了")

            if last_record.code != code:
                raise serializers.ValidationError("验证码错误")
        else:
            raise serializers.ValidationError("验证码错误")

    class Meta:
        model = User
        fields = ("username", "code", "mobile", "password")
