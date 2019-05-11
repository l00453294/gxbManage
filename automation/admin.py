# -*- coding: utf-8 -*-

from django.contrib import admin
from django.contrib.auth.models import User
from automation.models import TestPartner, DeviceStandard, User
from django.contrib import messages
from django.utils.html import format_html
from django.contrib.auth.admin import UserAdmin
# Register your models here.


@admin.register(DeviceStandard)
class DeviceStandardAdmin(admin.ModelAdmin):
    list_display = ('id', 'DevName', 'DevType', 'SimIntro', 'MAC', 'IPV4', 'IPV6', 'ThroughPut', 'Queue', 'Manager',
                    'IsDelete')
    list_display_links = ('DevName',)
    exclude = ('Manager',)
    list_per_page = 10                                                      # 每页显示5条数据
    ordering = ['id']                                                       # 按照id排列，默认是升序
    list_filter = ('DevName', 'DevType', 'IsDelete')                        # 过滤器
    date_hierarchy = 'CreateTime'
    search_fields = ['IsDelete']
    actions = ['test_action', 'recycle_bin', 'undo_recycle_bin', ]

    def delete_model(self, request, obj):                               # 模型实例form页面实现逻辑删除
        super(DeviceStandardAdmin, self).delete_model(request, obj)

    def save_model(self, request, obj, form, change):
        if not change:                                                  # 如果在创建记录则自动填充，否则不自动填充
            obj.Manager = request.user
        obj.save()

    def get_queryset(self, request):                                    # 仅仅显示自己创建的device
        qs = super(DeviceStandardAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs
        user_id = User.objects.get(username=request.user)
        return qs.filter(Manager_id=user_id)

    # 实现了跳转功能
    def test_action(self, request, queryset):
        messages.add_message(request, messages.SUCCESS, format_html(
            "<a href='http://www.baidu.com' target='_blank'>{}</a>", 'good'))

    def recycle_bin(self, request, queryset):
        num = queryset.update(IsDelete=True)
        messages.add_message(request, messages.SUCCESS, str(num)+u"条记录操作成功")
    recycle_bin.short_description = u'移至回收站'

    def undo_recycle_bin(self, request, queryset):
        num = queryset.update(IsDelete=False)
        messages.add_message(request, messages.SUCCESS, str(num) + u"条记录操作成功")
    undo_recycle_bin.short_description = u'还原回收站'


@admin.register(TestPartner)
class TestPartnerAdmin(admin.ModelAdmin):
    pass


class UserAdmin(UserAdmin):
    list_display = ('username', 'email', 'NickName', )

    fieldsets = (
        (u'个人信息', {'fields': ('username', 'email')}),
        (u'个人昵称', {'fields': ('NickName', 'password')}),

    )


admin.site.register(User, UserAdmin)

admin.site.site_header = '工信部入网管理系统'
admin.site.site_title = '工信部入网'


