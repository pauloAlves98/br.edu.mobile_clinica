# Generated by Django 2.2.6 on 2019-10-27 18:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Contato',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fone1', models.CharField(max_length=14)),
                ('fone2', models.CharField(max_length=14)),
                ('email', models.EmailField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Conversa',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Endereco',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rua', models.CharField(max_length=200)),
                ('numero', models.IntegerField()),
                ('complemento', models.CharField(max_length=100)),
                ('bairro', models.CharField(max_length=200)),
                ('cidade', models.CharField(max_length=100)),
                ('estado', models.CharField(max_length=50)),
                ('cep', models.CharField(max_length=15)),
                ('uf', models.CharField(max_length=2)),
            ],
        ),
        migrations.CreateModel(
            name='Paciente',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cpf', models.IntegerField()),
                ('rg', models.IntegerField()),
                ('nome_usuario', models.CharField(max_length=100)),
                ('nome', models.CharField(max_length=100)),
                ('data_nascimento', models.DateField()),
                ('senha', models.CharField(max_length=20)),
                ('sexo', models.CharField(choices=[('F', 'Feminino'), ('M', 'Masculino'), ('N', 'Nenhuma das opções')], max_length=1)),
                ('id_contato', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to='clinica.Contato')),
                ('id_endereco', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to='clinica.Endereco')),
            ],
        ),
        migrations.CreateModel(
            name='Mensagem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('msg', models.TextField(max_length=500)),
                ('destinatario', models.IntegerField()),
                ('emissor', models.IntegerField()),
                ('dataMsg', models.DateTimeField(verbose_name='data da msg')),
                ('id_conversa', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='clinica.Conversa')),
            ],
        ),
        migrations.CreateModel(
            name='Medico',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cpf', models.IntegerField()),
                ('crm', models.IntegerField()),
                ('rg', models.IntegerField()),
                ('nome_usuario', models.CharField(max_length=100)),
                ('nome', models.CharField(max_length=100)),
                ('data_nascimento', models.DateField()),
                ('senha', models.CharField(max_length=20)),
                ('especialidade', models.CharField(max_length=100)),
                ('area', models.CharField(max_length=100)),
                ('sexo', models.CharField(choices=[('F', 'Feminino'), ('M', 'Masculino'), ('N', 'Nenhuma das opções')], max_length=1)),
                ('id_contato', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to='clinica.Contato')),
                ('id_endereco', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to='clinica.Endereco')),
            ],
        ),
        migrations.CreateModel(
            name='Laudo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('data_hora', models.DateTimeField(verbose_name='data laudo')),
                ('descricao', models.TextField()),
                ('id_medico', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='clinica.Medico')),
                ('id_paciente', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='clinica.Paciente')),
            ],
        ),
        migrations.AddField(
            model_name='conversa',
            name='id_medico',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='clinica.Medico'),
        ),
        migrations.AddField(
            model_name='conversa',
            name='id_paciente',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='clinica.Paciente'),
        ),
        migrations.CreateModel(
            name='Consulta',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('valor', models.FloatField(null=True)),
                ('tipo', models.CharField(max_length=100)),
                ('situacao', models.CharField(max_length=100)),
                ('data_hora', models.DateTimeField(verbose_name='data da consulta')),
                ('id_medico', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='clinica.Medico')),
                ('id_paciente', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='clinica.Paciente')),
            ],
        ),
        migrations.CreateModel(
            name='Clinica',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('razao_social', models.IntegerField()),
                ('nome_fantasia', models.CharField(max_length=200)),
                ('horarioOpen', models.TimeField()),
                ('horarioClose', models.TimeField()),
                ('tipo', models.CharField(max_length=100)),
                ('id_contato', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to='clinica.Contato')),
                ('id_endereco', models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, to='clinica.Endereco')),
            ],
        ),
    ]