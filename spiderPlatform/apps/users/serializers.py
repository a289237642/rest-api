from rest_framework import serializers
from .models import UserProfile


# 得到用户的时候用的序列化器
class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = UserProfile
        fields = ("username", "birthday", "gender", "mobile", "email")
