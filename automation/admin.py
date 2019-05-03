# -*- coding: utf-8 -*-

from django.contrib import admin
from django.contrib.auth.models import Group
from django.contrib.auth.models import User
from automation.models import TestPartner, DeviceStandard
from django.http import HttpResponse
from django.contrib import messages
from django.utils.html import format_html
import time
# Register your models here.


@admin.register(DeviceStandard)
class DeviceStandardAdmin(admin.ModelAdmin):
    list_display = ('id', 'DevName', 'DevType', 'SimIntro', 'MAC', 'IPV4', 'IPV6', 'ThroughPut', 'Queue', 'Manager',
                    'IsDelete')
    exclude = ('Manager',)
    list_per_page = 10                                                      # 每页显示5条数据
    ordering = ['id']                                                       # 按照id排列，默认是升序
    list_filter = ('DevName', 'DevType', 'IsDelete')                        # 过滤器
    date_hierarchy = 'CreateTime'
    search_fields = ['IsDelete']
    actions = ['test']

    def save_model(self, request, obj, form, change):

        if not change:                                  # 如果在创建记录则自动填充，否则不自动填充
            obj.Manager = request.user
        obj.save()

    def get_queryset(self, request):                                    # 仅仅显示自己创建的device
        qs = super(DeviceStandardAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs
        user_id = User.objects.get(username=request.user)
        return qs.filter(Manager_id=user_id)

    # 实现了跳转功能
    def test(self, request, queryset):
        # time.sleep(30)
        self.message_user(request, format_html("<a href='http://www.baidu.com' target='_blank'>{}</a>", 'good'))


@admin.register(TestPartner)
class TestPartnerAdmin(admin.ModelAdmin):
    pass


admin.site.site_header = '工信部入网管理系统'
admin.site.site_title = '工信部入网'


