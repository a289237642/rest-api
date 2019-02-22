import xadmin
from .models import EmailVerify, Banner
from xadmin import views


class BaseXadminSettings(object):
    enable_themes = True
    use_bootswatch = True


class GlobaSiteSettings(object):
    site_title = '众筹后台管理系统'
    site_footer = 'myself a289237642'
    menu_style = 'accordion'


class EmailVerifyXadmin(object):
    list_display = ['email', 'code', 'send_type', 'add_time']
    search_fields = ['email', 'code', 'send_type']
    list_filter = ['email', 'code', 'send_type', 'add_time']


class BannerXadmin(object):
    list_display = ['image', 'add_time']
    search_fields = ['image']
    list_filter = ['image', 'add_time']


xadmin.site.register(EmailVerify, EmailVerifyXadmin)
xadmin.site.register(Banner, BannerXadmin)
xadmin.site.register(views.BaseAdminView, BaseXadminSettings)
xadmin.site.register(views.CommAdminView, GlobaSiteSettings)
