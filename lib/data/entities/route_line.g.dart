// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteLine _$RouteLineFromJson(Map<String, dynamic> json) => RouteLine(
      id: json['id'] as String,
      idStart: json['idStart'] as String,
      idEnd: json['idEnd'] as String,
      accessible: json['accessible'] as bool,
      name: json['name'] as String,
      points: json['points'] as List<dynamic>,
    );

Map<String, dynamic> _$RouteLineToJson(RouteLine instance) => <String, dynamic>{
      'id': instance.id,
      'idStart': instance.idStart,
      'idEnd': instance.idEnd,
      'name': instance.name,
      'accessible': instance.accessible,
      'points': instance.points,
    };
