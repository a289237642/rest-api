from django.shortcuts import render, redirect, reverse
from django.views import View
from .form import UserRegisterForm, UserLoginForm
from .models import UserProfile, Banner
from django.contrib.auth import authenticate, logout, login


# Create your views here.

class UserCenterView(View):
    """用户中心"""

    def get(self, request):
        return render(request, 'users/member.html')

    def post(self, request):
        pass


class UserLogoutView(View):
    """Logout"""

    def get(self, request):
        logout(request)
        return redirect(reverse("index"))


class UserLoginView(View):
    """Login in"""

    def get(self, request):
        user_login_form = UserLoginForm()
        return render(request, "users/login.html", {"user_login_form": user_login_form})

    def post(self, request):
        user_login_form = UserLoginForm(request.POST)
        if user_login_form.is_valid():
            username = user_login_form.cleaned_data["username"]
            password = user_login_form.cleaned_data["password"]

            a = authenticate(username=username, password=password)
            if a:
                login(request, a)
                return redirect(reverse("index"))
            else:
                return render(request, 'users/login.html', {'msg': '用户名或者密码有误'})
        else:
            return render(request, 'users/login.html', {'msg': user_login_form})


class IndexView(View):
    """HomePage"""

    def get(self, request):
        all_banner = Banner.objects.all()[:3]
        return render(request, 'index.html', {"all_banner": all_banner})


class UserRegisterView(View):
    """register"""

    def get(self, request):
        user_register_form = UserRegisterForm()
        return render(request, 'users/user_register.html', {'user_register_form': user_register_form})

    def post(self, request):
        user_register_form = UserRegisterForm(request.POST)
        if user_register_form.is_valid():
            username = user_register_form.cleaned_data["username"]
            password = user_register_form.cleaned_data["password"]

            email = user_register_form.cleaned_data["email"]
            user = UserProfile.objects.filter(username=username)
            if user:
                return render(request, 'users/user_register.html', {'msg': '用户已经存在'})
            else:
                a = UserProfile()
                a.username = username
                a.set_password(password)
                a.email = email
                a.save()
                return redirect(reverse('users:user_login'))
        else:
            return render(request, 'users/user_register.html', {'user_register_form': user_register_form})
