import xadmin

from .models import Funding,PayBack


class FundingXadmin:
    list_display = ['name','category','target_amount','curr_amount','dead_line','status','sponser_brief']


class PayBackXadmin:
    list_display = ['category','payment','payback_content','payback_num','limitation','freight','payback_time']


xadmin.site.register(Funding,FundingXadmin)
xadmin.site.register(PayBack,PayBackXadmin)