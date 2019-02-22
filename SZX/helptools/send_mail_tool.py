from users.models import EmailVerify
from random import randint
from django.core.mail import send_mail
from SZX.settings import EMAIL_FORM


def get_random_code(code_length=8):
    code_source = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM'
    code = ''
    for i in range(code_length):
        code += code_source[randint(0, len(code_source) - 1)]
    return code


def send_email_verify(email, send_type):
    code = get_random_code()
    email_ver = EmailVerify()
    email_ver.email = email
    email_ver.send_type = send_type
    email_ver.code = code
    email_ver.save()

    send_title = ''
    send_body = ''

    if send_type == 'register':
        send_title = '欢迎注册尚在线教育：'
        send_body = '请点击下面链接进行激活\n http://127.0.0.1:8000/users/user_active/' + code
        send_mail(send_title, send_body, EMAIL_FORM, [email])

    if send_type == 'forget':
        send_title = '尚在线重置密码功能：'
        send_body = '请点击下面链接进行重置密码\n http://127.0.0.1:8000/users/user_reset/' + code
        send_mail(send_title, send_body, EMAIL_FORM, [email])
