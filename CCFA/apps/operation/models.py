from django.db import models
from datetime import datetime
from items.models import ProjectInfo
from users.models import UserProfile


class UserLove(models.Model):
    project = models.ForeignKey(ProjectInfo, verbose_name='所属项目')
    user = models.ForeignKey(UserProfile, verbose_name='所属收藏人')
    love_status = models.BooleanField(default=False, verbose_name='关注状态')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='关注时间')

    def __str__(self):
        return self.project.title + self.user.username

    class Meta:
        verbose_name = '用户关注'
        verbose_name_plural = verbose_name
