#encoding=utf-8
#__Author__: weesmile
#__Date__: 2018-07-21
from django import forms
from captcha.fields import CaptchaField
from .models import UserProfile
class UserRegisterForm(forms.Form):
    email = forms.EmailField(required=True,min_length=8,error_messages={
        'required':'邮箱必须填写',
        'min_length':'邮箱最小8位'
    })
    password = forms.CharField(required=True,min_length=3,max_length=20,error_messages={
        'required': '密码必须填写',
        'min_length': '密码最小3位',
        'max_length':'密码最大20位'
    })
    captcha = CaptchaField()

class UserLoginForm(forms.Form):
    email = forms.EmailField(required=True,min_length=8,error_messages={
        'required':'邮箱必须填写',
        'min_length':'邮箱最小8位'
    })
    password = forms.CharField(required=True,min_length=3,max_length=20,error_messages={
        'required': '密码必须填写',
        'min_length': '密码最小3位',
        'max_length':'密码最大20位'
    })

class UserForgetpwdForm(forms.Form):
    email = forms.EmailField(required=True,min_length=8,error_messages={
        'required':'邮箱必须填写',
        'min_length':'邮箱最小8位'
    })
    captcha = CaptchaField()

class UserResetpwdForm(forms.Form):
    password = forms.CharField(required=True,min_length=3,max_length=20,error_messages={
        'required': '密码必须填写',
        'min_length': '密码最小3位',
        'max_length':'密码最大20位'
    })
    password1 = forms.CharField(required=True, min_length=3, max_length=20, error_messages={
        'required': '重复密码必须填写',
        'min_length': '重复密码最小3位',
        'max_length': '重复密码最大20位'
    })

class UserChangeImageForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['image']

class UserChangeInfoForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['nick_name','birthday','gender','address','phone']

class UserChangeEmailForm(forms.Form):
    email = forms.EmailField(required=True)

class UserResetEmailForm(forms.Form):
    email = forms.EmailField(required=True)
    code = forms.CharField(required=True)
