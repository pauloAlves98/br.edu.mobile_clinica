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
    path('consultaConsultaAll',views.consultaConsultaAll, name='consultaConsultaAll'),
    path('consultaConsultaFiltro',views.consultaConsultaFiltro,name='consultaConsultaFiltro'),
    path('consultaLaudoAll',views.consultaLaudoAll, name='consultaLaudoAll'),
    path('consultaLaudoFiltro',views.consultaLaudoFiltro, name='consultaLaudoFiltro'),
    path('consultaMedicoAll',views.consultaMedicoAll,name='consultaMedicoAll'),
    path('consultaMedicoFiltro',views.consultaMedicoFiltro,name='consultaMedicoFiltro'),
    path('consultaPacienteFiltro',views.consultaPacienteFiltro,name='  consultaPacienteFiltro'),
  
]