from django.urls import path
from . import views

urlpatterns = [
    path('Survey/', views.survey_show, name='survey_show'),
    path('Survey/output/', views.survey_output, name='survey_output'),  # URL for the output page
]
