from django.views.generic import View
from goods.models import Goods


class GoodsListView(View):
	def get(self,request):
		"""
		通过django的view实现商品列表页
		:param request:
		:return:
		"""
		#返回前所有商品的前10条数据
		goods_list = Goods.objects.all()[:10]
		# json_list = []
		# print(goods_list)
		# for goods in goods_list:
		# 	json_item = {}
		# 	json_item["name"] = goods.name
		# 	json_item["market_price"] = goods.market_price
		# 	json_item["sold_num"] = goods.sold_num
		# 	# json_item["add_time"] = goods.add_time#改行代码报错
		#
		# 	json_list.append(json_item)
		#
		# from django.http import HttpResponse
		# import json
		#
		# print(type(json_list))
		# #转换成字符串
		# content = json.dumps(json_list)
		# #str
		# print(type(content))
		# #，在转换成json
		# return HttpResponse(content,"application/json")


		from django.core import serializers
		import json
		from django.http import JsonResponse

		#直接转换成json类型的字符串
		data = serializers.serialize("json",goods_list)
		#转换成字典
		data = json.loads(data)
		return JsonResponse(data,safe=False)