from django.db import models
from users.models import UserProfile
from courses.models import CourseInfo
from datetime import datetime
# Create your models here.
class UserLove(models.Model):
    love_man = models.ForeignKey(UserProfile,verbose_name="收藏人")
    love_id = models.IntegerField(verbose_name="收藏id")
    love_type = models.IntegerField(choices=((1,'机构'),(2,'课程'),(3,'教师')),verbose_name="收藏类型")
    love_status = models.BooleanField(default=False,verbose_name="收藏状态")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="收藏时间")

    def __str__(self):
        return self.love_man.username

    class Meta:
        verbose_name = '收藏信息'
        verbose_name_plural = verbose_name


class UserCourse(models.Model):
    study_man = models.ForeignKey(UserProfile,verbose_name="学习人")
    study_course = models.ForeignKey(CourseInfo,verbose_name="学习课程")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    def __str__(self):
        return self.study_man.username

    class Meta:
        unique_together = ('study_man','study_course')
        verbose_name = '用户学习课程信息'
        verbose_name_plural = verbose_name

class UserAsk(models.Model):
    name = models.CharField(max_length=20,verbose_name="咨询姓名")
    phone = models.CharField(max_length=11,verbose_name="咨询手机")
    course = models.CharField(max_length=20,verbose_name="咨询课程")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="咨询时间")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '用户咨询信息'
        verbose_name_plural = verbose_name


class UserComment(models.Model):
    comment_man = models.ForeignKey(UserProfile,verbose_name="评论人")
    comment_course = models.ForeignKey(CourseInfo,verbose_name="评论课程")
    content = models.CharField(max_length=300,verbose_name="评论内容")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="评论时间")

    def __str__(self):
        return self.content

    class Meta:
        verbose_name = '用户评论信息'
        verbose_name_plural = verbose_name


class UserMessage(models.Model):
    msg_user = models.IntegerField(verbose_name="消息用户")
    msg_content = models.CharField(max_length=100,verbose_name="消息内容")
    msg_status = models.BooleanField(default=False,verbose_name="消息状态")
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    def __str__(self):
        return self.msg_content

    class Meta:
        verbose_name = '用户消息信息'
        verbose_name_plural = verbose_name
