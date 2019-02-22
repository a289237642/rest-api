#encoding=utf-8
#__Author__: weesmile
#__Date__: 2018-07-21
from users.models import EmailVerifyCode
from random import randint
from django.core.mail import send_mail
from GuLiEdu.settings import EMAIL_FROM
from GuLiEdu.celery import app
def get_random_code(code_length):
    code_source = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM'
    code = ''
    for i in range(code_length):
        code += code_source[randint(0,len(code_source)-1)]
    return code

@app.task
def send_email_code(email,send_type):
    #第一步先存储验证码对象
    code = get_random_code(8)
    email_ver = EmailVerifyCode()
    email_ver.email = email
    email_ver.send_type = send_type
    email_ver.code = code
    email_ver.save()
    #第二步，准备参数发送邮件
    send_title = ''
    send_body = ''
    #根据发送类型不同，准备不同的参数
    if send_type == 'register':
        send_title = '欢迎注册谷粒教育在线网站'
        send_body = '请点击以下链接进行激活:\n http://127.0.0.1:8000/users/user_active/'+code
        send_mail(send_title,send_body,EMAIL_FROM,[email])

    if send_type == 'forget':
        send_title = '谷粒教育重置密码系统'
        send_body = '请点击以下链接进行重置密码:\n http://127.0.0.1:8000/users/user_resetpwd/'+code
        send_mail(send_title,send_body,EMAIL_FROM,[email])

    if send_type == 'change':
        send_title = '谷粒教育重置邮箱系统'
        send_body = '您的验证码是：'+code
        send_mail(send_title,send_body,EMAIL_FROM,[email])