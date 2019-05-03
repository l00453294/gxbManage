# coding=utf-8
from django.conf.urls import url
from automation import views

urlpatterns = [
    url(r'register/$', views.register, name='register'),
    url(r'^$', views.index, name='index'),
]
