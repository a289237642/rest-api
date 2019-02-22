#encoding=utf-8
#__Author__: weesmile
#__Date__: 2018-07-24
from django import forms
from .models import UserAsk
import re

class UserAskForm(forms.ModelForm):
    # name = forms.CharField(required=True,min_length=6)
    class Meta:
        model = UserAsk
        #对那些字段验证的，就放到这个列表当中
        fields = ['name','phone','course']
        # #除去哪个字段，就放在这个列表当中
        # exclude =['add_time']

    def clean_phone(self):
        phone = self.cleaned_data['phone']

        #创建正则对象
        com = re.compile('^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$')
        #使用正则对象去匹配手机号
        if com.match(phone):
            return phone
        else:
            raise forms.ValidationError('手机号码不正确')


class UserCommentForm(forms.Form):
    comment_course = forms.IntegerField(required=True)
    content = forms.CharField(min_length=1,required=True)
