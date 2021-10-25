// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Joke _$JokeFromJson(Map<String, dynamic> json) => Joke(
      content: json['value'] as String,
      icon: json['icon_url'] as String,
      id: json['id'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$JokeToJson(Joke instance) => <String, dynamic>{
      'icon_url': instance.icon,
      'id': instance.id,
      'url': instance.url,
      'value': instance.content,
    };
