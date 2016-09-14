# -*- coding: utf-8 -*-
from django.contrib import admin
from updateOp.models import Dept, Persons, Issue, Prod


@admin.register(Dept)
class DeptAdmin(admin.ModelAdmin):
    list_display = ('id', 'dept_name', 'remark',)


@admin.register(Persons)
class PersonsAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'dept', 'mobile', 'email', 'isvalid')


@admin.register(Issue)
class IssueAdmin(admin.ModelAdmin):

    # 搜索框
    search_fields = ['name', ]

    #
    def get_state(self, obj):
        if obj.issue_type == 1:
            return "<span style=\"color:green;font-weight:bold\">%s</span>" % "普通"
        else:
            return "<span style=\"color:red;font-weight:bold\">%s</span>" % "紧急"

    get_state.short_description = "类型"
    get_state.allow_tags = True

    # 编辑页显示项目
    fields = ('name', 'prod', 'content', 'issue_type', ('req_from', 'report_to'), 'op_time', 'operator', )

    # 列表显示项
    list_display = ('name', 'prod_list', 'content', 'get_state', 'req_from', 'report_to', 'operator_list', 'op_time', 'rec_user', 'rec_time')

    # 外键显示为ID
    # raw_id_fields = ('prod', 'req_from', 'report_to', 'operator', )

    # 倒序排列
    ordering = ['-name']

    # 自动保存录入人员
    def save_model(self, request, obj, form, change):
        obj.rec_user = request.session.get('username')
        obj.save()


@admin.register(Prod)
class ProdAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'remark')



