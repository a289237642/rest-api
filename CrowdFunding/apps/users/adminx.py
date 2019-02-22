import xadmin
from xadmin import views

from .models import EmailVerify


class BaseXadminSettings(object):
    enable_themes = True
    use_bootswatch = True


class GlobaSiteSettings(object):
    site_title = '众筹后台管理系统'
    site_footer = 'myself a289237642'
    menu_style = 'accordion'


class EmailVerifyXadmin:
    list_display = ['code','email','add_time']


xadmin.site.register(EmailVerify,EmailVerifyXadmin)
xadmin.site.register(views.BaseAdminView, BaseXadminSettings)
xadmin.site.register(views.CommAdminView, GlobaSiteSettings)