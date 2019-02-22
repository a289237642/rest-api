from django import forms

from users.models import UserAuth, EmailVerify


class ApplyForm(forms.ModelForm):
    class Meta:
        model = UserAuth
        fields = ['real_name', 'id_num', 'phone']


class UserRegisterForm(forms.Form):
    username = forms.CharField(min_length=1, max_length=10, required=True, error_messages={
        'required': '用户名必须填写',
        'min_length': '用户名最少得1个',
        'max_length': '用户名最多10个',
    })
    password = forms.CharField(min_length=1, max_length=20, required=True, error_messages={
        'required': '密码必须填写',
        'min_length': '密码最少得1个',
        'max_length': '密码最多20个',
    })
    email = forms.EmailField(required=True, error_messages={"required": '邮箱必须填写'})


class UserLoginForm(forms.Form):
    username = forms.CharField(min_length=1, max_length=10, required=True, error_messages={
        'required': '用户名必须填写',
        'min_length': '用户名最少得1个',
        'max_length': '用户名最多10个',
    })
    password = forms.CharField(min_length=1, max_length=20, required=True, error_messages={
        'required': '密码必须填写',
        'min_length': '密码最少得1个',
        'max_length': '密码最多20个',
    })


class ApplyForm(forms.ModelForm):
    class Meta:
        model = UserAuth
        fields = ['real_name', 'id_num', 'phone']


class ApplyOneForm(forms.ModelForm):
    class Meta:
        model = UserAuth
        fields = ['id_photo']


class ApplyTwoForm(forms.Form):
    email = forms.EmailField(required=True)


class ApplyThreeForm(forms.ModelForm):
    class Meta:
        model = EmailVerify
        fields = ['code']
