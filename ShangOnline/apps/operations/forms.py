#encoding=utf-8
#__Author__: weesmile
#__Date__: 2018-06-20
from django import forms
from .models import UserAskInfo
import re
class UserAskForm(forms.ModelForm):
    class Meta:
        model = UserAskInfo
        #当我们要验证的字段完全和model当中对应，那么用这个
        # fields = '__all__'
        #当我们仅仅是model当中有限个字段进行验证，可以指定显示和验证哪些字段
        fields = ['name','phone','course']
        #除去哪些字段
        # exclude = ['add_time']

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        #1 创建正则对象
        com = re.compile('^(13\d|14[57]|15\d|166|17[367]|18\d)\d{8}$')
        if com.match(phone):
            return phone
        else:
            raise forms.ValidationError('手机验证不合法')

class UserCommentForm(forms.Form):
    content = forms.CharField(max_length=200,min_length=1,required=True)
    courseid = forms.IntegerField(required=True)