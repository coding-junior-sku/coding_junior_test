from django.urls import path
from . import views
#namespace
app_name='deeplearning_model'


urlpatterns = [
    path('', views.index,name='index'),

]