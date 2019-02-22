#encoding=utf-8
#__Author__: weesmile
#__Date__: 2018-07-20
import xadmin
from .models import UserAsk,UserComment,UserCourse,UserLove,UserMessage

class UserLoveAdmin(object):
    list_display = ['love_man','love_id','love_type','love_status','add_time']



class UserCourseAdmin(object):
    list_display = ['study_man', 'study_course',  'add_time']


class UserAskAdmin(object):
    list_display = ['name', 'phone', 'course','add_time']


class UserCommentAdmin(object):
    list_display = ['comment_man', 'comment_course', 'content', 'add_time']


class UserMessageAdmin(object):
    list_display = ['msg_user', 'msg_content', 'msg_status', 'add_time']

xadmin.site.register(UserLove,UserLoveAdmin)
xadmin.site.register(UserCourse,UserCourseAdmin)
xadmin.site.register(UserAsk,UserAskAdmin)
xadmin.site.register(UserComment,UserCommentAdmin)
xadmin.site.register(UserMessage,UserMessageAdmin)