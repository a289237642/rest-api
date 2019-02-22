from django.db.models import Model, CharField, GenericIPAddressField, IntegerField, TextField, DateTimeField, \
    ManyToManyField, ForeignKey, DO_NOTHING, BooleanField
from clusters.models import Client


# 爬虫模版
class Project(Model):
    name = CharField(max_length=255, default=None, verbose_name="项目名")
    description = CharField(max_length=255, null=True, blank=True, verbose_name="项目描述")
    egg = CharField(max_length=255, null=True, blank=True)
    configuration = TextField(blank=True, null=True)
    configurable = IntegerField(default=0, blank=True)
    built_at = DateTimeField(default=None, blank=True, null=True)
    generated_at = DateTimeField(default=None, blank=True, null=True)
    created_at = DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_at = DateTimeField(auto_now=True, blank=True, null=True)
    clients = ManyToManyField(Client, through='Deploy', unique=False)

    def __str__(self):
        return self.name


# 部署
class Deploy(Model):
    client = ForeignKey(Client, unique=False, on_delete=DO_NOTHING)
    project = ForeignKey(Project, unique=False, on_delete=DO_NOTHING)
    description = CharField(max_length=255, blank=True, null=True)
    deployed_at = DateTimeField(default=None, blank=True, null=True)
    created_at = DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_at = DateTimeField(auto_now=True, blank=True, null=True)

    class Meta:
        unique_together = ('client', 'project')


# 打包
class Monitor(Model):
    name = CharField(max_length=255, default=None)
    description = CharField(max_length=255, null=True, blank=True)
    type = CharField(max_length=255, null=True, blank=True)
    configuration = TextField(null=True, blank=True)
    project = ForeignKey(Project, blank=True, null=True, on_delete=DO_NOTHING)
    created_at = DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_at = DateTimeField(auto_now=True, blank=True, null=True)
