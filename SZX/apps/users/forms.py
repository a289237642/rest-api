from django import forms
from .models import UserProfile
from captcha.fields import CaptchaField
import re


class UserRegisterForm(forms.Form):
    email = forms.EmailField(required=True, error_messages={"required": '邮箱必须填写'})
    password = forms.CharField(min_length=1, max_length=20, required=True, error_messages={
        'required': '密码必须填写',
        'min_length': '密码最少得1个',
        'max_length': '密码最多20个',
    })
    captcha = CaptchaField(error_messages={'invalid': '验证码错误'})


class UserLoginForm(forms.Form):
    email = forms.EmailField(required=True, error_messages={"required": '邮箱必须填写'})
    password = forms.CharField(min_length=1, max_length=20, required=True, error_messages={
        'required': '密码必须填写',
        'min_length': '密码最少得1个',
        'max_length': '密码最多20个',
    })


class UserForgetForm(forms.Form):
    email = forms.EmailField(required=True, error_messages={"required": '邮箱必须填写'})
    captcha = CaptchaField(error_messages={'invalid': '验证码错误'})


class UserResetForm(forms.Form):
    password = forms.CharField(min_length=1, max_length=20, required=True, error_messages={
        'required': '密码必须填写',
        'max_length': '密码最多20个',
        "min_length": '密码最少3个'
    })
    password1 = forms.CharField(min_length=1, max_length=20, required=True, error_messages={
        'required': '密码必须填写',
        'max_length': '密码最多20个',
        "min_length": '密码最少3个'
    })
