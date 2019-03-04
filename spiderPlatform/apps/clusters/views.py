from rest_framework import viewsets
from .serializers import ClusterSerializer

from .models import Client


# Create your views here.
class ClusterViewSet(viewsets.ModelViewSet):
    queryset = Client.objects.all()
    serializer_class = ClusterSerializer
