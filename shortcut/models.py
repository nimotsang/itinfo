# -*- coding:utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class Shortcut(models.Model):
    name = models.CharField(max_length=50, verbose_name='名称')
    website = models.CharField(max_length=150, verbose_name='链接地址')
    comment = models.TextField(null=True, blank=True, verbose_name='备注')

    class Meta:
        ordering = ["name"]
        verbose_name = '快捷链接'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.name

    def __str__(self):
        return u'%s' % self.name
