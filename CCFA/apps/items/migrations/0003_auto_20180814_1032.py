# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2018-08-14 10:32
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('items', '0002_auto_20180814_0846'),
    ]

    operations = [
        migrations.AlterField(
            model_name='projectinfo',
            name='status',
            field=models.CharField(choices=[('jjks', '即将开始'), ('zcz', '众筹中'), ('zccg', '众筹成功'), ('zcsb', '众筹失败')], max_length=10, verbose_name='状态'),
        ),
    ]