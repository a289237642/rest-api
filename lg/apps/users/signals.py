from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth import get_user_model

User = get_user_model()


# 接收post_save这种类型的信号量，接收User的,信号量也可以进行加密
# @receiver(post_save, sender=User)
# def create_user(sender, instance=None, created=False, **kwargs):
#     if created:
#         password = instance.password
#         instance.set_password(password)
#         instance.save()
