from django.urls import path
from users.views import Login
from . import views

app_name = 'users'
urlpatterns = [
    path('login', views.Login.as_view(), name='login'),
]
