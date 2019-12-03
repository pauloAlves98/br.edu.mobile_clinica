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
   if request.method == 'POST':#para get so mudar aqui
        print("Entrou")
        pac_dict = json.loads(request.POST.get("Consulta"))
        if(pac_dict is None):
           return JsonResponse({'response': False})
        print("Vai salvar Consulta")
        p = Paciente()
        m = Medico()
        p.from_json(pac_dict['id_paciente'])
        m.from_json(pac_dict['id_medico'])
        if(p.id == None and m.id==None):
            p.save()
            m.save()
        print(pac_dict['id_medico'])
        pa = Consulta(id_paciente = p, id_medico = m)
        pa.from_json(pac_dict)
        pa.save()
        print("Salvou")
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
    if request.method == 'POST':#para get so mudar aqui
        print("Entrou")
        pac_dict = json.loads(request.POST.get("Laudo"))
        if(pac_dict is None):
           return JsonResponse({'response': False})
        print("Vai salvar")
        p = Paciente()
        m = Medico()
        p.from_json(pac_dict['id_paciente'])
        m.from_json(pac_dict['id_medico'])
        if(p.id == None and m.id==None):
            p.save()
            m.save()
        print(pac_dict['id_medico'])
        pa = Laudo(id_paciente = p, id_medico = m)
        pa.from_json(pac_dict)
        pa.save()
        print("Salvou")
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
        e.from_json(pac_dict['id_endereco'])
        c.from_json(pac_dict['id_contato'])
        e.save()
        c.save()
        print(pac_dict['id_contato'])
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
def consultaMedicoAll(request):
    medicos = [obj.get_json() for obj in Medico.objects.filter()]
    
    if(len(medicos)==0):
        return JsonResponse({'response':False})
    return JsonResponse({'response':True,'medicos':medicos}, safe=False)

@csrf_exempt
def consultaMedicoFiltro(request):
    nome = str(request.POST.get("filtro"));
    medicos = [obj.get_json() for obj in Medico.objects.filter(id_medico__nome__icontains=nome)]
    
    if(len(medicos)==0):
        return JsonResponse({'response':False})
    return JsonResponse({'response':True,'medicos':medicos}, safe=False)
#---------------------------03/12
@csrf_exempt
def consultaPacienteFiltro(request):
    filtro = str(request.POST.get("filtro"));
    print(filtro);
    pacientes = [obj.get_json() for obj in Paciente.objects.filter(nome__icontains=filtro)]
    if(len(pacientes)==0):
        return JsonResponse({'response':False})
    return JsonResponse({'response':True,'pacientes':pacientes}, safe=False)
@csrf_exempt
def consultaConsultaFiltro(request):
    import datetime as dt

    print(request.POST.get("filtro"))

    print('Entrou Consulta!')
    temp = str(request.POST.get("id"));
    id_c = int(temp)
    data1 = str(request.POST.get("data1"));
    data2 = str(request.POST.get("data2"));
    filtro = str(request.POST.get("filtro"));
    usuario = str(request.POST.get("usuario"));
   
    print(data2+"  Data 1");
   
    start_date = dt.date(int(data1.split("/")[2]), int(data1.split("/")[1]), int(data1.split("/")[0]))
    end_date = dt.date(int(data2.split("/")[2]), int(data2.split("/")[1]), int(data2.split("/")[0]))
    if usuario=="paciente":
        c = [obj.get_json() for obj in Consulta.objects.filter(id_paciente__id=id_c,id_medico__nome__icontains = filtro, data_hora__range=(start_date,end_date))] 
    else:
        c = [obj.get_json() for obj in Consulta.objects.filter(id_medico__id=id_c,id_paciente__nome__icontains = filtro, data_hora__range=(start_date,end_date))] 
    if(len(c)==0):
        return JsonResponse({"response":False})
    return JsonResponse({"response":True,"consultas":c}, safe=False) 


@csrf_exempt
def consultaConsultaAll(request):
    import datetime as dt
    usuario = str(request.POST.get("usuario"));
    temp = str(request.POST.get("id"));
    id_u = int(temp)
    print("Entrou Consulta!")
    start_date = dt.date(1990, 7, 10)
    
    end_date = dt.date(2020, 7, 11)
    if usuario=="paciente":
        c = [obj.get_json() for obj in Consulta.objects.filter(id_paciente__id=id_u,data_hora__range=(start_date,end_date))] 
    else:
        c = [obj.get_json() for obj in Consulta.objects.filter(id_medico__id=id_u,data_hora__range=(start_date,end_date))] 
    print(c)
    if(len(c)==0):
        return JsonResponse({'response':False}, safe=False)
    return JsonResponse({'response':True,'consultas':c}, safe=False)  

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
    usuario = str(request.POST.get("usuario"));
    temp = str(request.POST.get("id"));
    id_u = int(temp)
    print("Entrou Laudo!")
    start_date = dt.date(1990, 7, 10)
    
    end_date = dt.date(2020, 7, 11)
    if usuario=="paciente":
        laudos = [obj.get_json() for obj in Laudo.objects.filter(id_paciente__id=id_u,data_hora__range=(start_date,end_date))] 
    else:
        laudos = [obj.get_json() for obj in Laudo.objects.filter(id_medico__id=id_u,data_hora__range=(start_date,end_date))] 
    print(laudos)
    if(len(laudos)==0):
        return JsonResponse({'response':False}, safe=False)
    return JsonResponse({'response':True,'laudos':laudos}, safe=False)   

@csrf_exempt
def consultaLaudoFiltro(request):
    import datetime as dt
    usuario = str(request.POST.get("usuario"));
    temp = str(request.POST.get("id"));
    id = int(temp)
    print(request.POST.get("filtro"))

    print('Entrou Laudo!')
    data1 = str(request.POST.get("data1"));
    data2 = str(request.POST.get("data2"));
    filtro = str(request.POST.get("filtro"));
   
    print(data2+"  Data 1");
   
    start_date = dt.date(int(data1.split("/")[2]), int(data1.split("/")[1]), int(data1.split("/")[0]))
    end_date = dt.date(int(data2.split("/")[2]), int(data2.split("/")[1]), int(data2.split("/")[0]))
    if usuario=="paciente":
        laudos = [obj.get_json() for obj in Laudo.objects.filter(id_paciente=id,id_paciente__nome__icontains = filtro, data_hora__range=(start_date,end_date))] 
        if (len(laudos)==0):
            laudos = [obj.get_json() for obj in Laudo.objects.filter(id_paciente=id,descricao__icontains = filtro, data_hora__range=(start_date,end_date))] 
        print(laudos);
    else:
        laudos = [obj.get_json() for obj in Laudo.objects.filter(id_medico=id,id_paciente__nome__icontains = filtro, data_hora__range=(start_date,end_date))] 
        if(len(laudos)==0):
            laudos = [obj.get_json() for obj in Laudo.objects.filter(id_medico=id,descricao__icontains = filtro, data_hora__range=(start_date,end_date))] 
        print(laudos);
    
    if(len(laudos)==0):
        return JsonResponse({'response':False}, safe=False)
    return JsonResponse({'response':True,'laudos':laudos}, safe=False)   
