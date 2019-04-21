# coding=utf-8
from django.conf.urls import url, include
from automation import views

urlpatterns = [
    url(r'^$', include('automation.views'), name='index'),
]