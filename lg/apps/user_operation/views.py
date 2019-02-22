from rest_framework.viewsets import GenericViewSet, ModelViewSet
from rest_framework import mixins
from .models import UserFav, UserLeavingMessage, UserAddress
from .serializers import UserFavViewSerializer, UserFavDetailSerializer, LeavingMessageSerializers, \
    UserAddressSerializers
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from utils.permissions import IsOwnerOrReadOnly
from rest_framework.authentication import SessionAuthentication


class UserAddressViewSet(ModelViewSet):
    """收获地址"""
    serializer_class = UserAddressSerializers
    # 这个时候删除某个地址的时候就会验证是否是对应用户的地址--IsOwnerOrReadOnly
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly,)
    # JWT认证
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)

    def get_queryset(self):
        """ 返回当前登录用户的信息"""
        return UserAddress.objects.filter(user=self.request.user)


class LeavingMessageViewSet(mixins.DestroyModelMixin, mixins.ListModelMixin, mixins.CreateModelMixin, GenericViewSet):
    """用户留言"""
    serializer_class = LeavingMessageSerializers
    # 这个时候删除某个留言的时候就会验证是否是对应用户的留言--IsOwnerOrReadOnly
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    # JWT认证
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)

    def get_queryset(self):
        """返回当前登录用户的信息"""
        return UserLeavingMessage.objects.filter(user=self.request.user)


class UserFavViewSet(mixins.RetrieveModelMixin, mixins.CreateModelMixin, mixins.DestroyModelMixin,
                     mixins.ListModelMixin, GenericViewSet):
    """用户收藏"""
    # 用户列表
    queryset = UserFav.objects.all()
    # 指定序列化器
    # serializer_class = UserFavViewSerializer
    # 配置权限校验，检验是否登录
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly,)
    # JWT
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    # 收藏的时候，收藏的id修改成商品的id
    lookup_field = "goods_id"

    def get_serializer_class(self):
        """根据不同的动作，返回不同的序列化器"""
        if self.action == "create":
            return UserFavViewSerializer
        elif self.action == "list":
            return UserFavDetailSerializer
        return UserFavDetailSerializer

    # 重新CreateModelMixin的perform_create方法
    def perform_create(self, serializer):
        instance = serializer.save()

        goods = instance.goods
        goods.fav_num += 1
        goods.save()

    def perform_destroy(self, instance):
        userfav = instance
        goods = userfav.goods
        goods.fav_num -= 1
        goods.save()

    # 得到收藏的时候，只能让其得到当前用户的所有收藏，而不能得到其他用户的收藏
    def get_queryset(self):
        return self.queryset.filter(user=self.request.user)
