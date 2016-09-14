from django.shortcuts import render, render_to_response
from shortcut.models import Shortcut


def shortcut_list(requests):
    shortcut_lists = Shortcut.objects.all()
    return render_to_response('shortcut/shortcut_list.html', locals())
