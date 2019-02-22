import xadmin

from .models import UserFav,UserSupport,Banner


class UserFavXadmin:
    pass


class UserSupportXadmin:
    pass


class BannerXadmin:
    pass


xadmin.site.register(UserFav,UserFavXadmin)
xadmin.site.register(UserSupport,UserSupportXadmin)
xadmin.site.register(Banner,BannerXadmin)