from datetime import datetime
from django.shortcuts import render
from django.views import View

from items.models import Funding


class ItemDetailView(View):
    """
    众筹详情
    """

    def get(self, request, funding_id):
        if funding_id:
            funding = Funding.objects.filter(id=int(funding_id))[0]
            days = (funding.dead_line - datetime.now()).days
            paybackt_list = funding.payback_set.all()
        return render(request, 'items/project.html', {'funding': funding, 'days': days, 'paybackt_list': paybackt_list})
