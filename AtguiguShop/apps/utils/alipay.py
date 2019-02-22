# -*- coding: utf-8 -*-

# pip install pycryptodome(一定要安装这个包)
#pip install winrandom

from datetime import datetime
from Crypto.PublicKey import RSA
from Crypto.Signature import PKCS1_v1_5
from Crypto.Hash import SHA256
from base64 import b64encode, b64decode
from urllib.parse import quote_plus
from urllib.parse import urlparse, parse_qs
from urllib.request import urlopen
from base64 import decodebytes, encodebytes

import json


class AliPay(object):
    """
    支付宝支付接口
    """
    def __init__(self, appid, app_notify_url, app_private_key_path,
                 alipay_public_key_path, return_url, debug=False):
        self.appid = appid
        self.app_notify_url = app_notify_url
        self.app_private_key_path = app_private_key_path
        self.app_private_key = None
        self.return_url = return_url
        with open(self.app_private_key_path) as fp:
            self.app_private_key = RSA.importKey(fp.read())

        self.alipay_public_key_path = alipay_public_key_path
        with open(self.alipay_public_key_path) as fp:
            self.alipay_public_key = RSA.importKey(fp.read())


        if debug is True:
            self.__gateway = "https://openapi.alipaydev.com/gateway.do"
        else:
            self.__gateway = "https://openapi.alipay.com/gateway.do"

    def direct_pay(self, subject, out_trade_no, total_amount, return_url=None, **kwargs):
        biz_content = {
            "subject": subject,
            "out_trade_no": out_trade_no,
            "total_amount": total_amount,
            "product_code": "FAST_INSTANT_TRADE_PAY",
            # "qr_pay_mode":4
        }

        biz_content.update(kwargs)
        data = self.build_body("alipay.trade.page.pay", biz_content, self.return_url)
        return self.sign_data(data)

    def build_body(self, method, biz_content, return_url=None):
        data = {
            "app_id": self.appid,
            "method": method,
            "charset": "utf-8",
            "sign_type": "RSA2",
            "timestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "version": "1.0",
            "biz_content": biz_content
        }

        if return_url is not None:
            data["notify_url"] = self.app_notify_url
            data["return_url"] = self.return_url

        return data

    def sign_data(self, data):
        data.pop("sign", None)
        # 排序后的字符串
        unsigned_items = self.ordered_data(data)
        #拼接字符串
        unsigned_string = "&".join("{0}={1}".format(k, v) for k, v in unsigned_items)
        #签名
        sign = self.sign(unsigned_string.encode("utf-8"))
        #排序
        # ordered_items = self.ordered_data(data)
        quoted_string = "&".join("{0}={1}".format(k, quote_plus(v)) for k, v in unsigned_items)

        # 获得最终的订单信息字符串
        signed_string = quoted_string + "&sign=" + quote_plus(sign)
        return signed_string

    def ordered_data(self, data):
        complex_keys = []
        for key, value in data.items():
            if isinstance(value, dict):
                complex_keys.append(key)

        # 将字典类型的数据dump出来
        for key in complex_keys:
            data[key] = json.dumps(data[key], separators=(',', ':'))

        return sorted([(k, v) for k, v in data.items()])

    def sign(self, unsigned_string):
        # 开始计算签名
        key = self.app_private_key
        signer = PKCS1_v1_5.new(key)
        signature = signer.sign(SHA256.new(unsigned_string))
        # base64 编码，转换为unicode表示并移除回车
        sign = encodebytes(signature).decode("utf8").replace("\n", "")
        return sign

    def _verify(self, raw_content, signature):
        # 开始计算签名
        key = self.alipay_public_key
        signer = PKCS1_v1_5.new(key)
        digest = SHA256.new()
        digest.update(raw_content.encode("utf8"))
        if signer.verify(digest, decodebytes(signature.encode("utf8"))):
            return True
        return False

    def verify(self, data, signature):
        if "sign_type" in data:
            sign_type = data.pop("sign_type")
        # 排序后的字符串
        unsigned_items = self.ordered_data(data)
        message = "&".join(u"{}={}".format(k, v) for k, v in unsigned_items)
        return self._verify(message, signature)


if __name__ == "__main__":
    # return_url = 'http://118.190.202.67:8001/?charset=utf-8&out_trade_no=20180614122222&method=alipay.trade.page.pay.return&total_amount=100.01&sign=m1u20Z%2FYTU0uipXfDYktEINrkaAmv5dh1RHYyeb6wDZzBB%2FHLt9x87W91sqsN8%2BO6%2BuxwZLEAOC5olHJDBplYHLhR5s60UXFyvvagmfNAdQYOIV7Rk3yYWkz2P7bejB7n9tOQ9Kj8%2FxMf9me5YZts1gZlLcedetHDSuDzHDTPB9Lhc1qhnF7655hYf1P9qA%2B6l%2BVFIwihmPxDsb9n7vuw34dtHFHTUuK%2FGn3sqjKwAtN5igfOJibyTYeVMjASTMSDir0HC9xVWMgyzE3BJidNnWhSvoMUah%2FDVToJZCPcydpgmd0zZ7iZMelxE4cQ7KJRidgDa4%2FAsUU0ZJrY3%2FRnw%3D%3D&trade_no=2018061421001004760200615074&auth_app_id=2016091300503105&version=1.0&app_id=2016091300503105&sign_type=RSA2&seller_id=2088102175472298&timestamp=2018-06-14+18%3A12%3A38'
    from AtguiguShop.settings import private_key_path, ali_public_path
    alipay = AliPay(
        appid="2016091300503105",
        #异步的通知接口，当在浏览器扫描创建订单后，这个时候关闭页面，此时可以在客户端或者支护宝账号里面看到这个为支付完成的信息
        app_notify_url="http://118.190.202.67:8001/alipay/return/",
        app_private_key_path=private_key_path,
        alipay_public_key_path=ali_public_path,  # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
        debug=True,  # 默认False,
        #同步接口，支付成功后会跳转的接口
        return_url="http://118.190.202.67:8001/alipay/return/"
    )

    # o = urlparse(return_url)
    # query = parse_qs(o.query)
    # processed_query = {}
    # ali_sign = query.pop("sign")[0]
    # for key, value in query.items():
    #     processed_query[key] = value[0]
    # print("processed_query===",processed_query)
    # print (alipay.verify(processed_query, ali_sign))

    url = alipay.direct_pay(
        subject="测试订单",
        out_trade_no="20190601109866111111111111111",
        total_amount=100.01
    )
    #沙箱环境
    re_url = "https://openapi.alipaydev.com/gateway.do?{data}".format(data=url)
    print(re_url)