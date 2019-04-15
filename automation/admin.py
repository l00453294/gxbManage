# -*- coding: utf-8 -*-

from django.contrib import admin
from .models import TestPartner, DeviceStandard, DeviceTemplate
# Register your models here.


@admin.register(DeviceStandard)
class DeviceStandardAdmin(admin.ModelAdmin):
    list_display = ('id', 'DevName', 'DevType', 'SimIntro', 'MAC', 'IPV4', 'IPV6', 'ThroughPut', 'Queue', 'LastEditTime')

    list_per_page = 10                                                      # 每页显示5条数据
    ordering = ['id']                                                       # 按照id排列，默认是升序
    list_filter = ('DevName', 'DevType')                                    # 过滤器
    date_hierarchy = 'CreateTime'

@admin.register(TestPartner)
class DeviceSpecAdmin(admin.ModelAdmin):
    list_display = ('id', 'TestOrganization', 'TestUserName', 'Tel', 'Email', 'SpecManager', 'CreateTime',
                    'LastEditTime')
    list_per_page = 10                                                   # 每页显示5条数据
    ordering = ['id']                                                    # 按照id排列，默认是升序
    list_filter = ('TestOrganization', 'TestUserName')                   # 过滤器
    search_fields = ('Tel', 'Email', 'TestUserName', 'TestOrganization') # 查询器
    date_hierarchy = 'CreateTime'


@admin.register(DeviceTemplate)
class DeviceTemplateAdmin(admin.ModelAdmin):
    list_display = ('TemVersion', 'TemType', 'TemPath', 'TemManager', 'CreateTime', 'LastEditTime')


admin.site.site_header = '工信部入网管理系统'
admin.site.site_title = '工信部入网'


