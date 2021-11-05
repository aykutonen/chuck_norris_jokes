import 'dart:convert';

import 'package:chuck_norris_jokes/models/joke/joke.dart';
import 'package:chuck_norris_jokes/providers/chucknorris_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// Keys
final String _selectedCategoryKey = 'selected_category',
    _categoriesKey = 'categories',
    _likesKey = 'likes';

class ChuckNorrisService {
  final _provider = Get.put(ChuckNorrisProvider());
  final box = GetStorage();

  Future<Joke?> random() async {
    Joke? result;
    var response = await _provider.random();
    if (response.isOk) result = Joke.fromJson(response.body);
    return result;
  }

  Future<Joke?> randomByCategory(String cat) async {
    Joke? result;
    var response = await _provider.randomByCateogry(cat);
    if (response.isOk) result = Joke.fromJson(response.body);
    return result;
  }

  Future<List<String>> categories() async {
    List<String> categories = [];
    var fromBox = box.read(_categoriesKey);
    if (fromBox != null) {
      categories = List.from(json.decode(fromBox));
    } else {
      var response = await _provider.categories();
      if (response.isOk) {
        categories = List.from(response.body);
        box.write(_categoriesKey, json.encode(categories));
      }
    }
    return categories;
  }

  void selectCategory(String cat) => box.write(_selectedCategoryKey, cat);

  String getSelectedCategory() => box.read(_selectedCategoryKey) ?? '';

  List<Joke> getLikes() {
    List<Joke> likes = [];
    var fromBox = box.read(_likesKey);
    if (fromBox != null) {
      List<dynamic> _decoded = json.decode(fromBox);
      _decoded.forEach((element) {
        likes.add(Joke.fromJson(element));
      });
    }
    return likes;
  }

  void addLike(Joke joke) {
    var likes = getLikes();
    likes.add(joke);
    box.write(_likesKey, json.encode(likes));
  }

  void removeLike(String id) {
    var likes = getLikes();
    likes.removeWhere((element) => element.id == id);
    box.write(_likesKey, json.encode(likes));
  }
}
