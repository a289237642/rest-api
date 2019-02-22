# encoding=utf-8
# __Author__: weesmile
# __Date__: 2018-06-13
import xadmin
from .models import CityInfo, OrgInfo, TeacherInfo


class CityInfoXadmin(object):
    list_display = ['name', 'add_time']
    search_fields = ['name']
    list_filter = ['name', 'add_time']


class OrgInfoXadmin(object):
    list_display = ['name', 'image', 'study_num', 'address', 'click_num', 'love_num', 'cityinfo', 'add_time']
    search_fields = ['name', 'image', 'study_num', 'address', 'click_num', 'love_num', 'cityinfo']
    list_filter = ['name', 'image', 'study_num', 'address', 'click_num', 'love_num', 'cityinfo__name', 'add_time']
    style_fields = {'detail': 'ueditor'}


class TeacherInfoXadmin(object):
    list_display = ['name', 'image', 'work_year', 'work_company', 'click_num', 'work_position', 'age', 'work_style',
                    'orginfo', 'add_time']
    search_fields = ['name', 'image', 'work_year', 'work_company', 'click_num', 'work_position', 'age', 'work_style',
                     'orginfo', 'add_time']
    list_filter = ['name', 'image', 'work_year', 'work_company', 'click_num', 'work_position', 'age', 'work_style',
                   'orginfo', 'add_time']


xadmin.site.register(CityInfo, CityInfoXadmin)
xadmin.site.register(OrgInfo, OrgInfoXadmin)
xadmin.site.register(TeacherInfo, TeacherInfoXadmin)
