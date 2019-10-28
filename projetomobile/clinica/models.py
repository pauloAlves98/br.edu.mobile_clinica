from django.db import models

# Create your models here.
class Endereco(models.Model):
    rua = models.CharField(max_length=200, null=False, blank=False)
    numero = models.IntegerField(blank=False)
    complemento = models.CharField(max_length=100)
    bairro = models.CharField(max_length=200)
    cidade = models.CharField(max_length=100, null=False, blank=False)
    estado = models.CharField(max_length=50, null=False, blank=False)
    cep = models.CharField(max_length=15, null=False, blank=False)
    uf = models.CharField(max_length=2, null=False, blank=False)

    def __str__(self):
        return self.rua

    def get_json(self):
        return dict(
            id=self.pk,
            rua=self.rua,
            numero=self.numero,
            complemento=self.complemento,
            bairro=self.bairro,
            cidade=self.cidade,
            estado=self.estado,
            cep = self.cep,
            uf = self.uf
        )

class Contato(models.Model):
    fone1 = models.CharField(max_length=14, null=False, blank=False)
    fone2 = models.CharField(max_length=14)
    email = models.EmailField(max_length=100)

    def __str__(self):
        return self.email

    def get_json(self):
        return dict(
            id=self.pk,
            fone1=self.fone1,
            fone2=self.fone2,
            email=self.email,
        )

class Medico(models.Model):
    SEXO_CHOICES = (
        ("F", "Feminino"),
        ("M", "Masculino"),
        ("N", "Nenhuma das opções")
    )

    cpf = models.IntegerField( null=False, blank=False)
    crm = models.IntegerField()#Na vdd eh 7
    rg = models.IntegerField( null=False, blank=False)
    nome_usuario = models.CharField(max_length=100)
    nome = models.CharField(max_length=100)
    data_nascimento = models.DateField()
    senha = models.CharField(max_length=20)#20
    especialidade = models.CharField(max_length=100)
    area = models.CharField(max_length=100)
    sexo = models.CharField(max_length=1,choices=SEXO_CHOICES,blank=False, null=False)
    id_contato = models.OneToOneField(Contato, on_delete=models.CASCADE, null=True)
    id_endereco = models.OneToOneField(Endereco, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.nome

    def get_json(self):
        return dict(
            id=self.pk,
            cpf=self.cpf,
            crm=self.crm,
            rg =self.rg,
            nome_usuario = self.nome_usuario,
            nome =self.nome,
            data_nascimento = self.data_nascimento,
            senha = self.senha,
            especialidade = self.especialidade,
            area = self.area,
            sexo = self.sexo,
            id_contato = self.id_contato,
            id_endereco = self.id_endereco,
        )


class Paciente(models.Model):

    cpf = models.IntegerField(null=False, blank=False)
    rg = models.IntegerField(null=False, blank=False)
    nome_usuario = models.CharField(max_length=100)
    nome = models.CharField(max_length=100)
    data_nascimento = models.DateField()
    senha = models.CharField(max_length=20)  # 20
    sexo = models.CharField(max_length=1, choices=Medico.SEXO_CHOICES, blank=False, null=False)
    id_contato = models.OneToOneField(Contato, on_delete=models.CASCADE, null=True)
    id_endereco = models.OneToOneField(Endereco, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.nome

    def get_json(self):
        return dict(
            id=self.pk,
            cpf=self.cpf,
            rg=self.rg,
            nome_usuario=self.nome_usuario,
            nome=self.nome,
            data_nascimento = self.data_nascimento,
            senha=self.senha,
            sexo=self.sexo,
            id_contato = self.id_contato.get_json(),
            id_endereco = self.id_endereco.get_json(),
        )

class Consulta(models.Model):

    valor = models.FloatField(null=True)
    tipo = models.CharField(max_length=100)
    situacao = models.CharField(max_length=100)
    data_hora = models.DateTimeField('data da consulta')
    id_paciente = models.ForeignKey(Paciente, on_delete=models.SET_NULL,null=True)
    id_medico = models.ForeignKey(Medico,  on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.situacao

    def get_json(self):
        return dict(
            id = self.pk,
            valor= self.valor,
            tipo = self.tipo,
            situacao= self.situacao,
            data_hora =self.data_hora,
            id_paciente = self.id_paciente,
            id_medico = self.id_medico,
        )


class Laudo(models.Model):

    data_hora = models.DateTimeField('data laudo')
    id_paciente = models.ForeignKey(Paciente, on_delete=models.SET_NULL,null=True)
    id_medico = models.ForeignKey(Medico,  on_delete=models.SET_NULL, null=True)
    descricao = models.TextField()
    def __str__(self):
        return self.data_hora

    def get_json(self):
        return dict(
            id = self.pk,
            data_hora =self.data_hora,
            id_paciente = self.id_paciente,
            id_medico = self.id_medico,
            descricao =self.descricao
        )


class Conversa(models.Model):

    id_paciente = models.ForeignKey(Paciente, on_delete=models.SET_NULL,null=True)
    id_medico = models.ForeignKey(Medico,  on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.id_paciente

    def get_json(self):
        return dict(
            id = self.pk,
            id_paciente = self.id_paciente,
            id_medico = self.id_medico,
        )


class Mensagem(models.Model):

    msg = models.TextField(max_length=500)
    destinatario = models.IntegerField()#id
    emissor = models.IntegerField()#id
    dataMsg = models.DateTimeField('data da msg')
    id_conversa = models.ForeignKey(Conversa, on_delete=models.SET_NULL,null=True)

    def __str__(self):
        return self.msg

    def get_json(self):
        return dict(
            id = self.pk,
            msg = self.msg,
            destinatario = self.destinatario,
            emissor = self.emissor,
            dataMsg =self.dataMsg,
            id_conversa = self.id_conversa,
        )

class Clinica(models.Model):

    razao_social = models.IntegerField()
    nome_fantasia = models.CharField(max_length=200)
    id_endereco = models.OneToOneField(Endereco, on_delete=models.CASCADE, null=True)
    id_contato = models.OneToOneField(Contato, on_delete=models.CASCADE, null=True)
    horarioOpen = models.TimeField()
    horarioClose = models.TimeField()
    tipo = models.CharField(max_length=100)

    def __str__(self):
        return self.nome_fantasia

    def get_json(self):
        return dict(
            id = self.pk,
            razao_social = self.razao_social,
            nome_fantasia = self.nome_fantasia,
            id_endereco = self.id_endereco,
            id_contato =self.id_contato,
            horarioOpen = self.horarioClose,
            horarioClose = self.horarioClose
        )


