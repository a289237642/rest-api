import xadmin
from xadmin.views import BaseAdminView, CommAdminView


@xadmin.sites.register(BaseAdminView)
class BaseXadminSetting(object):
    enable_themes = True
    use_bootswatch = True


@xadmin.sites.register(CommAdminView)
class GlobalSiteSetting(object):
    site_title = '爬虫后台管理系统'
    site_footer = '北京联创信安科技股份有限公司'
    menu_style = 'accordion'
