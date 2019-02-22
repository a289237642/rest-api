#encoding=utf-8
#__Author__: weesmile
#__Date__: 2018-06-14
import xadmin
from .models import UserAskInfo,UserCommentInfo,UserCourseInfo,UserLoveInfo,UserMessageInfo
class UserAskInfoXadmin(object):
    list_display = ['name', 'phone', 'course', 'add_time']
    search_fields = ['name', 'phone', 'course']
    list_filter = ['name', 'phone', 'course', 'add_time']
    model_icon = 'fa fa-bath'


class UserLoveInfoXadmin(object):
    list_display = ['userinfo', 'love_id', 'love_type', 'love_status','add_time']
    search_fields = ['userinfo', 'love_id', 'love_type', 'love_status']
    list_filter = ['userinfo', 'love_id', 'love_type', 'love_status','add_time']


class UserCourseInfoXadmin(object):
    list_display = ['userinfo', 'courseinfo', 'add_time']
    search_fields = ['userinfo', 'courseinfo']
    list_filter = ['userinfo', 'courseinfo', 'add_time']

class UserMessageInfoXadmin(object):
    list_display = ['userinfo', 'message', 'msg_status','add_time']
    search_fields = ['userinfo', 'message', 'msg_status']
    list_filter = ['userinfo', 'message', 'msg_status','add_time']


class UserCommentInfoXadmin(object):
    list_display = ['userinfo', 'courseinfo', 'comment_content', 'add_time']
    search_fields = ['userinfo', 'courseinfo', 'comment_content']
    list_filter = ['userinfo', 'courseinfo', 'comment_content', 'add_time']

xadmin.site.register(UserAskInfo,UserAskInfoXadmin)
xadmin.site.register(UserLoveInfo,UserLoveInfoXadmin)
xadmin.site.register(UserCourseInfo,UserCourseInfoXadmin)
xadmin.site.register(UserMessageInfo,UserMessageInfoXadmin)
xadmin.site.register(UserCommentInfo,UserCommentInfoXadmin)
