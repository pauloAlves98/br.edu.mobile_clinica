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
from clinica.models import Contato
from .form import PacienteForm
from .form import ClinicaForm
from .form import ConsultaForm
from .form import ContatoForm
from .form import ConversaForm
from .form import EnderecoForm
from .form import LaudoForm
from .form import MedicoForm
from .form import MensagemForm

def index(request):
    #latest_question_list = Question.people.order_by('-pub_date')[:5]
    #context = {'latest_question_list': latest_question_list}
    #return render(request, 'polls/index.html', context)
    return HttpResponse("HELLO WORLD")
@csrf_exempt
def contatoSaveEdit(request):#vai ser save e edit
    print(request)
    if request.method == 'POST':#para get so mudar aqui
        # do outro jeito tem que fazer cas no request.get
        form = ContatoForm(request.POST)
        print("Entrou")
        if form.is_valid():
            print("Salva")
            form.save()
        else:
              return JsonResponse({'response': False})

        return JsonResponse({'response': True})

@csrf_exempt
def clinicaSaveEdit(request):
     if request.method == 'POST':#para get so mudar aqui
        form = ClinicaForm(request.POST)
        print("Entrou")
        if form.is_valid():
            print("Salva")
            form.save()
        else:
              return JsonResponse({'response': False})

        return JsonResponse({'response': True})

@csrf_exempt
def consultaSaveEdit(request):
    print(request)
    if request.method == 'POST':#para get so mudar aqui
        form = ConsultaForm(request.POST)
        print("Entrou")
        if form.is_valid():
            print("Salva")
            form.save()
        else:
              return JsonResponse({'response': False})

        return JsonResponse({'response': True})
@csrf_exempt
def conversaSaveEdit(request):
    print(request)
    if request.method == 'POST':#para get so mudar aqui
        form = ConversaForm(request.POST)
        print("Entrou")
        if form.is_valid():
            print("Salva")
            form.save()
        else:
              return JsonResponse({'response': False})

        return JsonResponse({'response': True})
@csrf_exempt
def enderecoSaveEdit(request):
    print(request)
    if request.method == 'POST':#para get so mudar aqui
        form = EnderecoForm(request.POST)
        print("Entrou")
        if form.is_valid():
            print("Salva")
            form.save()
        else:
              return JsonResponse({'response': False})

        return JsonResponse({'response': True})
@csrf_exempt
def laudoSaveEdit(request):
    print(request)
    if request.method == 'POST':#para get so mudar aqui
        form = LaudoForm(request.POST)
        print("Entrou")
        if form.is_valid():
            print("Salva")
            form.save()
        else:
              return JsonResponse({'response': False})

        return JsonResponse({'response': True})
@csrf_exempt
def medicoSaveEdit(request):
    print(request)
    if request.method == 'POST':#para get so mudar aqui
        form = MedicoForm(request.POST)
        print("Entrou")
        if form.is_valid():
            print("Salva")
            form.save()
        else:
              return JsonResponse({'response': False})

        return JsonResponse({'response': True})
@csrf_exempt
def mensagemSaveEdit(request):
    print(request)
    if request.method == 'POST':#para get so mudar aqui
        form = MensagemForm(request.POST)
        print("Entrou")
        if form.is_valid():
            print("Salva")
            form.save()
        else:
              return JsonResponse({'response': False})

        return JsonResponse({'response': True})

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