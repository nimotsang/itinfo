# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class Area(models.Model):
    name = models.CharField(max_length=10, unique=True, verbose_name='区域名称')
    network = models.CharField(max_length=50, verbose_name='网段')
    description = models.TextField(max_length=255, blank=True, null=True, verbose_name='描述信息')

    class Meta:
        ordering = ["name"]
        verbose_name = '区域名称'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.name

    def __str__(self):
        return u'%s' % self.name


class DeviceType(models.Model):
    name = models.CharField(max_length=20, unique=True, verbose_name='设备类型')
    description = models.TextField(max_length=255, null=True, blank=True, verbose_name='描述')

    class Meta:
        ordering = ["name"]
        verbose_name = '设备类型'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.name

    def __str__(self):
        return u'%s' % self.name


class Device(models.Model):
    name = models.CharField(max_length=20, unique=True, verbose_name='设备名称')
    type = models.ForeignKey(DeviceType, verbose_name='设备类型')
    pos = models.CharField(max_length=20, verbose_name='机柜位置')
    sn = models.CharField(max_length=30, null=True, blank=True, verbose_name='设备序列号')
    factry = models.CharField(max_length=20, verbose_name='厂商')
    description = models.TextField(max_length=255, verbose_name='描述信息')

    class Meta:
        ordering = ["name"]
        verbose_name = '设备'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.name

    def __str__(self):
        return u'%s' % self.name


class WanIp(models.Model):
    w_ip = models.CharField(max_length=20,  unique=True, verbose_name='WAN_IP')
    description = models.TextField(max_length=255, blank=True, null=True, verbose_name='备注')

    class Meta:
        ordering = ["w_ip"]
        verbose_name = '公网地址管理'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.w_ip

    def __str__(self):
        return u'%s' % self.w_ip


class LanIp(models.Model):
    l_ip = models.CharField(max_length=20, verbose_name='LAN_IP')
    description = models.TextField(blank=True, verbose_name='详细信息')

    class Meta:
        ordering = ["l_ip"]
        verbose_name = '内网地址管理'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.l_ip

    def __str__(self):
        return u'%s' % self.l_ip


class Maps(models.Model):
    name = models.CharField(max_length=20, unique=True, verbose_name='映射名')
    w_ip = models.ForeignKey(WanIp, related_name='WanIp_Set', verbose_name='WAN_IP')
    w_port = models.IntegerField(verbose_name='WAN_PORT')
    l_ip = models.ForeignKey(LanIp, related_name='LanIp_Set', verbose_name='LAN_IP')
    l_port = models.IntegerField(verbose_name='LAN_PORT')
    description = models.TextField(verbose_name='功能描述')

    class Meta:
        ordering = ['w_ip', 'w_port', 'l_ip', 'l_port']
        verbose_name = '端口映射表'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.w_ip

    def __str__(self):
        return u'%s' % self.w_ip


class Agent(models.Model):
    name = models.CharField(max_length=20, verbose_name='名称')
    agent_ip = models.ForeignKey(LanIp, related_name='LanIp_Set_2', verbose_name='代理IP')
    agent_port = models.IntegerField(verbose_name='代理端口')
    app_ip = models.ForeignKey(LanIp, related_name='LanIp_Set_3', verbose_name='应用IP')
    app_port = models.IntegerField(verbose_name='应用端口')
    description = models.TextField(verbose_name='描述')

    class Meta:
        ordering = ['name', 'agent_ip', 'agent_port', 'app_ip']
        verbose_name = '应用代理表'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.w_ip

    def __str__(self):
        return u'%s' % self.w_ip







