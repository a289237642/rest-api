from django.conf.urls import url, include
from rest_framework.documentation import include_docs_urls
from rest_framework.routers import DefaultRouter
from rest_framework.authtoken import views
from rest_framework_jwt.views import obtain_jwt_token
from django.contrib import admin#默认是注释的

import xadmin
from AtguiguShop.settings import MEDIA_ROOT
#加载静态资源的服务
from django.views.static import serve
from goods.views import IndexCategoryViewset,GoodsListViewSet,CategoryViewSet,BannerViewSet
from users.views import SmsCodeViewset,UserViewset
from user_operation.views import UserFavViewSet,LeavingMessageViewSet,UserAddressViewSet
from trade.views import OrderViewSet, ShopingCartViewSet


from goods.view_request_response import GoodsListViewRequestResponse

#实例化默认路由
router = DefaultRouter()
#注册商品列表
router.register(r'goods', GoodsListViewSet)

#注册商品类别
router.register(r'categorys', CategoryViewSet)
#发送验证码，要加上base_name否则报错
# router.register(r'codes', SmsCodeViewset,base_name="codes")
router.register(r'code', SmsCodeViewset,base_name="code")
#用户手机注册,要加上base_name否则报错
# router.register(r'regiest', UserRegViewset,base_name="regiest")
router.register(r'users', UserViewset,base_name="users")

#用户收藏商品
router.register(r'userfavs',UserFavViewSet,base_name="userfavs")

#用户留言
router.register(r'messages',LeavingMessageViewSet,base_name="messages")

#收货地址
router.register(r'address',UserAddressViewSet,base_name="address")

#购物车
router.register(r'shopcarts',ShopingCartViewSet,base_name="shopcarts")

#订单
router.register(r'orders',OrderViewSet,base_name="orders")

#首页Banner轮播图
router.register(r'banners',BannerViewSet,base_name="banners")

#首页商品分类数据
router.register(r'indexgoods',IndexCategoryViewset,base_name="indexgoods")


#这种配置很方便，后面就会体现出来
# goods_list = GoodsListViewSet.as_view({
#     #get请求绑定ListModelMixin的list方法
#     'get': 'list',
# })

from trade.views import AlipayView
#导入django 原生的TemplateView
from django.views.generic import TemplateView

urlpatterns = [
    # url(r'^admin/', admin.site.urls),#默认是注释的
    url(r'^xadmin/', xadmin.site.urls),#t添加
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),
    #商品列表
    # url(r'^goods/$',GoodsListView.as_view(),name="goods_list"),
    #设置在DefaultRouter注册后，不需要这个配置了
    # url(r'^goods/$', goods_list, name="goods_list"),

    #支持文档生成的url,结尾一定不能写$
    url(r'docs/',include_docs_urls(title="硅谷商店")),
    #登录时候用的url,调试api的时候用到
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    #配置路由
    url(r'^', include(router.urls)),
    #测试request和response
    url(r'^goods_test/$',GoodsListViewRequestResponse.as_view(),name="goods_list_test"),
    #django默认的认证
    url(r'^api-token-auth/', views.obtain_auth_token),
    #jwt的认证,修改一个名字
    # url(r'^jwt-token-auth/', obtain_jwt_token),
    #前端调用的时候叫login
    url(r'^login/$', obtain_jwt_token),
    #支付宝支付
    url(r'^alipay/return/',AlipayView.as_view(),name="alipay"),
    #使用django原始的
    url(r'^index/',TemplateView.as_view(template_name='index.html'),name="index"),
    #第三方登录
    url('', include('social_django.urls', namespace='social')),
]
