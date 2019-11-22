from django.urls import path

from . import views

urlpatterns = [
   # path('', views.index, name='index')
    # ex: /polls/
    path('', views.index, name='index'),
    path('login', views.login, name='login'),
    path('cadastroPaciente', views.cadastroPaciente, name='cadastroPaciente'),
    path('cadastroMensagem',views.cadastroMensagem, name='cadastroMensagem'),
    path('cadastroMedico',views.cadastroMedico, name='cadastroMedico'),
    path('cadastroLaudo',views.cadastroLaudo, name='cadastroLaudo'),
    path('cadastroEndereco',views.cadastroEndereco, name='cadastroEndereco'),
    path('cadastroConversa',views.cadastroConversa, name='cadastroConversa'),
    path('cadastroContato',views.cadastroContato, name='cadastroContato'),
    path('cadastroConsulta',views.cadastroConsulta, name='cadastroConsulta')
]