import xadmin
from .models import CourseInfo, VideoInfo, SourceInfo, LessonInfo


class CourseInfoXadmin(object):
    list_display = ['name', 'desc', 'detail', 'level', 'stunum', 'study_time', 'lesson_num', 'category', 'image',
                    'click_num', 'love_num', 'orginfo', 'teacherinfo', 'add_time']
    search_fields = ['name', 'desc', 'detail', 'level', 'stunum', 'study_time', 'lesson_num', 'category', 'image',
                     'click_num', 'love_num', 'orginfo', 'teacherinfo']
    list_filter = ['name', 'desc', 'detail', 'level', 'stunum', 'study_time', 'lesson_num', 'category', 'image',
                   'click_num', 'love_num', 'orginfo', 'teacherinfo', 'add_time']


class LessonInfoXadmin(object):
    list_display = ['name', 'courseinfo', 'add_time']
    search_fields = ['name', 'courseinfo']
    list_filter = ['name', 'courseinfo', 'add_time']


class VideoInfoXadmin(object):
    list_display = ['name', 'study_time', 'lessoninfo', 'url', 'add_time']
    search_fields = ['name', 'study_time', 'lessoninfo', 'url']
    list_filter = ['name', 'study_time', 'lessoninfo', 'url', 'add_time']


class SourceInfoXadmin(object):
    list_display = ['name', 'file_addr', 'courseinfo', 'add_time']
    search_fields = ['name', 'file_addr', 'courseinfo']
    list_filter = ['name', 'file_addr', 'courseinfo', 'add_time']


xadmin.site.register(CourseInfo, CourseInfoXadmin)
xadmin.site.register(LessonInfo, LessonInfoXadmin)
xadmin.site.register(VideoInfo, VideoInfoXadmin)
xadmin.site.register(SourceInfo, SourceInfoXadmin)
