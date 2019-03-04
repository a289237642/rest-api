from rest_framework import serializers
from .models import Client


# 得到用户的时候用的序列化器
class ClusterSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Client
        fields = ("name", "ip", "port", "description", "auth", "username", "password", "created_at", "updated_at")
