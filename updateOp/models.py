# -*- coding: utf-8 -*-
from django.db import models


# Create your models here.
class Dept(models.Model):
    dept_name = models.CharField(max_length=50, verbose_name='部门')
    remark = models.TextField(blank=True, verbose_name='部门描述')

    class Meta:
        verbose_name = '部门'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.dept_name

    def __str__(self):
        return u'%s' % self.dept_name


class Persons(models.Model):
    name = models.CharField(max_length=10, verbose_name='姓名')
    dept = models.ForeignKey(Dept, verbose_name='部门')
    mobile = models.CharField(max_length=40, verbose_name='手机')
    email = models.EmailField(verbose_name='邮箱')
    isvalid = models.BooleanField(verbose_name='是否在职', default=True)
    remark = models.TextField(blank=True, verbose_name='备注')

    class Meta:
        verbose_name = '员工信息'
        verbose_name_plural = '员工信息'

    def __unicode__(self):
        return u'%s' % self.name

    def __str__(self):
        return u'%s' % self.name


class Prod(models.Model):
    name = models.CharField(max_length=10, verbose_name='产品名称')
    remark = models.TextField(blank=True, verbose_name='产品说明')

    class Meta:
        verbose_name = '产品信息'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.name

    def __str__(self):
        return u'%s' % self.name


class Issue(models.Model):
    name = models.IntegerField(unique=True, null=True, blank=True, verbose_name='版本号')
    prod = models.ManyToManyField('Prod', verbose_name='产品')
    content = models.TextField(null=True, blank=True, verbose_name='更新说明')
    issue_type = models.BooleanField(default=True, verbose_name='普通上线')
    req_from = models.ForeignKey(Persons, related_name='req_from_person', verbose_name='需求提出者')
    report_to = models.ForeignKey(Persons, related_name='report_to_person', verbose_name='汇报人')
    operator = models.ManyToManyField(Persons, related_name='operator_person', verbose_name='操作员')
    op_time = models.DateField(null=True, blank=True, verbose_name='操作日期')
    rec_user = models.CharField(max_length=10, null=True, blank=True, verbose_name='录入人员')
    rec_time = models.DateTimeField(auto_now=True, verbose_name='录入时间')

    # 显示ManyToMany域
    def prod_list(self):
        return ','.join([a.name for a in self.prod.all()])

    def operator_list(self):
        return ','.join([b.name for b in self.operator.all()])

    prod_list.short_description = "产品"
    operator_list.short_description = "操作员"

    class Meta:
        ordering = ["-name"]
        verbose_name = '系统更新操作记录'
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return u'%s' % self.name

    def __str__(self):
        return u'%s' % self.name


