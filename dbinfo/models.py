# -*- coding:utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class Users(models.Model):
    user = models.CharField(max_length=20, verbose_name='用户名')
    passwd = models.CharField(max_length=20, verbose_name='密码')
    status = models.CharField(max_length=20, verbose_name='状态')
    created = models.DateField(verbose_name='创建时间')
    comment = models.TextField(verbose_name='备注')

    class Meta:
        ordering = ["user"]
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.user

    def __str__(self):
        return u'%s' % self.user


class Tablespace(models.Model):
    tb_name = models.CharField(max_length=30, verbose_name='表空间名称')
    tb_desc = models.CharField(max_length=30, verbose_name='表空间描述')
    tb_size = models.CharField(max_length=20, verbose_name='表空间大小')
    scripts = models.TextField(verbose_name='建表语句')
    users = models.ManyToManyField(Users,verbose_name='用户')

    class Meta:
        ordering = ["tb_name"]
        verbose_name = '表空间信息'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.tb_name

    def __str__(self):
        return u'%s' % self.tb_name


class Dbserver(models.Model):
    name = models.CharField(max_length=30, verbose_name='服务器')
    ip = models.CharField(max_length=30, verbose_name='服务器IP')
    pos = models.CharField(max_length=30, verbose_name='服务器位置')
    Tablespace = models.ManyToManyField(Tablespace, verbose_name='表空间')
    root_pass = models.CharField(max_length=20, verbose_name='ROOT密码')
    oracle_pass = models.CharField(max_length=20, verbose_name='ORACLE密码')
    grid_pass = models.CharField(max_length=20, verbose_name='GRID密码')
    oracle_sys = models.CharField(max_length=20, verbose_name='SYS密码')
    comment = models.TextField(verbose_name='备注')

    class Meta:
        ordering = ["name"]
        verbose_name = '服务器信息'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.name

    def __str__(self):
        return u'%s' % self.name
