from rest_framework import serializers
from .models import GoodsCategoryBrand,GoodsCategory,GoodsImage,Banner,Goods
from .models import IndexAd

class CategorySerializer3(serializers.ModelSerializer):
	class Meta:
		#Model
		model = GoodsCategory
		#把所有的属性都用上的写法
		fields = "__all__"


class CategorySerializer2(serializers.ModelSerializer):
	# 子目录，在models中related_name="sub_cat"
	sub_cat = CategorySerializer3(many=True)
	class Meta:
		#Model
		model = GoodsCategory
		#把所有的属性都用上的写法
		fields = "__all__"

#商品类别序列化期
class CategorySerializer(serializers.ModelSerializer):

	#子目录，在models中related_name="sub_cat"
	sub_cat = CategorySerializer2(many=True)
	class Meta:
		#Model
		model = GoodsCategory
		#把所有的属性都用上的写法
		fields = "__all__"



#-------------------------------------------


#使用ModelSerializer,这个更加简单方便
class GoodsCategorySerializer(serializers.ModelSerializer):
	class Meta:
		#Model
		model = GoodsCategory
		#把所有的属性都用上的写法
		fields = "__all__"


#商品图片轮播图
class GoodsImageSerializer(serializers.ModelSerializer):
	class Meta:
		model = GoodsImage
		fields = ("image",)


#使用ModelSerializer,这个更加简单方便
class GoodsSerializer(serializers.ModelSerializer):
	category = GoodsCategorySerializer()
	#关联子表
	images = GoodsImageSerializer(many=True)
	class Meta:
		#Model
		model = Goods
		# fields = ('name', 'click_num', 'sold_num', 'goods_fron_image',"add_time")
		#把所有的属性都用上的写法
		fields = "__all__"



#首页轮播图序列化器
class BannerSerializer(serializers.ModelSerializer):

	class Meta:
		#Model
		model = Banner
		#把所有的属性都用上的写法
		fields = "__all__"


#品牌序列化器
class BrandSerializer(serializers.ModelSerializer):

	class Meta:
		#Model
		model = GoodsCategoryBrand
		#把所有的属性都用上的写法
		fields = "__all__"

from django.db.models import Q
#首页商品序列化器
class IndexCategorySerializer(serializers.ModelSerializer):
	#类型和品牌是一对多关系
	brands = BrandSerializer(many=True)

	#我们是要使用SerializerMethodField
	#1.如果使用默认的Serializer，会默认使用类目中的第一级类目，我们要的是类目中的第三类也就是具体的商品类
	goods = serializers.SerializerMethodField()
	#对应的是商品类型的类目的二级类目
	sub_cat = CategorySerializer3(many=True)

	#首页类目商品广告
	ad_goods = serializers.SerializerMethodField()
	def get_ad_goods(self,obj):
		#序列化后最终返回json数据
		goods_json = {}
		#根据类型id查找数据，因为商品类目广告嘛，当然要根据id
		ad_goods = IndexAd.objects.filter(category_id=obj.id)
		if ad_goods:
			#如果有多个取第1个，下标是0,
			goods_ins = ad_goods[0].goods
			#把取出的商品数据序列化，ad_goods只需要两个字段，id和图片url,其实可以自定义这块
			goods_serializer = GoodsSerializer(goods_ins,many=False,context={"request":self.context["request"]})
			#还要从序列化器中取出数据
			goods_json = goods_serializer.data

		return goods_json

	def get_goods(self, obj):
		#就是IndexCategorySerializer的实例
		#得到实实在在的商品数据
		all_goods = Goods.objects.filter(Q(category__id=obj.id)|Q(category__parent_category_id=obj.id)|Q(category__parent_category__parent_category_id=obj.id))
		#传入数据，并且商品类型和商品是以对多的关系所以many=True
		goods_serializer = GoodsSerializer(all_goods,many=True,context={'request': self.context['request']})
		#返回数据，本质是交给good
		return goods_serializer.data
	class Meta:
		model = GoodsCategory
		fields = "__all__"
