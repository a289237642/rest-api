from django.db.models import Model, CharField, GenericIPAddressField, IntegerField, TextField, DateTimeField, \
    ManyToManyField, ForeignKey, DO_NOTHING, BooleanField


# Create your models here.
class Task(Model):
    clients = TextField(null=True, blank=True, verbose_name="主机名")
    project = CharField(max_length=255, null=True, blank=True, verbose_name="项目")
    spider = CharField(max_length=255, null=True, blank=True, verbose_name='爬虫名')
    name = CharField(max_length=255, null=True, blank=True)
    args = TextField(null=True, blank=True)
    description = TextField(null=True, blank=True)
    trigger = CharField(max_length=255, null=True, blank=True)
    configuration = TextField(null=True, blank=True)
    modified = BooleanField(blank=True, default=False)
    created_at = DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_at = DateTimeField(auto_now=True, blank=True, null=True)

    def __str__(self):
        return self.name
