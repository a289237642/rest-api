import xadmin
from .models import UserLove


class UserLoveXadmin(object):
    list_display = ["project", "user", "love_status", "add_time"]
    search_fields = ["project__title", "user__username", "love_status"]
    list_filter = ["project", "user", "love_status"]


xadmin.site.register(UserLove, UserLoveXadmin)
