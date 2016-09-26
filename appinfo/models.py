# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class Server(models.Model):
    name = models.CharField(max_length=20, unique=True, verbose_name=u'服务器名称')
    ip = models.CharField(max_length=20, blank=True, null=True, verbose_name='服务器IP')
    zone = models.CharField(max_length=20, blank=True, null=True, verbose_name='网络区域')
    sn = models.CharField(max_length=255, blank=True, null=True, verbose_name='编号')
    manufacturer = models.CharField(max_length=25, blank=True, null=True, verbose_name='品牌')
    mod = models.CharField(max_length=255, blank=True, null=True, verbose_name='型号')
    type = models.CharField(max_length=20, blank=True, null=True, verbose_name='机器类型')
    cpu_freq = models.CharField(max_length=255, blank=True, null=True, verbose_name='CPU')
    cpu_core = models.IntegerField(blank=True, null=True, verbose_name='核数')
    mem = models.CharField(max_length=255, blank=True, null=True, verbose_name='内存大小')
    disk = models.CharField(max_length=255, blank=True, null=True, verbose_name='硬盘大小')
    raid = models.CharField(max_length=20, blank=True, null=True, verbose_name='RAID')
    size = models.CharField(max_length=255, blank=True, null=True, verbose_name='服务器尺寸')
    buy_date = models.DateField(blank=True, null=True, verbose_name='购买时间')
    contact = models.CharField(max_length=25, blank=True, null=True, verbose_name='联系人')
    factory_phone = models.CharField(max_length=25, blank=True, null=True, verbose_name='联系电话')
    guaranteed = models.BooleanField( verbose_name='是否在保')
    cabinet = models.CharField(max_length=20, blank=True, null=True, verbose_name='机柜号')
    idc = models.CharField(max_length=20, blank=True, null=True, verbose_name='机房')
    comment = models.TextField(blank=True, null=True, verbose_name='备注')

    class Meta:
        ordering = ["ip"]
        verbose_name = '服务器信息'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.ip

    def __str__(self):
        return u'%s' % self.ip


class App(models.Model):
    name = models.CharField(max_length=20, unique=True, verbose_name='应用名称')
    language = models.CharField(max_length=20, blank=True, null=True, verbose_name='开发语言')
    env = models.CharField(max_length=255, blank=True, null=True, verbose_name='开发环境')
    plugs = models.CharField(max_length=255, blank=True, null=True, verbose_name='框架')
    requires = models.CharField(max_length=255, blank=True, null=True, verbose_name='依赖')
    config_file = models.CharField(max_length=255, blank=True, null=True, verbose_name='配置文件')
    function = models.CharField(max_length=255, blank=True, null=True, verbose_name='功能')
    teams = models.CharField(max_length=255, blank=True, null=True, verbose_name='开发团队')
    dev_time = models.DateField(blank=True, null=True, verbose_name='开发时间')
    version = models.CharField(max_length=255, blank=True, null=True, verbose_name='版本号')
    contact = models.CharField(max_length=255, blank=True, null=True, verbose_name='联系人')
    comment = models.TextField(blank=True, null=True, verbose_name='备注')

    class Meta:
        ordering = ["name"]
        verbose_name = '应用信息'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.name

    def __str__(self):
        return u'%s' % self.name


class Deploy(models.Model):
    name = models.CharField(max_length=20, unique=True, verbose_name='部署名称')
    server = models.ForeignKey(Server, verbose_name='部署服务器')
    app = models.ForeignKey(App, verbose_name='应用名称')
    paths = models.CharField(max_length=255, blank=True, null=True,  verbose_name='部署路径')
    users = models.CharField(max_length=255, blank=True, null=True,  verbose_name='系统用户')
    boot_scripts = models.CharField(max_length=255, blank=True, null=True, verbose_name='启动脚本')
    ports = models.IntegerField(blank=True, null=True, verbose_name='端口号')
    logs = models.CharField(max_length=255, blank=True, null=True, verbose_name='日志路径')
    documents = models.FileField(upload_to='./deploy', null=True, blank=True, verbose_name='部署文档')
    author = models.CharField(max_length=255, blank=True, null=True, verbose_name='部署人')
    times = models.DateField(blank=True, null=True, verbose_name='部署时间')

    class Meta:
        ordering = ["name"]
        verbose_name = '部署信息'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.name

    def __str__(self):
        return u'%s' % self.name


class Business(models.Model):
    name = models.CharField(max_length=20, unique=True, verbose_name='业务名称')
    documents = models.TextField(null=True, blank=True, verbose_name='业务说明文档')
    contacts = models.CharField(max_length=255, blank=True, null=True, verbose_name='业务联系人')
    comments = models.TextField(blank=True, null=True, verbose_name='业务简介')
    online = models.DateField(blank=True, null=True, verbose_name='上线时间')
    architecture = models.ImageField(upload_to='./deploy', null=True, blank=True, verbose_name='系统架构图')
    deploys = models.ManyToManyField(Deploy, verbose_name='部署')

    # 显示ManyToMany域
    def deploy_list(self):
        return ','.join([a.name for a in self.deploys.all()])

    deploy_list.short_description = '系统列表'

    class Meta:
        ordering = ["name"]
        verbose_name = '业务信息'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.name

    def __str__(self):
        return u'%s' % self.name
