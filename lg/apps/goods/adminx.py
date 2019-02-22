from .models import Goods, GoodsCategory, GoodsCategoryBrand, GoodsImage, Banner, IndexAd
import xadmin


class GoodsAdmin(object):
    # 根据字段控制显示
    list_display = ["name", "click_num", "sold_num", "fav_num", "goods_num", "market_price",
                    "shop_price", "goods_desc", "is_new", "is_hot", "add_time"]
    list_filter = ["name", "click_num", "sold_num"]
    # #添加搜索框，并且提供name搜索
    search_fields = ["name"]
    # 加上这个才会显示富文本的图片，否则只显示连接
    style_fields = {"goods_desc": "ueditor"}

    class GoodsImagesInline(object):
        # 应用的model
        model = GoodsImage
        # 不包括add_item,不要显示这个字段
        exclude = ["add_time"]
        # 每次添加只能添加一个
        extra = 1
        # 样式，表格方式
        style = 'tab'

    # 这个是其和商品保持在一个页面上显示
    inlines = [GoodsImagesInline]


class GoodsCategoryAdmin(object):
    list_display = ["name", "category_type", "parent_category", "add_time"]
    list_filter = ["category_type", "parent_category", "name"]
    search_fields = ['name', ]


class GoodsCategoryBrandAdmin(object):
    list_display = ["category", "image", "name", "desc"]

    def get_context(self):
        context = super(GoodsCategoryBrandAdmin, self).get_context()
        if 'form' in context:
            context['form'].fields['category'].queryset = GoodsCategory.objects.filter(category_type=1)
        return context


class GoodsImageAdmin(object):
    pass


class BannerAdmin(object):
    pass


class IndexAdAdmin(object):
    list_display = ["category", "goods", ]

    def get_context(self):
        context = super(IndexAdAdmin, self).get_context()
        if 'form' in context:
            context['form'].fields['category'].queryset = GoodsCategory.objects.filter(category_type=1)
        return context


# 注册商品models
xadmin.site.register(Goods, GoodsAdmin)
xadmin.site.register(GoodsCategory, GoodsCategoryAdmin)
xadmin.site.register(GoodsCategoryBrand, GoodsCategoryBrandAdmin)
xadmin.site.register(GoodsImage, GoodsImageAdmin)
xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(IndexAd, IndexAdAdmin)
