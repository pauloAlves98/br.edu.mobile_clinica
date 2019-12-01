// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Laudo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Laudo _$LaudoFromJson(Map<String, dynamic> json) {
  return Laudo()
    ..id = json['id'] as int
    ..data_hora = json['data_hora'] == null
        ? null
        : DateTime.parse(json['data_hora'] as String)
    ..id_medico = json['id_medico'] == null
        ? null
        : Medico.fromJson(json['id_medico'] as Map<String, dynamic>)
    ..id_paciente = json['id_paciente'] == null
        ? null
        : Paciente.fromJson(json['id_paciente'] as Map<String, dynamic>)
    ..descricao = json['descricao'] as String;
}

Map<String, dynamic> _$LaudoToJson(Laudo instance) => <String, dynamic>{
      'id': instance.id,
      'data_hora': instance.data_hora?.toIso8601String(),
      'id_medico': instance.id_medico?.toJson(),
      'id_paciente': instance.id_paciente?.toJson(),
      'descricao': instance.descricao
    };
