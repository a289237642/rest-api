"""ShangOnline URL Configuration

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
from .views import UserRegisterView, UserActiveView, UserLoginView, user_logout, UserForgetView, UserResetView

urlpatterns = [
    url(r'^user_register/$', UserRegisterView.as_view(), name='user_register'),
    url(r'^user_active/(\w+)/$', UserActiveView.as_view(), name='user_active'),
    url(r'^user_login/$', UserLoginView.as_view(), name='user_login'),
    url(r'^user_logout/$', user_logout, name='user_logout'),
    url(r'^user_forget/$', UserForgetView.as_view(), name='user_forget'),
    url(r'^user_forget/$', UserForgetView.as_view(), name='user_forget'),
    url(r'^user_reset/(\w+)/$', UserResetView.as_view(), name='user_reset'),

]
