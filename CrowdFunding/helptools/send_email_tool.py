from random import randint

from django.core.mail import send_mail

from users.models import EmailVerify
from CrowdFunding.settings import EMAIL_FORM


def get_random_code(code_length=6):
    code_source = '1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM'
    code = ''
    for i in range(code_length):
        code += code_source[randint(0, len(code_source) - 1)]
    return code


def send_email_verify(email):
    code = get_random_code()
    email_ver = EmailVerify()
    email_ver.email = email
    email_ver.code = code
    email_ver.save()

    send_title = '欢迎实名认证尚众筹'
    send_body = '您的验证码为' + code + ',请尽快输入以完成验证'

    send_mail(send_title, send_body, EMAIL_FORM, [email])
