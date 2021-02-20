// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event()
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..summary = json['summary'] as String
    ..description = json['description'] as String
    ..imageUrl = json['imageUrl'] as String
    ..yearGroups = (json['yearGroups'] as List)?.map((e) => e as int)?.toList()
    ..startTime = noopTransform(json['startTime'])
    ..endTime = noopTransform(json['endTime'])
    ..club = json['club'] == null
        ? null
        : Club.fromJson(json['club'] as Map<String, dynamic>)
    ..clubId = json['clubId'] as String;
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'yearGroups': instance.yearGroups,
      'startTime': noopTransform(instance.startTime),
      'endTime': noopTransform(instance.endTime),
      'club': instance.club,
      'clubId': instance.clubId,
    };
