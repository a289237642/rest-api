from django_filters import rest_framework as filters
from .models import Goods
from django.db.models import Q


class GoodsFilter(filters.FilterSet):
    # 最新价格
    pricemin = filters.NumberFilter(name="shop_price", lookup_expr='gte', help_text="最小价格")
    # 最大价格
    pricemax = filters.NumberFilter(name="shop_price", lookup_expr='lte', help_text="最大价格")
    # 对name进行模糊查询,类似于sql里面的like语句，如果不指定lookup_expr就是完全匹配了
    name = filters.CharFilter(name="name", lookup_expr="icontains", help_text="商品名称模糊查询")
    # 支持前端新的字段过滤
    top_category = filters.NumberFilter(method="top_category_filters")

    # 实现
    def top_category_filters(self, queryset, name, value):
        queryset = queryset.filter(Q(category__id=value) | Q(category__parent_category_id=value) | Q(
            category__parent_category__parent_category_id=value))
        return queryset

    class Meta:
        model = Goods
        fields = ['pricemin', 'pricemax', "name", "is_hot", "is_new"]
