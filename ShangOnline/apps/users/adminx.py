#encoding=utf-8
#__Author__: weesmile
#__Date__: 2018-06-13
import xadmin
from .models import EmailVerify,Banner
from xadmin import views
class BaseXadminSettings(object):
    enable_themes = True
    use_bootswatch = True

class GlobaSiteSettings(object):
    site_title = '尚在线后台管理系统'
    site_footer = '尚硅谷IT教育'
    menu_style = 'accordion'


class EmailVerifyXadmin(object):
    list_display = ['email','code','send_type','add_time']
    search_fields = ['email','code','send_type']
    list_filter = ['email','code','send_type','add_time']

class BannerXadmin(object):
    list_display = ['image', 'url', 'add_time']
    search_fields = ['image', 'url']
    list_filter = ['image', 'url', 'add_time']



xadmin.site.register(EmailVerify,EmailVerifyXadmin)
xadmin.site.register(Banner,BannerXadmin)
xadmin.site.register(views.BaseAdminView,BaseXadminSettings)
xadmin.site.register(views.CommAdminView,GlobaSiteSettings)