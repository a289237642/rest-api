from django.db import models
from datetime import datetime
from users.models import UserProfile


# Create your models here.
class CatgoryInfo(models.Model):
    name = models.CharField(max_length=20, verbose_name="分类名称")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "分类信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class ProjectInfo(models.Model):
    title = models.CharField(max_length=30, verbose_name="项目标题")
    desc = models.CharField(max_length=200, verbose_name="项目简介")
    love_num = models.IntegerField(default=0, verbose_name='收藏数')
    image = models.ImageField(upload_to='project/%y/%m', verbose_name="项目图片详情", max_length=100, blank=True, null=True)
    nums = models.IntegerField(default=0, verbose_name="关注人数")
    status = models.CharField(choices=(('jjks', '即将开始'), ('zcz', '众筹中'), ('zccg', '众筹成功'), ('zcsb', '众筹失败')),
                              max_length=10,
                              verbose_name="状态")
    categoryinfo = models.ForeignKey(CatgoryInfo, verbose_name="所属项目")
    money_total = models.FloatField(default=0.0, verbose_name="目标金额")
    money_ing = models.FloatField(default=0.0, verbose_name="已筹金额")
    projectInfo = models.ForeignKey(UserProfile, verbose_name="所属人")
    days = models.IntegerField(default=30, verbose_name="众筹总天数")
    is_status = models.CharField(choices=(('未支持', '未支持'), ('支持', '支持')), max_length=10, verbose_name="支持状态",
                                 default='0')
    end_time = models.DateTimeField(default=datetime.now, verbose_name="截止日期", blank=True, null=True)
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "项目信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title


# 项目图片
class ImageInfo(models.Model):
    image = models.ImageField(upload_to='projects/%y/%m', verbose_name="项目图片", max_length=100)
    projectInfo = models.ForeignKey(ProjectInfo, verbose_name="所属项目")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "项目图片"
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.image)
