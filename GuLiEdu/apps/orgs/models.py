from django.db import models
from datetime import datetime
from DjangoUeditor.models import UEditorField
# Create your models here.
class CityInfo(models.Model):
    name = models.CharField(max_length=20,verbose_name="城市名称")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "城市信息"
        verbose_name_plural = verbose_name

class OrgInfo(models.Model):
    name = models.CharField(max_length=20,verbose_name="机构名称")
    image = models.ImageField(upload_to='orgs/%y/%m/%d',verbose_name="机构封面")
    study_num = models.IntegerField(default=0,verbose_name="学习人数")
    address = models.CharField(max_length=200,verbose_name="机构地址")
    org_category = models.CharField(choices=(('个人','个人'),('高校','高校'),('培训机构','培训机构')),max_length=16,verbose_name="机构类别",default='培训机构')
    desc = models.CharField(max_length=300,verbose_name="机构简介")
    detail = UEditorField(verbose_name='机构详情',
                         width=700,
                         height=400,
                         toolbars='full',
                         imagePath='ueditor/images/',
                         filePath='ueditor/files/',
                         upload_settings={'imageMaxSizing':1024000},
                         default='')
    course_num = models.IntegerField(default=0,verbose_name="机构课程数")
    click_num = models.IntegerField(default=0,verbose_name="访问量")
    love_num = models.IntegerField(default=0,verbose_name="收藏人数")
    city = models.ForeignKey(CityInfo,verbose_name='所属城市')
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '机构信息'
        verbose_name_plural = verbose_name

class TeacherInfo(models.Model):
    name = models.CharField(max_length=20,verbose_name="教师姓名")
    image = models.ImageField(upload_to='teachers/%y/%m/%d', verbose_name="教师头像")
    age = models.IntegerField(default=30,verbose_name="教师年龄")
    work_year = models.IntegerField(default=3,verbose_name="工作年限")
    work_position = models.CharField(max_length=20,verbose_name="工作职位")
    work_company = models.CharField(max_length=20,verbose_name="就职公司")
    work_style = models.CharField(max_length=20,verbose_name="教学特点")
    click_num = models.IntegerField(default=0, verbose_name="访问量")
    love_num = models.IntegerField(default=0, verbose_name="收藏人数")
    org = models.ForeignKey(OrgInfo,verbose_name="所属机构")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = '教师信息'
        verbose_name_plural = verbose_name