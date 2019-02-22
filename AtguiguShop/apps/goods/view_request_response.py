from .models import Goods
from .serializers import GoodsSerializer
from rest_framework.views import APIView
#自己封装了Response
from rest_framework.response import Response


#返回商品列表
class GoodsListViewRequestResponse(APIView):
	"""
	List all Goods, or create a new Goods.
	"""
	def get(self, request, format=None):
		print("request.data==",request.data)
		print("request.user==", request.user)
		print("request.auth==", request.auth)
		print("request.method==", request.method)
		print("request.content_type==", request.content_type)
		print("request.query_params==", request.query_params)
		print("request.parsers==", request.parsers)

		goods = Goods.objects.all()[:10]#取前10条数据
		# 序列化，比django的功能更强大,mary表示多个goods对象
		goods_serializer = GoodsSerializer(goods, many=True)
		response = Response(data=goods_serializer.data)
		#Response也是自定义的
		print("response.data==",response.data)
		print("response.status_code==", response.status_code)
		print("response.template_name==", response.template_name)
		return response