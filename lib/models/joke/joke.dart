import 'package:json_annotation/json_annotation.dart';

part 'joke.g.dart';

@JsonSerializable()
class Joke {
  @JsonKey(name: "icon_url")
  String icon;
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "value")
  String content;

  Joke({
    required this.content,
    required this.icon,
    required this.id,
    required this.url,
  });

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);

  Map<String, dynamic> toJson() => _$JokeToJson(this);
}
