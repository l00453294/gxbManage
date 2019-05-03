# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render

from django.http import HttpResponse

from django.contrib.auth.models import User

# Create your views here.


def register(request):
    # user = User.objects.create_user(username='test7', email='qq@qq.com', password='huawei@123', is_staff=True)
    # print user.email
    return HttpResponse('success')


def index(request):
    return render(request, 'automation/index.html', {'login_user': request.user,
                                                     'username': request.GET.get('username')})
