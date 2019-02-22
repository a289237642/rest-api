# encoding=utf-8
# __Author__: weesmile
# __Date__: 2018-06-14
import xadmin
from .models import CourseInfo, LessonInfo, VideoInfo, SourceInfo


class CourseInfoXadmin(object):
    list_display = ['name', 'desc', 'level', 'stunum', 'study_time', 'click_num', 'orginfo', 'teacherinfo', 'add_time']
    search_fields = ['name', 'desc', 'level', 'stunum', 'study_time', 'click_num', 'orginfo', 'teacherinfo']
    list_filter = ['name', 'desc', 'level', 'stunum', 'study_time', 'click_num', 'orginfo', 'teacherinfo', 'add_time']
    style_fields = {'detail': 'ueditor'}


class LessonInfoXadmin(object):
    list_display = ['name', 'courseinfo', 'add_time']
    search_fields = ['name', 'courseinfo']
    list_filter = ['name', 'courseinfo', 'add_time']


class VideoInfoXadmin(object):
    list_display = ['name', 'study_time', 'url', 'lessoninfo', 'add_time']
    search_fields = ['name', 'study_time', 'url', 'lessoninfo']
    list_filter = ['name', 'study_time', 'url', 'lessoninfo', 'add_time']


class SourceInfoXadmin(object):
    list_display = ['name', 'file_addr', 'courseinfo', 'add_time']
    search_fields = ['name', 'file_addr', 'courseinfo', 'add_time']
    list_filter = ['name', 'file_addr', 'courseinfo', 'add_time']


xadmin.site.register(CourseInfo, CourseInfoXadmin)
xadmin.site.register(LessonInfo, LessonInfoXadmin)
xadmin.site.register(VideoInfo, VideoInfoXadmin)
xadmin.site.register(SourceInfo, SourceInfoXadmin)
