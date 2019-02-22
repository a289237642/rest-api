"""CrowdFunding URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url
from .views import UserLogoutView, UserRegisterView, UserLoginView, UserCenterView, UserVerifyView, UserApplyView, \
    UserApplyOneView, UserApplyTwoView, UserApplyThreeView,UserRestartView

urlpatterns = [
    url(r'^user_logout/$', UserLogoutView.as_view(), name='user_logout'),
    url(r'^user_register/$', UserRegisterView.as_view(), name='user_register'),
    url(r'^user_login/$', UserLoginView.as_view(), name='user_login'),
    url(r'^user_center/$', UserCenterView.as_view(), name='user_center'),
    url(r'^user_verify/$', UserVerifyView.as_view(), name='user_verify'),
    url(r'^user_apply/$', UserApplyView.as_view(), name='user_apply'),
    url(r'^user_applyOne/$', UserApplyOneView.as_view(), name='user_applyOne'),
    url(r'^user_applyTwo/$', UserApplyTwoView.as_view(), name='user_applyTwo'),
    url(r'^user_applyThree/$', UserApplyThreeView.as_view(), name='user_applyThree'),
    url(r'^user_restart/$', UserRestartView.as_view(), name='user_restart'),


]
