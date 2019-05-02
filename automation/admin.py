# -*- coding: utf-8 -*-

from django.contrib import admin
from .models import TestPartner, DeviceStandard
# Register your models here.


@admin.register(DeviceStandard)
class DeviceStandardAdmin(admin.ModelAdmin):
    list_display = ('id', 'DevName', 'DevType', 'SimIntro', 'MAC', 'IPV4', 'IPV6', 'ThroughPut', 'Queue', 'Manager')
    exclude = ('Manager',)
    list_per_page = 10                                                      # 每页显示5条数据
    ordering = ['id']                                                       # 按照id排列，默认是升序
    list_filter = ('DevName', 'DevType')                                    # 过滤器
    date_hierarchy = 'CreateTime'

    def save_model(self, request, obj, form, change):
        if not change:                                  # 如果在创建记录则自动填充，否则不自动填充
            obj.Manager = request.user
        obj.save()


@admin.register(TestPartner)
class TestPartnerAdmin(admin.ModelAdmin):
    pass


admin.site.site_header = '工信部入网管理系统'
admin.site.site_title = '工信部入网'


