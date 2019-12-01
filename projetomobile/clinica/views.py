from django.shortcuts import render
# Create your views here.
from django.http import HttpResponse
from django.http import Http404
from django.shortcuts import get_object_or_404, render
#import json
from django.http import JsonResponse
import json
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render
from django.contrib.auth.models import User, Group
#from quickstart.serializers import UserSerializer
from django.core import serializers
#import pickle
from clinica.models import Paciente
from clinica.models import Contato
from clinica.models import Endereco
from clinica.models import Laudo
from clinica.models import Medico
from clinica.models import Consulta
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
        print("Entrou")
        pac_dict = json.loads(request.POST.get("Medico"))
        if(pac_dict is None):
           return JsonResponse({'response': False})
        print("Vai salvar")
        c = Contato()
        e = Endereco()
        e.from_json(pac_dict['id_endereco'])
        c.from_json(pac_dict['id_contato'])
        e.save()
        c.save()
        print(pac_dict['id_contato'])
        pa = Medico(nome='killer', id_contato = c, id_endereco= e)
        pa.from_json(pac_dict)
        pa.save()
        print("Salvou")
        return JsonResponse({'response': True})

@csrf_exempt
def pacienteSaveEdit(request):
    print(request)
    if request.method == 'POST':#para get so mudar aqui
        print("Entrou1")
        # form = PacienteForm(request.POST)
        # print(request.POST.get("Paciente"))
        pac_dict = json.loads(request.POST.get("Paciente"))
        print("Vai salvar")
        c = Contato()
        e = Endereco(estado="PERNAMBUCO")
        e.from_json(pac_dict['endereco'])
        c.from_json(pac_dict['contato'])
        e.save()
        c.save()
        print(pac_dict['contato'])
        pa = Paciente(nome='killer', id_contato = c, id_endereco= e)
        pa.from_json(pac_dict)
        pa.save()
        print("Salvou")
        # print(person_dict)
        # print(person_dict['nome']+"     Nome")
        # print("Entrou")
        # if form.is_valid():
        #     print("Salva")
        #     form.save()
        # else:
        #       return JsonResponse({'response': False})

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

@csrf_exempt
def madicoSearch(request):
    m = [obj.get_json() for obj in Medico.objects.filter()]
    medicos = list(m)
    return JsonResponse({'medico':medicos}, safe=False)

@csrf_exempt
def laudoSearchDataNome(request):
    import datetime as dt
    start_date = dt.date(2016, 7, 10)
    end_date = dt.date(2020, 7, 11)
    laudos = [obj.get_json() for obj in Laudo.objects.filter(id_paciente=2,data_hora__range=(start_date,end_date))] 
    return JsonResponse({'laudo':laudos}, safe=False)
@csrf_exempt
def laudoSearch(request):
    l = [obj.get_json() for obj in Laudo.objects.filter(id_paciente=2)]
    laudos = list(l)
    return JsonResponse({'laudo':laudos}, safe=False)

@csrf_exempt
def consultaSearch(request):
    print("Entrou 1")
    c = [obj.get_json() for obj in Consulta.objects.filter(id_paciente=2)]
   # c = Consulta.objects.filter()
    print(c)
    #print(l)
    print("Entrou 2")
 
    return JsonResponse({"consulta":c}, safe=False)

#------------------------------------
@csrf_exempt
def loginMedico(request):

    print(request)
    if request.method == 'POST':#para get so mudar aqui.
        login = request.POST.get('login')#para get so mudar aqui.
        senha = request.POST.get('senha')#para get so mudar aqui.
        crm = request.POST.get('crm')#para get so mudar aqui.
        print("Login"+login);
        print("Senha:"+senha);
        print("Senha:"+crm);

        if login and senha and crm:
            usuario = Medico.objects.filter(nome_usuario=login, senha=senha, crm = crm)
            if usuario.exists():
                print("Usuario:")
                #print(usuario.first().get_json())
                return JsonResponse({'response': True, 'medico': usuario.first().get_json()})


    # if request.method == 'GET':
    #     pass

    return JsonResponse({'response': False})

@csrf_exempt
def consultaLaudoAll(request):
    import datetime as dt
    print("Entrou Laudo!")
    start_date = dt.date(2000, 7, 10)
    end_date = dt.date(2020, 7, 11)
    laudos = [obj.get_json() for obj in Laudo.objects.filter(data_hora__range=(start_date,end_date))] 
    print(laudos);
    return JsonResponse({'laudos':laudos}, safe=False)   

@csrf_exempt
def consultaLaudoFiltro(request):
    import datetime as dt

    print(request.POST.get("filtro"))

    print('Entrou Laudo!')
    data1 = str(request.POST.get("data1"));
    data2 = str(request.POST.get("data2"));
    filtro = str(request.POST.get("filtro"));
   
    print(data2+"  Data 1");
   
    start_date = dt.date(int(data1.split("/")[2]), int(data1.split("/")[1]), int(data1.split("/")[0]))
    end_date = dt.date(int(data2.split("/")[2]), int(data2.split("/")[1]), int(data2.split("/")[0]))

    laudos = [obj.get_json() for obj in Laudo.objects.filter(id_paciente__nome__icontains = filtro, data_hora__range=(start_date,end_date))] 
    if(len(laudos)==0):
       laudos = [obj.get_json() for obj in Laudo.objects.filter(descricao__icontains = filtro, data_hora__range=(start_date,end_date))] 
    print(laudos);
    return JsonResponse({'laudos':laudos}, safe=False) 
