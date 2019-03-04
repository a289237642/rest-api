from django.db.models import Model, CharField, GenericIPAddressField, IntegerField, TextField, DateTimeField, \
    ManyToManyField, ForeignKey, DO_NOTHING, BooleanField


# Create your models here.
class Client(Model):
    name = CharField(max_length=255, default=None, verbose_name="主机名")
    ip = CharField(max_length=255, blank=True, null=True, verbose_name="IP地址")
    port = IntegerField(default=6800, blank=True, null=True, verbose_name="端口")
    description = TextField(blank=True, null=True, verbose_name="主机描述")
    auth = IntegerField(default=0, blank=True, null=True, verbose_name="认证")
    username = CharField(max_length=255, blank=True, null=True, verbose_name="主机用户名")
    password = CharField(max_length=255, blank=True, null=True, verbose_name="密码")
    created_at = DateTimeField(auto_now_add=True, blank=True, null=True, verbose_name="创建时间")
    updated_at = DateTimeField(auto_now=True, blank=True, null=True, verbose_name="更新时间")

    class Meta:
        verbose_name = "主机"
        verbose_name_plural = "主机"

    def __str__(self):
        return self.name




