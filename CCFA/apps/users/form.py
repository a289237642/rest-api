from django import forms


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
