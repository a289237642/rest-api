from rest_framework import mixins
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from .models import Goods, GoodsCategory, Banner
from .serializers import GoodsSerializer, CategorySerializer, BannerSerializer, IndexCategorySerializer
from rest_framework import generics
from rest_framework import viewsets
from django_filters.rest_framework import DjangoFilterBackend
from .filters import GoodsFilter
from rest_framework import filters
from rest_framework.authentication import TokenAuthentication
from rest_framework_extensions.cache.mixins import CacheResponseMixin
from rest_framework.throttling import AnonRateThrottle, UserRateThrottle


class IndexCategoryViewset(mixins.ListModelMixin, viewsets.GenericViewSet):
    """首页商品分类数据"""
    # 取出的是，咱们取出导航栏的两列数据，并且类别名称为生鲜食品和酒水饮料的数据
    queryset = GoodsCategory.objects.filter(is_tab=True, name__in=["生鲜食品", "酒水饮料"])
    serializer_class = IndexCategorySerializer


class BannerViewSet(mixins.ListModelMixin, viewsets.GenericViewSet):
    """返回的轮播图列表"""
    queryset = Banner.objects.all()
    # 序列化期，这个也是要自定义的
    serializer_class = BannerSerializer


class CategoryViewSet(mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    queryset = GoodsCategory.objects.filter(category_type=1)
    serializer_class = CategorySerializer


class GoodsListPagination(PageNumberPagination):
    # 默认返回10条
    page_size = 12
    # 每页返回多少条的参数变量
    page_size_query_param = 'page_size'
    page_query_param = "page"  # 页的字段
    # 最大返回100条
    max_page_size = 100


# GenericViewSet
class GoodsListViewSet(CacheResponseMixin, mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
    返回商品列表,自定义序列化器，分页,过滤,搜索，排序
    """

    # 添加对这个接口的限速率
    # throttle_classes = (AnonRateThrottle, UserRateThrottle)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.click_num += 1
        instance.save()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)

    # 得到所有的商品
    queryset = Goods.objects.all()
    serializer_class = GoodsSerializer
    pagination_class = GoodsListPagination
    filter_class = GoodsFilter

    authentication_classes = (TokenAuthentication,)

    # 支持搜索和过滤，写在一起
    filter_backends = (filters.OrderingFilter, filters.SearchFilter, DjangoFilterBackend)
    # 搜索的关键字从这些字段取
    # ^name,例如搜索水果，那么name字段中必然是水果开头才会满足条件
    # =name,精确搜索
    search_fields = ('name', 'goods_brief', 'goods_desc')
    # 搜索字段
    ordering_fields = ('shop_price', 'sold_num')
