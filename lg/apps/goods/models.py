from django.db import models
from datetime import datetime
from DjangoUeditor.models import UEditorField


# Create your models here.
class GoodsCategory(models.Model):
    """商品类别"""
    CATEGORY_TYPE = (
        (1, "一级类目"),
        (2, "二级类目"),
        (3, "三级类目"),
    )
    # 类目名称
    name = models.CharField(max_length=20, default="", verbose_name="类目名称", help_text="类目名称")
    # 类别编码
    code = models.CharField(max_length=20, default="", null=True, blank=True, verbose_name="类别编码", help_text="类别编码")
    # 简单描述
    desc = models.TextField(default="", verbose_name="简单描述", help_text="简单描述")
    # 类目级别
    category_type = models.IntegerField(choices=CATEGORY_TYPE, verbose_name="类目级别", help_text="类目级别", blank=True,
                                        null=True)
    # 当前类别的上级类目
    # related_name="sub_cat"查询的时候后面用到
    parent_category = models.ForeignKey("self", null=True, blank=True, verbose_name="父类目", help_text="父类目",
                                        related_name="sub_cat")
    # 是否插入到首页的tab导航里面
    is_tab = models.BooleanField(default=False, verbose_name="是否导航", help_text="是否导航")
    # 添加时间
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        # 重载meta模块,修改Admin后台中显示的名称
        verbose_name = "商品类别"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class GoodsCategoryBrand(models.Model):
    """品牌名"""
    # 商品类目
    category = models.ForeignKey(GoodsCategory, related_name='brands', null=True, blank=True, verbose_name="商品类目")
    # 品牌名称
    name = models.CharField(default="", max_length=30, verbose_name="品牌名称", help_text="品牌名称")
    # 品牌描述
    desc = models.CharField(default="", max_length=100, verbose_name="品牌描述", help_text="品牌描述")
    # 品牌图片
    # 图片在数据中存储的时候实际上是Char,所以要设置max_length
    # upload_to="brand/：图片上传到的位置
    image = models.ImageField(max_length=200, upload_to="brand/images/")

    # 添加时间
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        # 重载meta模块,修改Admin后台中显示的名称
        verbose_name = "品牌名"
        verbose_name_plural = verbose_name
        # 自定义表名
        db_table = "goods_goodsbrand"

    def __str__(self):
        return self.name


# 商品
class Goods(models.Model):
    """商品类目"""
    category = models.ForeignKey(GoodsCategory, verbose_name="商品类目")
    # 商品唯一货号
    goods_sn = models.CharField(max_length=50, default="", verbose_name="商品唯一货号")
    # 商品名称
    name = models.CharField(max_length=100, verbose_name="商品名称")
    # 点击数
    click_num = models.IntegerField(default=0, verbose_name="点击数")
    # 销售量
    sold_num = models.IntegerField(default=0, verbose_name="销售量")
    # 收藏数
    fav_num = models.IntegerField(default=0, verbose_name="收藏数")
    # 库存数
    goods_num = models.IntegerField(default=0, verbose_name="库存数")
    # 市场价格
    market_price = models.FloatField(default=0.0, verbose_name="市场价格")
    # 本店价格
    shop_price = models.FloatField(default=0.0, verbose_name="本店价格")
    # 商品的简明描述
    goods_brief = models.TextField(max_length=500, verbose_name="商品的简明描述")
    # 商品内容，富文本描述
    goods_desc = UEditorField(verbose_name=u'内容', width=1000, height=300, imagePath="goods/images/",
                              filePath="goods/files")
    # 是否承担运费，默认是承担运费
    ship_free = models.BooleanField(default=True, verbose_name="是否承担运费")
    # 封面图
    goods_front_image = models.ImageField(upload_to="goods/images/", null=True, blank=True, verbose_name="封面图")
    # 是否新品
    is_new = models.BooleanField(default=False, verbose_name="是否新品")
    # 是否热销
    is_hot = models.BooleanField(default=False, verbose_name="是否热销", help_text="是否热销")
    # 添加时间
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    # 重载meta模块,修改Admin后台中显示的名称
    class Meta:
        verbose_name = "商品"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class GoodsImage(models.Model):
    """商品轮播图"""
    # 关联的商品
    goods = models.ForeignKey(Goods, verbose_name="商品", related_name="images", help_text="商品")
    # 图片
    image = models.ImageField(upload_to="goods/goodsimages/", verbose_name="图片", null=True, blank=True, help_text="图片")
    # 添加时间
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "商品图片"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.goods.name


class Banner(models.Model):
    """
    轮播的商品
    """
    # 引用的商品
    goods = models.ForeignKey(Goods, verbose_name="商品")
    # 图片
    image = models.ImageField(upload_to='goods/banner', verbose_name="轮播图片")
    # 轮播的顺序
    index = models.IntegerField(default=0, verbose_name="轮播顺序")
    # 添加的顺序
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = '轮播商品'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.goods.name


class IndexAd(models.Model):
    # 当前首页广告也是商品，但是是属于类目分类
    # 商品类目
    category = models.ForeignKey(GoodsCategory, related_name='category', null=True, blank=True, verbose_name="商品类目")
    # 商品
    goods = models.ForeignKey(Goods, related_name="goods", verbose_name="商品")

    class Meta:
        verbose_name = '首页类目商品广告'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.goods.name
