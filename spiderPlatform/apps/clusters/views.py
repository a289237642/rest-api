from rest_framework import viewsets
from .serializers import ClusterSerializer

from .models import Client


# Create your views here.
# 主机添加
class ClusterViewSet(viewsets.ModelViewSet):
    queryset = Client.objects.all()
    serializer_class = ClusterSerializer
