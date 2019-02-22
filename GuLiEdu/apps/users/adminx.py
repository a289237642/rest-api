#encoding=utf-8
#__Author__: weesmile
#__Date__: 2018-07-20

import xadmin
from .models import BannerInfo,EmailVerifyCode
from xadmin import views

class BaseXadminSetting(object):
    enable_themes = True
    use_bootswatch = True

class GlobalSiteSetting(object):
    site_title = '谷粒教育后台管理系统'
    site_footer = '尚硅谷It教育'
    menu_style = 'accordion'


class BannerInfoAdmin(object):
    list_display = ['image','url','add_time']


class EmailVerifyCodeAdmin(object):
    list_display = ['email', 'code', 'send_type','add_time']

xadmin.site.register(BannerInfo,BannerInfoAdmin)
xadmin.site.register(EmailVerifyCode,EmailVerifyCodeAdmin)

xadmin.site.register(views.BaseAdminView,BaseXadminSetting)
xadmin.site.register(views.CommAdminView,GlobalSiteSetting)