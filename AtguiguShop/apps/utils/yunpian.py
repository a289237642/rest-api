import requests
import json
class YunPian(object):
	def __init__(self,apikey):
		self.apikey =apikey
		self.sms_send_uri  = "https://sms.yunpian.com/v2/sms/single_send.json"

	def set_msg(self,mobile,code):

		data = {
			"apikey":self.apikey,
			"mobile":mobile,
			#注意模板已经固定好了，动态变化的只能是验证码，否则报错
			"text":"【杨光福】您的验证码是{code}。如非本人操作，请忽略本短信".format(code=code)
		}

		response = requests.post(self.sms_send_uri,data=data)
		text = response.text
		# print(text)
		dicjson = json.loads(text)
		print(dicjson)
		return dicjson


if __name__ == "__main__":
	yp = YunPian("4f70824dde066067241393c80c291ea6")
	#第一个参数：要发送到的手机，第二参数：发给对应手机的验证码
	yp.set_msg("18601042258","2018")