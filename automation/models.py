# -*- coding: utf-8 -*-
from django.utils import timezone
from django.db import models
from django.contrib.auth.models import User, AbstractUser
# Create your models here.


class User(AbstractUser):
    NickName = models.CharField(verbose_name=u'昵称', max_length=30, null=True, blank=True)
    is_staff = models.BooleanField(default=True)

    class Meta(AbstractUser.Meta):
        verbose_name = u'用户'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.username


class DeviceStandard(models.Model):                                                           # 设备参数表
    class Meta:                                                                               # 起别名：规格参数表
        verbose_name_plural = u'设备规格参数'
        verbose_name = u'《设备规格》'

    DevName = models.CharField(verbose_name=u'设备名称', max_length=20)
    DevType = models.CharField(verbose_name=u'设备类型', max_length=20, default=u'以太交换机')
    SimIntro = models.TextField(verbose_name=u"接口和电源", null=False)
    MAC = models.CharField(max_length=20, null=True)
    IPV4 = models.CharField(verbose_name=u'IPV4路由容量', max_length=20, null=True, blank=True)
    IPV6 = models.CharField(verbose_name=u'IPV6路由容量', max_length=20, null=True, blank=True)
    ThroughPut = models.CharField(verbose_name=u'整系统交换容量', max_length=20, null=True)
    PacketForwarding = models.CharField(verbose_name=u'包转发率', max_length=20, null=True)
    Queue = models.IntegerField(verbose_name=u'队列数', default=8)

    Manager = models.ForeignKey(User, related_name='user_standard', null=True, verbose_name=u'管理员',)

    IsDelete = models.BooleanField(verbose_name=u'移至回收站', default=False)
    CreateTime = models.DateTimeField(u'创建时间', default=timezone.now)
    LastEditTime = models.DateTimeField(u'最后修改时间', auto_now=True)

    def delete(self, using=None, keep_parents=False):   # 配合delete_model函数实现模型实例form页面逻辑删除
        self.IsDelete = True
        self.save()

    def __unicode__(self):
        return self.DevName


class TestPartner(models.Model):
    class Meta:                                                                               # 起别名：测试机构人员表
        verbose_name_plural = u'测试机构客户'
        verbose_name = u'《机构客户》'
    TestOrganization = models.CharField(verbose_name=u'测试机构', max_length=20)              # 测试机构
    TestUserName = models.CharField(verbose_name=u'测试人员', max_length=20)                  # 测试人员
    Tel = models.BigIntegerField(verbose_name=u'联系方式')                                    # 联系方式
    Email = models.CharField(verbose_name=u'邮箱', max_length=30, default=" ")                # email
    SpecManager = models.CharField(verbose_name=u'管理员', max_length=20, default="")         # 管理员创建规格信息模板
    IsDelete = models.BooleanField(default=False)                   # 默认不删除
    CreateTime = models.DateTimeField(u'创建时间', default=timezone.now)
    LastEditTime = models.DateTimeField(u'最后修改时间', auto_now=True)

    def __unicode__(self):
        return self.TestUserName

