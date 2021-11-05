// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Joke _$JokeFromJson(Map<String, dynamic> json) => Joke(
      json['value'] as String,
      json['icon_url'] as String,
      json['id'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$JokeToJson(Joke instance) => <String, dynamic>{
      'icon_url': instance.icon,
      'id': instance.id,
      'url': instance.url,
      'value': instance.content,
    };
