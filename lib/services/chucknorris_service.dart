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
    if (box.read('categories') != null) {
      categories = List.from(json.decode(box.read('categories')));
    } else {
      var response = await _provider.categories();
      if (response.isOk) {
        categories = List.from(response.body);
        box.write('categories', json.encode(categories));
      }
    }
    return categories;
  }
}
