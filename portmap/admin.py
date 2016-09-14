# -*- coding: utf-8 -*-
from django.contrib import admin
from portmap.models import PortmapWanIp, PortmapLanIp, PortmapMaps


@admin.register(PortmapWanIp)
class PortmapWanIpAdmin(admin.ModelAdmin):
    list_display = ('id', 'w_ip', 'firewall', 'f_location', 'comment')


@admin.register(PortmapLanIp)
class PortmapWanIpAdmin(admin.ModelAdmin):
    list_display = ('id', 'l_ip', 'l_name', 'detail', 'comment')


@admin.register(PortmapMaps)
class PortmapWanIpAdmin(admin.ModelAdmin):

    def w_any(self, obj):
        if obj.w_port == 0:
            return "%s" % "any"
        else:
            return obj.w_port
    w_any.short_description = '外部端口'

    def l_any(self, obj):
        if obj.l_port == 0:
            return "%s" % "any"
        else:
            return obj.l_port

    l_any.short_description = '内部端口'

    list_display = ('id', 'w_ip', 'w_any', 'l_ip', 'l_any', 'comment')