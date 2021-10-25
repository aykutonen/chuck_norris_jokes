import 'package:chuck_norris_jokes/models/joke/joke.dart';
import 'package:chuck_norris_jokes/providers/chucknorris_provider.dart';
import 'package:get/get.dart';

class ChuckNorrisService {
  final _provider = Get.find<ChuckNorrisProvider>();

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
    var response = await _provider.categories();
    if (response.isOk) categories = List.from(response.body);
    return categories;
  }
}
