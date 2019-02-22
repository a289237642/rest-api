from django.contrib.auth import get_user_model
from django.db import models
from datetime import datetime
from goods.models import Goods

# Create your models here.

User = get_user_model()


class ShopingCart(models.Model):
    """购物车"""
    # 用户
    user = models.ForeignKey(User, verbose_name=u"用户")
    # 商品
    goods = models.ForeignKey(Goods, verbose_name=u"商品")
    # 商品数量
    nums = models.IntegerField(default=0, verbose_name="商品数量")
    # 添加时间
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "购物车"
        verbose_name_plural = verbose_name
        unique_together = ("user", "goods")

    def __str__(self):
        return self.goods.name


class OrderInfo(models.Model):
    """订单"""
    ORDER_STATUS = (
        ("PAYING", "待支付"),
        ("TRADE_SUCCESS", "支付成功"),
        ("TRADE_CLOSE", "支付关闭"),
        ("TRADE_FAIL", "支付失败"),
        ("TRADE_FINSHED", "交易结束"),
    )
    # 用户
    user = models.ForeignKey(User, verbose_name=u"用户")
    # 订单号
    order_sn = models.CharField(null=True, blank=True, max_length=30, unique=True, verbose_name="订单号")
    # 交易编号
    trade_no = models.CharField(max_length=100, unique=True, blank=True, null=True, verbose_name="交易号")
    # 支付状态
    pay_status = models.CharField(default="PAYING", null=True, blank=True, max_length=30, choices=ORDER_STATUS,
                                  verbose_name="订单状态")
    # 订单留言
    post_script = models.CharField(max_length=200, verbose_name="订单留言")
    # 订单金额
    order_mount = models.FloatField(default=0.0, verbose_name="订单金额")
    # 支付时间
    pay_time = models.DateTimeField(null=True, blank=True, verbose_name="支付时间")

    # 签收人
    signer_name = models.CharField(max_length=30, verbose_name="签收人")
    # 签收电话
    signer_mobile = models.CharField(max_length=11, verbose_name="联系电话")
    # 签收地址
    address = models.CharField(max_length=200, verbose_name="收货地址")
    # 添加时间
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "订单"
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.order_sn)


class OrderGoods(models.Model):
    """订单商品详情"""
    # 订单
    order = models.ForeignKey(OrderInfo, verbose_name=u"订单", related_name="goods")
    # 商品
    goods = models.ForeignKey(Goods, verbose_name=u"商品")
    # 商品数量
    goods_num = models.IntegerField(default=0, verbose_name="商品数量")
    # 添加时间
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "订单商品详情"
        verbose_name_plural = verbose_name

    def __str__(self):
        # 打印订单编号
        return str(self.order.order_sn)
