from django.shortcuts import render, render_to_response
from portmap.models import WanIp, LanIp, Maps


def lan_list(requests):
    lan_lists = LanIp.objects.all()
    return render_to_response('portmap/lan_list.html', locals())


def wan_list(requests):
    wan_lists = WanIp.objects.all()
    return render_to_response('portmap/wan_list.html', locals())


def map_list(requests):
    map_lists = Maps.objects.all()
    return render_to_response('portmap/map_list.html', locals())
