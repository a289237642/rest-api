import xadmin
from .models import Client


@xadmin.sites.register(Client)
class ClientAdmin(object):
    # 字段控制显示
    list_display = ["name", "ip", "port", "description", "auth", "username", "password", "created_at", "updated_at"]
