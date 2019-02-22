# encoding=utf-8
# __Author__: weesmile
# __Date__: 2018-06-15
import re
from django import forms
from captcha.fields import CaptchaField
from .models import UserProfile, EmailVerify


class UserRegisterForm(forms.Form):
    email = forms.EmailField(required=True, error_messages={
        'required': '邮箱必须填写'
    })
    password = forms.CharField(min_length=1, max_length=20, required=True, error_messages={
        'required': '密码必须填写',
        'min_length': '密码最少得1个',
        'max_length': '密码最多20个',
    })
    captcha = CaptchaField(error_messages={
        'invalid': '验证码错误'
    })


class UserLoginForm(forms.Form):
    email = forms.EmailField(required=True, error_messages={
        'required': '邮箱必须填写'
    })
    password = forms.CharField(min_length=1, max_length=20, required=True, error_messages={
        'required': '密码必须填写',
        'max_length': '密码最多20个',
        "min_length": '密码最少1个'
    })


class UserForgetForm(forms.Form):
    email = forms.EmailField(required=True, error_messages={
        'required': '邮箱必须填写'
    })
    captcha = CaptchaField(error_messages={
        'invalid': '验证码错误'
    })


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


class UserChangeImageform(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['image']


class UserChangeInfoForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['nick_name', 'birthday', 'gender', 'phone', 'address']

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        # 1 创建正则对象
        com = re.compile('^(13\d|14[57]|15\d|166|17[367]|18\d)\d{8}$')
        if com.match(phone):
            return phone
        else:
            raise forms.ValidationError('手机验证不合法')


class UserSendCodeForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['email']


class UserChangeEmailForm(forms.ModelForm):
    class Meta:
        model = EmailVerify
        fields = ['email', 'code']
