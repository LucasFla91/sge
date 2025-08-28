from django.contrib import admin
from . import models


class SupplierAdmin(admin.ModelAdmin):
    list_display = ('name', 'description',)
    search_fields = ('description',)


admin.site.register(models.Supplier, SupplierAdmin)
