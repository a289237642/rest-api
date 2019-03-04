from rest_framework.views import APIView
from rest_framework.response import Response
from .models import UserProfile
from rest_framework import viewsets
from .serializers import UserSerializer


# class Login(APIView):
#     def get(self, request, format=None):
#         user = UserProfile.objects.get(id=1)
#         # user = UserProfile.objects.all()
#         name = user.name
#         birthday = user.birthday
#         gender = user.gender
#         mobile = user.mobile
#         email = user.email
#         resp = {'name': name, 'birthday': birthday, 'gender': gender, 'mobile': mobile, 'email': email}
#         return Response(resp)

class UserViewSet(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = UserSerializer
