from django.forms import ModelForm
from clinica.models import Paciente
from clinica.models import Medico
from clinica.models import Clinica
from clinica.models import Consulta
from clinica.models import Contato
from clinica.models import Conversa
from clinica.models import Endereco
from clinica.models import Laudo
from clinica.models import Mensagem

class PacienteForm(ModelForm):
    class Meta:
        model = Paciente
        fields = '__all__'

class MedicoForm(ModelForm):
    class Meta:
        model = Medico
        fields = '__all__'

class ClinicaForm(ModelForm):
    class Meta:
        model = Clinica
        fields = '__all__'

class ConsultaForm(ModelForm):
    class Meta:
        model = Consulta
        fields = '__all__'

class ContatoForm(ModelForm):
    class Meta:
        model = Contato
        fields = '__all__'

class ConversaForm(ModelForm):
    class Meta:
        model = Conversa
        fields = '__all__'

class EnderecoForm(ModelForm):
    class Meta:
        model = Endereco
        fields = '__all__'

class LaudoForm(ModelForm):
    class Meta:
        model = Laudo
        fields = '__all__'

class MensagemForm(ModelForm):
    class Meta:
        model = Mensagem
        fields = '__all__'