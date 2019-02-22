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
from .views import org_list,org_detail,org_detail_course,org_detail_desc,org_detail_teacher,teacher_list,teacher_detail

urlpatterns = [
    url(r'^org_list/$',org_list,name='org_list'),
    url(r'^org_detail/(\d+)/$', org_detail, name='org_detail'),
    url(r'^org_detail_course/(\d+)/$', org_detail_course, name='org_detail_course'),
    url(r'^org_detail_desc/(\d+)/$', org_detail_desc, name='org_detail_desc'),
    url(r'^org_detail_teacher/(\d+)/$', org_detail_teacher, name='org_detail_teacher'),

    url(r'^teacher_list/$',teacher_list,name='teacher_list'),
    url(r'^teacher_detail/(\d+)/$', teacher_detail, name='teacher_detail'),
]
