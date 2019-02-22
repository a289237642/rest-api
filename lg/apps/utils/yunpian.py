import requests
import json


class YunPian(object):
    def __init__(self):
        self.apikey = "4f70824dde066067241393c80c291ea6"
        self.sms_send_uri = "https://sms.yunpian.com/v2/sms/single_send.json"

    def set_msg(self, mobile, code):
        data = {
            "apikey": self.apikey,
            "mobile": mobile,
            # 注意模板已经固定好了，动态变化的只能是验证码，否则报错
            "text": "【杨光福】您的验证码是{code}。如非本人操作，请忽略本短信".format(code=code)
        }

        response = requests.post(self.sms_send_uri, data=data)
        text = response.text
        print(text)
        dicjson = json.loads(text)
        print(dicjson)
        return dicjson
