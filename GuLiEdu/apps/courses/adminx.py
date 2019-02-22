#encoding=utf-8
#__Author__: weesmile
#__Date__: 2018-07-20

import xadmin
from .models import CourseInfo,LessonInfo,VideoInfo,SourceInfo
from orgs.models import TeacherInfo
class CourseInfoAdmin(object):
    list_display = ['name','image','study_time','love_num','level','course_category','org','teacher','add_time']
    model_icon = 'fa fa-bath'
    style_fields = {'detail':'ueditor'}

class LessonInfoAdmin(object):
    list_display = ['name', 'course', 'add_time']



class VideoInfoAdmin(object):
    list_display = ['name', 'study_time', 'url', 'lesson', 'add_time']



class SourceInfoAdmin(object):
    list_display = ['name', 'download', 'course', 'add_time']

xadmin.site.register(CourseInfo,CourseInfoAdmin)
xadmin.site.register(LessonInfo,LessonInfoAdmin)
xadmin.site.register(VideoInfo,VideoInfoAdmin)
xadmin.site.register(SourceInfo,SourceInfoAdmin)
