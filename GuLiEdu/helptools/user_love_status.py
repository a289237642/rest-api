#encoding=utf-8
#__Author__: weesmile
#__Date__: 2018-07-24
from operations.models import UserLove

def get_love_status(request,love_id,love_type):
    love_statu = False
    if request.user.is_authenticated():
        love = UserLove.objects.filter(love_man=request.user, love_id=int(love_id), love_type=love_type)
        if love:
            love_statu = love[0].love_status
    return love_statu