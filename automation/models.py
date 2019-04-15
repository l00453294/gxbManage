# -*- coding: utf-8 -*-
from django.utils import timezone
from django.db import models

# Create your models here.


class DeviceStandard(models.Model):                                                           # 设备参数表
    class Meta:                                                                               # 起别名：规格参数表
        verbose_name_plural = u'设备规格参数'
        verbose_name = u'《设备规格》'

    DevName = models.CharField(verbose_name=u'设备名称', max_length=20)
    DevType = models.CharField(verbose_name=u'设备类型', max_length=20, default=u'以太交换机')
    SimIntro = models.TextField(u"设备的接口和电源简单介绍", null=False)
    MAC = models.CharField(max_length=20, null=True)
    IPV4 = models.CharField(max_length=20, null=True, blank=True)
    IPV6 = models.CharField(max_length=20, null=True, blank=True)
    ThroughPut = models.CharField(max_length=20, null=True)
    PacketForwarding = models.CharField(max_length=20, null=True)
    Queue = models.IntegerField()
    IsDelete = models.BooleanField(default=False)           # 默认不删除
    CreateTime = models.DateTimeField(u'创建时间', default=timezone.now)
    LastEditTime = models.DateTimeField(u'最后修改时间', auto_now=True)

    def __unicode__(self):
        return "deviceName:"+self.DevName


class DeviceTemplate(models.Model):                                                            # 入网模板表
    class Meta:                                                                                # 起别名：入网模板表
        verbose_name_plural = u'入网设备模板'
        verbose_name = u'《入网模板》'
    TemVersion = models.IntegerField(verbose_name=u'版本', default=2)                          # 模板版本，默认选择第二种
    TemType = models.CharField(verbose_name=u'类型', max_length=20, default=u'以太交换机')     # 默认是以太交换机
    TemPath = models.CharField(verbose_name=u'模板路径', max_length=20, null=True)             # 允许为null
    TemManager = models.CharField(verbose_name=u'管理员', max_length=20, default=" ")          # 管理员创建规格信息模板
    IsDelete = models.BooleanField(default=False)                                              # 默认不删除
    CreateTime = models.DateTimeField(u'创建时间', default=timezone.now)
    LastEditTime = models.DateTimeField(u'最后修改时间', auto_now=True)

    def __unicode__(self):
        return "deviceName:"+self.TemManager


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
        return "TestPartner:"+str(self.Tel)


class DeviceSpec(models.Model):
    class Meta:                                                                               # 起别名：设备规格参数
        verbose_name_plural = u'设备规格参数'
        verbose_name = u'《规格参数》'
    SpecPath = models.CharField(u'规格参数模板路径', max_length=30)
    IsDelete = models.BooleanField(default=False)                                             # 默认不删除
    CreateTime = models.DateTimeField(u'创建时间', default=timezone.now)
    LastEditTime = models.DateTimeField(u'最后修改时间', auto_now=True)

    def __unicode__(self):
        return "TestPartner:"+str(self.Tel)