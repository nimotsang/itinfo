# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2016-08-26 22:35
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Dbserver',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30, verbose_name='\u670d\u52a1\u5668')),
                ('ip', models.CharField(max_length=30, verbose_name='\u670d\u52a1\u5668IP')),
                ('root_pass', models.CharField(max_length=20, verbose_name='ROOT\u5bc6\u7801')),
                ('oracle_pass', models.CharField(max_length=20, verbose_name='ORACLE\u5bc6\u7801')),
                ('grid_pass', models.CharField(max_length=20, verbose_name='GRID\u5bc6\u7801')),
                ('oracle_sys', models.CharField(max_length=20, verbose_name='SYS\u5bc6\u7801')),
                ('comment', models.TextField(verbose_name='\u5907\u6ce8')),
            ],
            options={
                'ordering': ['name'],
                'verbose_name': '\u670d\u52a1\u5668\u4fe1\u606f',
                'verbose_name_plural': '\u670d\u52a1\u5668\u4fe1\u606f',
            },
        ),
        migrations.CreateModel(
            name='Tablespace',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tb_name', models.CharField(max_length=30, verbose_name='\u8868\u7a7a\u95f4\u540d\u79f0')),
                ('tb_desc', models.CharField(max_length=30, verbose_name='\u8868\u7a7a\u95f4\u63cf\u8ff0')),
                ('tb_size', models.CharField(max_length=20, verbose_name='\u8868\u7a7a\u95f4\u5927\u5c0f')),
                ('scripts', models.TextField(verbose_name='\u5efa\u8868\u8bed\u53e5')),
            ],
            options={
                'ordering': ['tb_name'],
                'verbose_name': '\u8868\u7a7a\u95f4\u4fe1\u606f',
                'verbose_name_plural': '\u8868\u7a7a\u95f4\u4fe1\u606f',
            },
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user', models.CharField(max_length=20, verbose_name='\u7528\u6237\u540d')),
                ('passwd', models.CharField(max_length=20, verbose_name='\u5bc6\u7801')),
                ('status', models.CharField(max_length=20, verbose_name='\u72b6\u6001')),
                ('created', models.DateField(verbose_name='\u521b\u5efa\u65f6\u95f4')),
                ('comment', models.TextField(verbose_name='\u5907\u6ce8')),
            ],
            options={
                'ordering': ['user'],
                'verbose_name': '\u7528\u6237\u4fe1\u606f',
                'verbose_name_plural': '\u7528\u6237\u4fe1\u606f',
            },
        ),
        migrations.AddField(
            model_name='tablespace',
            name='users',
            field=models.ManyToManyField(to='dbinfo.Users', verbose_name='\u7528\u6237'),
        ),
        migrations.AddField(
            model_name='dbserver',
            name='Tablespace',
            field=models.ManyToManyField(to='dbinfo.Tablespace', verbose_name='\u8868\u7a7a\u95f4'),
        ),
    ]
