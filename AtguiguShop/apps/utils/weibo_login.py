#得到认证的url
def get_auth_url():
	client_id = "733286461"
	weibo_auth_url = "https://api.weibo.com/oauth2/authorize"
	#微博跳转到我们应用的路径
	redirect_uri = "http://127.0.0.1:8000/complete/weibo/"

	auth_url = weibo_auth_url+"?client_id="+client_id+"&redirect_uri="+redirect_uri
	print("auth_url==",auth_url)
	return auth_url


def get_access_token(code=None):
	access_token_url = "https://api.weibo.com/oauth2/access_token"
	client_id = "733286461"
	client_secret = "29736113f69dd6d676b70860af7fbbe0"
	#注意这个有失效性，如果出错，再次运行get_auth_url
	# code = "c430bb5c5bda0f1e02c6f5f15baa2dde"
	grant_type = "authorization_code"
	redirect_uri = "http://127.0.0.1:8000/complete/weibo/"

	data = {
		"client_id":client_id,
		"client_secret":client_secret,
		"code":code,
		"grant_type":grant_type,
		"redirect_uri":redirect_uri

	}
	import requests
	response = requests.post(access_token_url,data=data)
	print(response.text)

#得到用户的信息
def get_user_info(access_token=None,uid=None):
	user_info_url = "https://api.weibo.com/2/users/show.json"
	import requests
	url = user_info_url+"?access_token="+access_token+"&uid="+uid
	response = requests.get(url)
	print("user_info==",response.text)


if __name__ =="__main__":
	get_auth_url()
	get_access_token(code = "dfb259ade25d48ad2a8ac7a26ef31c0e")
	get_user_info(access_token="2.002jtHnB0zSncna9183c6422KntlsC",uid="1642055823")



