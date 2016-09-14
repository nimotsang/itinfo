from django.contrib import admin
from dbinfo.models import Dbserver, Users, Tablespace


@admin.register(Dbserver)
class DbserverAdmin(admin.ModelAdmin):
    search_fields = ['name', 'ip', 'Tablespace']

    list_display = ('name', 'ip', 'root_pass', 'oracle_pass', 'grid_pass', 'oracle_sys', 'comment')


@admin.register(Users)
class UsersAdmin(admin.ModelAdmin):
    search_fields = ['user', 'status']

    list_display = ['user','passwd', 'status', 'created', 'comment']


@admin.register(Tablespace)
class TablespaceAdmin(admin.ModelAdmin):
    search_fields = ['tb_name']
    list_display = ('tb_name', 'tb_desc', 'tb_size', 'scripts')
