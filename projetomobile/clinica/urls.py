from django.urls import path

from . import views

urlpatterns = [
   # path('', views.index, name='index')
    # ex: /polls/
    path('', views.index, name='index'),
    path('login', views.login, name='login'),
    #path('paciente', views.paciente, name='paciente'),
    path('mensagemSaveEdit',views.mensagemSaveEdit, name='mensagemSaveEdit'),
    path('medicoSaveEdit',views.medicoSaveEdit, name='medicoSaveEdit'),
    path('laudoSaveEdit',views.laudoSaveEdit, name='laudoSaveEdit'),
    path('enderecoSaveEdit',views.enderecoSaveEdit, name='enderecoSaveEdit'),
    path('conversaSaveEdit',views.conversaSaveEdit, name='conversaSaveEdit'),
    path('contatoSaveEdit',views.contatoSaveEdit, name='contatoSaveEdit'),
    path('consultaSaveEdit',views.consultaSaveEdit, name='consultaSaveEdit')
]