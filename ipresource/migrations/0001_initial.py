# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-08-20 14:44
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Ipaddr',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ip', models.GenericIPAddressField(verbose_name='IP\u5730\u5740')),
                ('vlan', models.IntegerField(verbose_name='vlan\u53f7')),
                ('func', models.CharField(max_length=20, verbose_name='\u529f\u80fd\u63cf\u8ff0')),
                ('assign', models.PositiveIntegerField(verbose_name='\u662f\u5426\u5206\u914d')),
                ('comment', models.TextField(verbose_name='\u5907\u6ce8')),
            ],
        ),
        migrations.CreateModel(
            name='Pos',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20, verbose_name='\u4f4d\u7f6e')),
                ('comment', models.TextField(verbose_name='\u5907\u6ce8')),
            ],
        ),
        migrations.AddField(
            model_name='ipaddr',
            name='pos',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ipresource.Pos', verbose_name='\u4f4d\u7f6e'),
        ),
    ]