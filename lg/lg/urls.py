"""lg URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
import xadmin
from lg.settings import MEDIA_ROOT
from django.views.static import serve
from goods.views import GoodsListViewSet, CategoryViewSet, BannerViewSet, IndexCategoryViewset
from rest_framework.documentation import include_docs_urls
from rest_framework.routers import DefaultRouter
from rest_framework.authtoken import views
from rest_framework_jwt.views import obtain_jwt_token
from users.views import SMSCodeViewSet, UserViewset
from user_operation.views import UserFavViewSet, LeavingMessageViewSet, UserAddressViewSet
from trade.views import ShopingCartViewSet, OrderViewSet, AlipayView
from django.views.generic import TemplateView

# 实例化默认路由
router = DefaultRouter()

# 注册商品列表
router.register(r'goods', GoodsListViewSet)
# 注册商品类别
router.register(r'category', CategoryViewSet)
# 短信注册
router.register(r'code', SMSCodeViewSet, base_name="code")
# 用户手机注册,要加上base_name否则报错
# router.register(r'register', UserRegViewset, base_name="register")
router.register(r'users', UserViewset, base_name="users")
# 用户收藏
router.register(r'userfavs', UserFavViewSet, base_name="userfavs")
# 用户留言
router.register(r'messages', LeavingMessageViewSet, base_name="messages")
# 收获地址
router.register(r'address', UserAddressViewSet, base_name="address")
# 购物车
router.register(r'shopcarts', ShopingCartViewSet, base_name="shopcarts")
# 订单
router.register(r'orders', OrderViewSet, base_name="orders")
# 轮播图
router.register(r'banners', BannerViewSet, base_name="banners")
# 商品分类
router.register(r'indexgoods', IndexCategoryViewset, base_name="indexgoods")
# 这种配置很方便，后面就会体现出来
goods_list = GoodsListViewSet.as_view({
    # get请求绑定ListModelMixin的list方法
    'get': 'list',
})

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),
    url(r'^goods/$', goods_list, name="goods_list"),
    # 支付宝支付
    url(r'^alipay/ruturn/', AlipayView.as_view(), name="alipay"),
    url(r'^ueditor/', include('DjangoUeditor.urls')),

    url(r'^', include(router.urls)),

    # 支持文档生成的url,结尾一定不能写$
    url(r'docs/', include_docs_urls(title="My API title")),
    # 登录时候用的url,调试api的时候用到
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    # token认证
    url(r'^api-token-auth/', views.obtain_auth_token),
    # jwt的认证,修改一个名字
    url(r'^login/$', obtain_jwt_token),
    # 前后端代码链接到一块
    url(r'^index/', TemplateView.as_view(template_name='index.html'), name="index"),
    # 第三方登录
    url('', include('social_django.urls', namespace='social')),


]
