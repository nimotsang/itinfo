# -*- coding: utf-8 -*-

from django.conf.urls import url, include
from django.conf.urls.static import static
from django.conf import settings

from django.contrib import admin
from cnepay_project.views import index, login, auth_logout

urlpatterns = [
    url(r'^grappelli/', include('grappelli.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^updateOp/', include('updateOp.urls')),
    url(r'^portmap/', include('portmap.urls')),
    url(r'^appinfo/', include('appinfo.urls')),
    url(r'^ipresource/', include('ipresource.urls')),
    url(r'^dbinfo/', include('dbinfo.urls')),
    url(r'^addressbook/', include('addressbook.urls')),
    url(r'^shortcut/', include('shortcut.urls')),
    url(r'^$', index, name='index'),
    url(r'^index/', index, name='index'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'login', login, name='login'),
    url(r'auth_logout', auth_logout, name='auth_logout'),
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
# urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
