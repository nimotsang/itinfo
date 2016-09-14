# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


# portmap
class PortmapWanIp(models.Model):
    w_ip = models.CharField(max_length=20, verbose_name='WAN')
    firewall = models.CharField(max_length=255, blank=True, verbose_name='防火墙名称')
    f_location = models.CharField(max_length=255, blank=True, verbose_name='防火墙位置')
    comment = models.TextField(max_length=255, blank=True, verbose_name='备注')

    class Meta:
        ordering = ["w_ip"]
        verbose_name = '公网IP'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.w_ip

    def __str__(self):
        return u'%s' % self.w_ip


class PortmapLanIp(models.Model):
    l_ip = models.CharField(max_length=20, verbose_name='LAN')
    l_name = models.CharField(max_length=255, blank=True, verbose_name='服务器名称')
    detail = models.TextField(blank=True, verbose_name='详细信息')
    comment = models.TextField(blank=True, verbose_name='备注')

    class Meta:
        ordering = ["l_ip"]
        verbose_name = '内网IP'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.l_ip

    def __str__(self):
        return u'%s' % self.l_ip


class PortmapMaps(models.Model):
    w_ip = models.ForeignKey(PortmapWanIp, related_name='PortmapWanIp', verbose_name='外网IP')
    w_port = models.IntegerField(verbose_name='外网端口')
    l_ip = models.ForeignKey(PortmapLanIp, related_name='PortmapLanIp', verbose_name='内网IP')
    l_port = models.IntegerField(verbose_name='内网端口')
    comment = models.TextField(verbose_name='功能描述')

    class Meta:
        ordering = ['w_ip', 'w_port', 'l_ip', 'l_port']
        verbose_name = '端口映射表'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.w_ip

    def __str__(self):
        return u'%s' % self.w_ip

