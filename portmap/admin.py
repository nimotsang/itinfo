# -*- coding: utf-8 -*-
from django.contrib import admin
from portmap.models import WanIp, LanIp, Maps, Agent


@admin.register(WanIp)
class WanIpAdmin(admin.ModelAdmin):
    list_display = ('id', 'w_ip','description' )


@admin.register(LanIp)
class LanIpAdmin(admin.ModelAdmin):
    list_display = ('id', 'l_ip','description')


@admin.register(Maps)
class MapsAdmin(admin.ModelAdmin):
    list_display = ('id', 'w_ip', 'w_port', 'l_ip', 'l_port', 'description')


@admin.register(Agent)
class AgentAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'agent_ip', 'agent_port', 'app_ip', 'app_port', 'description')
