// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Contato.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contato _$ContatoFromJson(Map<String, dynamic> json) {
  return Contato()
    ..id = json['id'] as int
    ..fone1 = json['fone1'] as String
    ..fone2 = json['fone2'] as String
    ..email = json['email'] as String;
}

Map<String, dynamic> _$ContatoToJson(Contato instance) => <String, dynamic>{
      'id': instance.id,
      'fone1': instance.fone1,
      'fone2': instance.fone2,
      'email': instance.email
    };
