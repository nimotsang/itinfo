# -*- coding: utf-8 -*-
import xlrd
import sys
reload(sys)
sys.setdefaultencoding("utf-8")
from django.shortcuts import render_to_response
from django.contrib import auth
from .models import Issue, Persons, Prod
from django.http.response import HttpResponseRedirect
import datetime
from django.utils.timezone import now, timedelta
# from django.db.models import Count


def login(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        password = request.POST.get('password')
        print(password)
        user = auth.authenticate(username=name, password=password)
        print(user)
        if user is not None and user.is_active:
            auth.login(request, user)
            request.session['username'] = name
            return HttpResponseRedirect('/updateOp/index')
        else:
            return render_to_response("ok.html", {'result': '用户名或密码错误!'})
    return render_to_response('login.html')


def auth_logout(request):
    auth.logout(request)
    return HttpResponseRedirect('/updateOp/login')


def index(request):
    username = request.session.get('username')
    if username is None:
        return HttpResponseRedirect('/updateOp/login')

    return render_to_response('index.html', locals())


# {y: '2006',a: 100,b: 90},
def week_chart(request):

    # 获取当前时间是星期几
    date = now().strftime("%w")
    # 按照数字获取星期一的天数
    if int(date) == 0:
        begin_days = 0
        end_days = 6
    elif int(date) == 1:
        begin_days = -1
        end_days = 5
    elif int(date) == 2:
        begin_days = -2
        end_days = 4
    elif int(date) == 3:
        begin_days = -3
        end_days = 3
    elif int(date) == 4:
        begin_days = -4
        end_days = 2
    elif int(date) == 5:
        begin_days = -5
        end_days = 1
    elif int(date) == 6:
        begin_days = -6
        end_days = 0

    # 取得本周开始和结束时间
    begin = now().date() + timedelta(days=begin_days)
    end = now().date() + timedelta(days=end_days)
    month = now().date().month
    view = request.GET.get('view')

    if view == "last_week":
        begin = now().date() + timedelta(days=begin_days-7)
        end = now().date() + timedelta(days=end_days-7)
        results = Issue.objects.filter(op_time__range=(begin, end))
    elif view == 'month':
        results = Issue.objects.filter(op_time__month=month)
    else:
        results = Issue.objects.filter(op_time__range=(begin, end))

    # 获取图表所需数据
    # 按发起人部门统计
    res_1 = Issue.objects.raw("select a.id,count(dept_name) dept_count,a.rec_user,c.dept_name from updateop_issue a,updateop_persons b,updateop_dept c where a.req_from_id=b.id and b.dept_id=c.id group by dept_name")
    res_issue_type = Issue.objects.raw("select id,issue_type,count(issue_type) as dcount from updateop_issue group by issue_type")

    # 将数据组装到js文件,发起部门统计图表
    f = open('/static/js/morris-data.js', mode='w')
    f.write('$(function() {Morris.Bar({element: \'morris-bar-chart\',data: [')
    for r in res_1:
        f.write('{y: \''+str(r.dept_name)+'\',a: \''+bytes(r.dept_count)+'\',},')

    f.write('],xkey: \'y\',ykeys: [\'a\',],labels: [\'次数\',],'
            'hideHover: \'auto\',resize: true});')

    # 发布类型统计图表
    f.write('Morris.Bar({element: \'morris-bar-chart-1\',data: [')
    for r in res_issue_type:
        if r.issue_type:
            r.issue_type="普通上线"
        else:
            r.issue_type="紧急上线"
        f.write('{y: \''+str(r.issue_type)+'\',a: \''+bytes(r.dcount)+'\',},')
    f.write('],xkey: \'y\',ykeys: [\'a\',],labels: [\'次数\',],'
            'hideHover: \'auto\',resize: true});});')

    f.close()

    return render_to_response('chat.html', locals())


def test(request):
    try:
        data = xlrd.open_workbook('test.xls')
        # print(data)
    except Exception, e:
        print str(e)

    table = data.sheets()[0]

    nrows = table.nrows  # 行数
    # ncols = table.ncols  # 列数

    print(table.row_values(0))
    if not nrows:
        pass
    else:
        for rownum in range(1, nrows):
            row = table.row_values(rownum)
            if row:
                rows = {}
                for i in range(len(row)):
                    rows[rownum][i] = row[i]
    print(rows)

    return render_to_response("test.html", {})


def issue_list(request):
    username = request.session.get('username')
    if username is None:
        return HttpResponseRedirect('/updateOp/login')
    content_list = Issue.objects.all()
    return render_to_response("issue_list.html", locals())


def addRecord(request):
    # 判断是否登录
    username = request.session.get('username')
    if username is None:
        return HttpResponseRedirect('/updateOp/login')

    operators = Persons.objects.all().filter(dept_id=1)
    products = Prod.objects.all()

    # 判断action是否为edit
    editId = request.GET.get('action')
    if not editId:
        if 'ok' in request.POST:
            # print "has submit"
            name = request.POST.get('name')
            prod = request.POST.getlist('prod')    # 复选框需要使用getlist
            content = request.POST.get('content')
            issue_type = request.POST.get('issue_type')
            req_from = request.POST.get('req_from')
            report_to = request.POST.get('report_to')
            operator = request.POST.getlist('operator')
            op_time = request.POST.get('op_time')
            rec_user = username
            if not op_time:
                op_time= ''
            else:
                # 将字符串转换成日期格式
                op_time = datetime.datetime.strptime(op_time, '%Y-%m-%d')

            # 判断列表是否为空，不为空且大于1，将元组转换为字符串，以逗号分割
            if prod:
                if len(prod) > 1:
                    prod = ','.join(prod)
                else:
                    prod = prod[0]
            else:
                prod = ''

            if operator:
                if len(operator) > 1:
                    operator = ','.join(operator)
                else:
                    operator = operator[0]
            else:
                operator = ''

            if name and prod:
                result = Issue(name=name, prod=prod, content=content, issue_type=issue_type, req_from=req_from, report_to=report_to, operator=operator)
                result.save()

            return HttpResponseRedirect('/updateOp/lists')
    else:
        print "edit"
        issue_name = request.GET.get('issue_name')
        record = Issue.objects.filter(name=int(issue_name)).values()
        # print record
        # print record[0]['name']
        name = record[0]['name']
        prod = record[0]['prod']
        content = record[0]['content']
        issue_type = record[0]['issue_type']
        req_from = record[0]['req_from']
        report_to = record[0]['report_to']
        operator = record[0]['operator']

        # update
        if issue_name and prod:
                Issue.objects.filter(issue_name=issue_name).update(prod=prod,content=content, issue_type=issue_type, req_from=req_from,report_to=report_to, operator=operator)

    return render_to_response('add.html', locals())
