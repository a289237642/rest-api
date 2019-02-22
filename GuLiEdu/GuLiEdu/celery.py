# encoding=utf-8
# __Author__: weesmile
# __Date__: 2018-07-29
from __future__ import absolute_import
import os
import django
from celery import Celery
from django.conf import settings

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'GuLiEdu.settings')
django.setup()
app = Celery('GuLiEdu')
app.config_from_object('django.conf:settings')
app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)
