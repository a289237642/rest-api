from .models import UserLove
from django.views import View
from items.models import ProjectInfo
from django.http import JsonResponse


class UserLoveView(View):
    """用户关注操作"""

    def get(self, request):
        loveid = request.GET.get('loveid', '')
        lover = None
        if loveid:
            lover = UserLove.objects.filter(project_id=int(loveid), user=request.user)
            item = ProjectInfo.objects.filter(id=int(loveid))[0]
            if lover:
                lover = lover[0]
                if lover.love_status:
                    lover.love_status = False
                    item.nums -= 1
                    lover.save()
                    item.save()
                    return JsonResponse({'status': 'del', 'nums': item.nums})
                else:
                    lover.love_status = True
                    item.nums += 1
                    lover.save()
                    item.save()
                    return JsonResponse({'status': 'add', 'nums': item.nums})
            else:
                userlove = UserLove()
                userlove.user = request.user
                userlove.love_status = True
                userlove.project_id = int(loveid)
                userlove.save()
                item.nums += 1
                item.save()
                return JsonResponse({'status': 'add', 'nums': item.nums})
        else:
            return JsonResponse({'status': 'fail'})

    def post(self, request):
        pass
