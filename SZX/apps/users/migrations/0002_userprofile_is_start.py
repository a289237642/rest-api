# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2018-06-21 20:51
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='userprofile',
            name='is_start',
            field=models.BooleanField(default=False, verbose_name='是否激活'),
        ),
    ]