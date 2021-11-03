import 'dart:convert';

import 'package:chuck_norris_jokes/models/joke/joke.dart';
import 'package:chuck_norris_jokes/providers/chucknorris_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
    var fromBox = box.read('categories');
    if (fromBox != null) {
      categories = List.from(json.decode(fromBox));
    } else {
      var response = await _provider.categories();
      if (response.isOk) {
        categories = List.from(response.body);
        box.write('categories', json.encode(categories));
      }
    }
    return categories;
  }

  void selectCategory(String cat) {
    box.write('selectedCategory', cat);
  }

  String getSelectedCategory() => box.read('selectedCategory') ?? '';

  List<Joke> getLikes() {
    List<Joke> likes = [];
    // box.remove('likes');
    var fromBox = box.read('likes');
    if (fromBox != null) {
      likes = List.from(json.decode(fromBox));
    }
    return likes;
  }

  void addLike(Joke joke) {
    var likes = getLikes();
    likes.add(joke);
    box.write('likes', json.encode(likes));
  }

  void removeLike(String id) {
    var likes = getLikes();
    likes.removeWhere((element) => element.id == id);
    box.write('likes', json.encode(likes));
  }
}
