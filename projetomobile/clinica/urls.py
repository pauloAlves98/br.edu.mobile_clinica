from django.urls import path

from . import views

urlpatterns = [
   # path('', views.index, name='index')
    # ex: /polls/
    path('', views.index, name='index'),
    path('login', views.login, name='login'),
    path('loginMedico', views.loginMedico, name='loginMedico'),
    path('pacienteSaveEdit', views.pacienteSaveEdit, name='pacienteSaveEdit'),
    path('mensagemSaveEdit',views.mensagemSaveEdit, name='mensagemSaveEdit'),
    path('medicoSaveEdit',views.medicoSaveEdit, name='medicoSaveEdit'),
    path('laudoSaveEdit',views.laudoSaveEdit, name='laudoSaveEdit'),
    path('enderecoSaveEdit',views.enderecoSaveEdit, name='enderecoSaveEdit'),
    path('conversaSaveEdit',views.conversaSaveEdit, name='conversaSaveEdit'),
    path('contatoSaveEdit',views.contatoSaveEdit, name='contatoSaveEdit'),
    path('consultaSaveEdit',views.consultaSaveEdit, name='consultaSaveEdit'),
    path('consultaSearch',views.consultaSearch, name='consultaSearch'),
    path('laudoSearch',views.laudoSearch,name='laudoSearch'),
    path('medicoSearch',views.madicoSearch,name='medicoSearch'),
    path('laudoSearchDataNome',views.laudoSearchDataNome,name='laudoSearchDataNome'),
    path('consultaLaudoAll',views.consultaLaudoAll, name='consultaLaudoAll'),
     path('consultaLaudoFiltro',views.consultaLaudoFiltro, name='consultaLaudoFiltro')
]