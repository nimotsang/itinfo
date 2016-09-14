# -*- coding: utf-8 -*-

from django.conf.urls import url
from updateOp import views

urlpatterns = [
    url(r'test', views.test, name='test'),
    url(r'issue_list', views.issue_list, name='issue_list'),
    url(r'addRecord', views.addRecord, name='addRecord'),
    url(r'index', views.index, name='index'),
    url(r'edit', views.addRecord, name='addRecord'),
    url(r'week_chart', views.week_chart, name='week_chart'),
]