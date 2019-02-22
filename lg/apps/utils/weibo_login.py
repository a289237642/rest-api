# 得到认证的url
def get_auth_url():
    client_id = "766303709"
    weibo_auth_url = "https://api.weibo.com/oauth2/authorize"
    # 微博跳转到我们应用的路径
    redirect_uri = "http://127.0.0.1:8000/complete/weibo/"

    auth_url = weibo_auth_url + "?client_id=" + client_id + "&redirect_uri=" + redirect_uri
    print("auth_url==", auth_url)
    return auth_url


if __name__ == "__main__":
    get_auth_url()
