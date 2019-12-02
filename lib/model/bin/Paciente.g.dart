// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Paciente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paciente _$PacienteFromJson(Map<String, dynamic> json) {
  return Paciente()
    ..id = json['id'] as int
    ..ativo = json['ativo'] as bool
    ..cpf = json['cpf'].toString() as String
    ..rg = json['rg'].toString() as String
    ..nome_usuario = json['nome_usuario'] as String
    ..nome = json['nome'] as String
    ..data_nascimento = json['data_nascimento'] == null
        ? null
        : DateTime.parse(json['data_nascimento'] as String)
    ..senha = json['senha'] as String
    ..sexo = json['sexo'] as String
    ..id_contato = json['id_contato'] == null
        ? null
        : Contato.fromJson(json['id_contato'] as Map<String, dynamic>)
    ..id_endereco = json['id_endereco'] == null
        ? null
        : Endereco.fromJson(json['id_endereco'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PacienteToJson(Paciente instance) => <String, dynamic>{
      'id': instance.id,
      'ativo': instance.ativo,
      'cpf': instance.cpf,
      'rg': instance.rg,
      'nome_usuario': instance.nome_usuario,
      'nome': instance.nome,
      'data_nascimento': instance.data_nascimento?.toIso8601String(),
      'senha': instance.senha,
      'sexo': instance.sexo,
      'id_contato': instance.id_contato?.toJson(),
      'id_endereco': instance.id_endereco?.toJson()
    };
