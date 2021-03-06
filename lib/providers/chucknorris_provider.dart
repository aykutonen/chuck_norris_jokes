import 'package:get/get.dart';

class ChuckNorrisProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://api.chucknorris.io/jokes/';
    httpClient.maxAuthRetries = 3;
  }

  Future<Response> random() async =>
      await get("random?dt=${DateTime.now().microsecondsSinceEpoch}");

  Future<Response> randomByCateogry(String cat) async => await get(
      "random?category=$cat&dt=${DateTime.now().microsecondsSinceEpoch}");

  Future<Response> categories() async => await get("categories");

  Future<Response> search(String query) async =>
      await get("search?query=$query");
}
