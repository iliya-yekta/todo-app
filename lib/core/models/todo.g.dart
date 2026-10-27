// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Todo _$TodoFromJson(Map<String, dynamic> json) => _Todo(
  id: json['id'] as String?,
  createdAt: json['createdAt'] as String?,
  description: json['description'] as String? ?? 'No Description',
  isCompleted: json['isCompleted'] as bool? ?? false,
  name: json['name'] as String,
);

Map<String, dynamic> _$TodoToJson(_Todo instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt,
  'description': instance.description,
  'isCompleted': instance.isCompleted,
  'name': instance.name,
};
