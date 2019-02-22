from xadmin import views
import xadmin
from .models import VerifyCode


class GlobalSettings(object):
    #网站标题
    site_title = "硅谷商店后台"
    #网站页面起始目录
    site_footer = "atguigu_shop"


class VerifyCodeAdmin(object):
    #字段控制展示显示
    list_display = ['code', 'mobile', "add_time"]

#注册
xadmin.site.register(VerifyCode, VerifyCodeAdmin)
#注册全局配置
xadmin.site.register(views.CommAdminView,GlobalSettings)
