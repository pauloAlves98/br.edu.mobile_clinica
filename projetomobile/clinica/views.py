from django.shortcuts import render
# Create your views here.
from django.http import HttpResponse
from django.http import Http404
from django.shortcuts import get_object_or_404, render
#import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render
from django.contrib.auth.models import User, Group
#from quickstart.serializers import UserSerializer
from django.core import serializers
#import pickle
from clinica.models import Paciente


def index(request):
    #latest_question_list = Question.people.order_by('-pub_date')[:5]
    #context = {'latest_question_list': latest_question_list}
    #return render(request, 'polls/index.html', context)
    return HttpResponse("HELLO WORLD")

@csrf_exempt
def login(request):
    print(request)
    if request.method == 'POST':#para get so mudar aqui.
        login = request.POST.get('login')#para get so mudar aqui.
        senha = request.POST.get('senha')#para get so mudar aqui.
        print("Login"+login);
        print("Senha:"+senha);
        if login and senha:
            usuario = Paciente.objects.filter(nome_usuario=login, senha=senha)
            if usuario.exists():
                print("Usuario:")
                #print(usuario.first().get_json())
                return JsonResponse({'response': True, 'paciente': usuario.first().get_json()})


    # if request.method == 'GET':
    #     pass

    return JsonResponse({'response': False})