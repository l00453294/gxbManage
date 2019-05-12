# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User
from automation.models import Group as GroupModel
from django.contrib import admin
from django.contrib.auth import get_user_model
User = get_user_model()


# Create your views here.
def test(request):
    return render(request, 'automation/base.html')


def register(request):
    if request.method == 'POST':
        username = request.POST.get('UserName')
        password = request.POST.get('password')
        email = request.POST.get('email')
        user = User.objects.create_user(username=username, email=email, password=password, is_staff=True)
        user.groups = list(GroupModel.objects.filter(IsDefault=True))
        return redirect('/admin')
    else:
        return render(request, 'automation/login/register.html', {'login_title': admin.site.site_title})


def index(request):
    temp = 1
    return render(request, 'automation/index.html', {'login_user': request.user,
                                                     'username': request.GET.get('username'), 'temp': temp})
