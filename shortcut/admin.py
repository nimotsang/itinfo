from django.contrib import admin
from shortcut.models import Shortcut


@admin.register(Shortcut)
class ShortcutAdmin(admin.ModelAdmin):
    search_fields = ['name', ]
    list_display = ['name', 'website', 'comment']
