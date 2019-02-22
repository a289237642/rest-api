from xadmin import views
import xadmin
from .models import VerifyCode


class GlobalSettings(object):
    # 网站标题
    site_title = "***商店后台"
    # 网站页面的起始目录
    site_footer = "myself 289237642"
    menu_style = 'accordion'


class BaseXadminSettings(object):
    enable_themes = True

    use_bootswatch = True


class VerifyCodeAdmin(object):
    # 字段控制显示
    list_display = ['code', 'mobile', "add_time"]


xadmin.site.register(VerifyCode, VerifyCodeAdmin)
xadmin.site.register(views.CommAdminView, GlobalSettings)
xadmin.site.register(views.BaseAdminView, BaseXadminSettings)

# import xadmin
# from .models import VerifyCode
# from xadmin import views
#
#
# class GlobalSettings(object):
#     site_title = '硅谷商店后台'
#     site_footer = 'atguigu_shop'
#     menu_style = 'accordion'
#
#
# class BaseXAdminSettings(object):
#     enable_themes = True
#     use_bootswath = True
#
#
# class VerifyCodeXAdmin(object):
#     list_display = ['code', 'mobile', "add_time"]
#
#
# xadmin.site.register(VerifyCode, VerifyCodeXAdmin)
# xadmin.site.register(views.CommAdminView, GlobalSettings)
# xadmin.site.register(views.BaseAdminView, BaseXAdminSettings)
