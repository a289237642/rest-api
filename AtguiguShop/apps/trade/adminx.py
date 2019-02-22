from .models import ShopingCart,OrderInfo,OrderGoods
import xadmin



#购物车
class ShopingCartAdmin(object):
	list_display = ["user","goods","nums"]


class OrderInfoAdmin(object):
	pass


class OrderGoodsAdmin(object):
	pass

#注册购车到后台管理
xadmin.site.register(ShopingCart,ShopingCartAdmin)
#注册订单到后台管理
xadmin.site.register(OrderInfo,OrderInfoAdmin)
#注册订单商品详情到后台管理
xadmin.site.register(OrderGoods,OrderGoodsAdmin)