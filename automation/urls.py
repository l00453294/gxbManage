# coding=utf-8
from django.conf.urls import include, url

urlpatterns = [
    url(r'^$', include('automation.views'), name='index'),
]
