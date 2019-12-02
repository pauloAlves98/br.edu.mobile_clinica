// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Consulta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Consulta _$ConsultaFromJson(Map<String, dynamic> json) {
  return Consulta()
    ..id = json['id'] as int
    ..valor = (json['valor'] as num)?.toDouble()
    ..tipo = json['tipo'] as String
    ..situacao = json['situacao'] as String
    ..data_hora = json['data_hora'] == null
        ? null
        : DateTime.parse(json['data_hora'] as String)
    ..id_paciente = json['id_paciente'] == null
        ? null
        : Paciente.fromJson(json['id_paciente'] as Map<String, dynamic>)
    ..id_medico = json['id_medico'] == null
        ? null
        : Medico.fromJson(json['id_medico'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ConsultaToJson(Consulta instance) => <String, dynamic>{
      'id': instance.id,
      'valor': instance.valor,
      'tipo': instance.tipo,
      'situacao': instance.situacao,
      'data_hora': instance.data_hora?.toIso8601String(),
      'id_paciente': instance.id_paciente,
      'id_medico': instance.id_medico
    };
