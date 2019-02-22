#encoding=utf-8
__author__ = 'weesmile'
__date__ = '2017/12/10 0010 下午 16:09'
from django import forms
from users.models import UserProfile
class RegisterForm(forms.Form):
    username = forms.CharField(required=True,max_length=15,min_length=6,error_messages={
        'required':"用户名必须填写",
        'max_length':'用户名最大长度不能超过15',
        'min_length':'用户名最小长度不能小于8'
    })
    password = forms.CharField(required=True,max_length=15,min_length=6,error_messages={
        'required':"密码必须填写",
        'max_length':'密码最大长度不能超过15',
        'min_length':'密码最小长度不能小于8'
    })
    password1 = forms.CharField(required=True, max_length=15, min_length=6, error_messages={
        'required': "密码必须填写",
        'max_length': '密码最大长度不能超过15',
        'min_length': '密码最小长度不能小于8'
    })
    email = forms.EmailField(required=True,error_messages={
        'required': "邮箱必须填写",
    })




class LoginForm(forms.Form):
    username = forms.CharField(required=True,max_length=15,min_length=6,error_messages={
        'required':"用户名必须填写",
        'max_length':'用户名最大长度不能超过15',
        'min_length':'用户名最小长度不能小于8'
    })
    password = forms.CharField(required=True,max_length=15,min_length=6,error_messages={
        'required':"密码必须填写",
        'max_length':'密码最大长度不能超过15',
        'min_length':'密码最小长度不能小于8'
    })

