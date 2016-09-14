from django.shortcuts import render_to_response
from .models import Server, Business, App, Deploy


def server_list(request):
    server_lists = Server.objects.all()
    return render_to_response('appinfo/server_list.html', locals())


def business_list(request):
    business_lists = Business.objects.all()
    return render_to_response('appinfo/business_list.html', locals())


def app_list(request):
    app_lists = App.objects.all()
    return render_to_response('appinfo/app_list.html', locals())


def deploy_list(request):
    deploy_lists = Deploy.objects.all()
    return render_to_response('appinfo/deploy_list.html', locals())