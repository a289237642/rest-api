from django.db.models.signals import post_save,post_delete
from django.dispatch import receiver
from .models import UserFav


#接收post_save这种类型的信号量，接收User的
@receiver(post_save, sender=UserFav)#instance就是UserProfile
def save_userfav(sender, instance=None, created=False, **kwargs):
    #当添加收藏的时候
    if created:
        goods = instance.goods
        goods.fav_num += 1
        goods.save()


#接收post_save这种类型的信号量，接收User的
@receiver(post_delete, sender=UserFav)#instance就是UserProfile
def delete_userfav(sender, instance=None, created=False, **kwargs):
    #当添加收藏的时候
    goods = instance.goods
    goods.fav_num -= 1
    goods.save()
