"""GuLiEdu URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from .views import user_register,user_login,user_active,user_logout,user_forgetpwd,user_resetpwd,user_centerinfo,user_changeimage,user_changeinfo,user_changeemail,user_resetemail,user_centerinfo_mycourse,user_centerinfo_loveorg,user_deletelove,user_centerinfo_loveteacher,user_centerinfo_lovecourse,user_centerinfo_mymessage,user_changestatus

urlpatterns = [
    url(r'^user_register/$',user_register,name='user_register'),
    url(r'^user_login/$', user_login, name='user_login'),
    url(r'^user_active/(\w+)/$', user_active, name='user_active'),
    url(r'^user_logout/$', user_logout, name='user_logout'),

    url(r'^user_forgetpwd/$', user_forgetpwd, name='user_forgetpwd'),
    url(r'^user_resetpwd/(\w+)/$', user_resetpwd, name='user_resetpwd'),

    #用户中心个人信息功能
    url(r'^user_centerinfo/$',user_centerinfo,name='user_centerinfo'),
    url(r'^user_changeimage/$', user_changeimage, name='user_changeimage'),
    url(r'^user_changeinfo/$', user_changeinfo, name='user_changeinfo'),
    url(r'^user_changeemail/$', user_changeemail, name='user_changeemail'),
    url(r'^user_resetemail/$', user_resetemail, name='user_resetemail'),

    #用户中心我的课程功能
    url(r'^user_centerinfo_mycourse/$', user_centerinfo_mycourse, name='user_centerinfo_mycourse'),

    #用户中心用户收藏功能
    url(r'^user_centerinfo_loveorg/$', user_centerinfo_loveorg, name='user_centerinfo_loveorg'),
    url(r'^user_centerinfo_loveteacher/$', user_centerinfo_loveteacher, name='user_centerinfo_loveteacher'),
    url(r'^user_centerinfo_lovecourse/$', user_centerinfo_lovecourse, name='user_centerinfo_lovecourse'),
    url(r'^user_deletelove/$', user_deletelove, name='user_deletelove'),

    #用户中心我的消息
    url(r'^user_centerinfo_mymessage/$', user_centerinfo_mymessage, name='user_centerinfo_mymessage'),

    #用户读取消息改变消息状态
    url(r'^user_changestatus/$',user_changestatus,name='user_changestatus')
]
