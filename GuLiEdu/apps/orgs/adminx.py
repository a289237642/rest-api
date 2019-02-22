#encoding=utf-8
#__Author__: weesmile
#__Date__: 2018-07-20
import xadmin
from .models import CityInfo,OrgInfo,TeacherInfo


class CityInfoAdmin(object):
    list_display = ['name','add_time']


class OrgInfoAdmin(object):
    list_display = ['name', 'image','study_num','org_category','city','love_num','add_time']
    model_icon = 'fa fa-user'
    style_fields = {'detail': 'ueditor'}


class TeacherInfoAdmin(object):
    list_display = ['name', 'image', 'age', 'org', 'work_company', 'love_num', 'add_time']


xadmin.site.register(CityInfo,CityInfoAdmin)
xadmin.site.register(OrgInfo,OrgInfoAdmin)
xadmin.site.register(TeacherInfo,TeacherInfoAdmin)