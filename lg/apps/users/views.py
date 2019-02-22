from django.contrib.auth.backends import ModelBackend, get_user_model
from django.db.models import Q
from rest_framework import status
from rest_framework import viewsets, mixins
from rest_framework.response import Response
from rest_framework import permissions, authentication
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from users.models import VerifyCode
from users.serializers import MSMSerializer, UserRegSerializer, UserDetailSerializer
from utils.yunpian import YunPian
from rest_framework_jwt.utils import jwt_encode_handler, jwt_payload_handler
import random

# 得到当前用户实例对象
User = get_user_model()


# 用户使用短信注册
class UserViewset(mixins.UpdateModelMixin, mixins.CreateModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    # 用户
    queryset = User.objects.all()

    # 配置注册序列化器
    # serializer_class = UserRegSerializer
    def get_serializer_class(self):
        """根据不同的动作，返回不同的序列化器"""
        if self.action == "retrieve":  # 请求得到某个用户
            return UserDetailSerializer
        elif self.action == "create":  # 注册
            return UserRegSerializer
        return UserDetailSerializer  # 默认返回UserDetailSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = self.perform_create(serializer)
        # 本质就是字典
        re_dict = serializer.data
        # 从服务器那拿到token，把所有的页面的菜单都展示出来
        re_dict["name"] = user.name if user.name else user.username
        re_dict["token"] = jwt_encode_handler(jwt_payload_handler(user))
        headers = self.get_success_headers(serializer.data)
        return Response(re_dict, status=status.HTTP_201_CREATED, headers=headers)

    def perform_create(self, serializer):
        return serializer.save()

    def get_object(self):
        return self.request.user

    # 认证
    authentication_classes = (authentication.SessionAuthentication, JSONWebTokenAuthentication)

    # 根据不同的操作动态获取不同的权限需求
    def get_permissions(self):
        """根据不同的操作动态获取不同的权限需求"""

        if self.action == "retrieve":  # 请求得到某个用户
            return [permissions.IsAuthenticated()]
        elif self.action == "create":  # 注册
            return []
        return []  # 默认返回空


class CustomModelBackend(ModelBackend):

    # 方法的的username是一个参数：传入账号和手机号
    def authenticate(self, request, username=None, password=None, **kwargs):
        print("username==", username)
        print("password==", password)
        print("request===", request)

        try:
            # 根据手机号和用户名查找用户
            user = User.objects.get(Q(username=username) | Q(mobile=username))
            # 校验密码是否正确
            if user.check_password(password):
                return user


        except Exception as e:
            print(e)
            return None


# 发送验证码并且保存验证码
# CreateModelMixin,post请求，保存验证码
class SMSCodeViewSet(viewsets.GenericViewSet, mixins.CreateModelMixin):
    queryset = VerifyCode.objects.all()

    # 配置序列化器
    serializer_class = MSMSerializer

    # 生成验证码
    def get_code(self):
        """得到验证码,长度4"""
        data = "0123456789"
        # 列表
        reuslt = []  # 1,2,5,7,
        for i in range(4):
            reuslt.append(random.choice(data))

        return "".join(reuslt)

    # 当保存数据的时候调用
    def create(self, request, *args, **kwargs):
        # 得到序列化器
        serializer = self.get_serializer(data=request.data)

        # 执行序列化器里面的校验功能
        serializer.is_valid(raise_exception=True)

        # 保存数据到数据库，自定义生成验证码后，在使用
        # self.perform_create(serializer)

        # 取到电话号码
        mobile = serializer.data["mobile"]

        # 验证码
        code = self.get_code()

        yp = YunPian()
        # 发送验证码
        response_data = yp.set_msg(mobile, code)

        if response_data["code"] == 0:
            # 发送验证码成功

            # 保存验证码和收好到数据库里面
            VerifyCode(mobile=mobile, code=code).save()  # 保存手机号码和验证码

            return Response({"mobile": mobile, "msg": response_data["msg"]}, status=status.HTTP_201_CREATED)

        else:
            # "发送验证码失败"
            return Response({"mobile": mobile, "msg": response_data["msg"]}, status=status.HTTP_400_BAD_REQUEST)
