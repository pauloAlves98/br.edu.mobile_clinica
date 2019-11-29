// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Endereco.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Endereco _$EnderecoFromJson(Map<String, dynamic> json) {
  return Endereco()
    ..id = json['id'] as int
    ..rua = json['rua'] as String
    ..numero = json['numero'] as int
    ..complemento = json['complemento'] as String
    ..bairro = json['bairro'] as String
    ..cidade = json['cidade'] as String
    ..estado = json['estado'] as String
    ..cep = json['cep'] as String
    ..uf = json['uf'] as String;
}

Map<String, dynamic> _$EnderecoToJson(Endereco instance) => <String, dynamic>{
      'id': instance.id,
      'rua': instance.rua,
      'numero': instance.numero,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'cidade': instance.cidade,
      'estado': instance.estado,
      'cep': instance.cep,
      'uf': instance.uf
    };
