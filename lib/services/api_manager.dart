import 'package:http/http.dart' as http;
import 'package:new_rest_api_app/constants/strings.dart';
import 'dart:convert';
import 'package:new_rest_api_app/models/NewsApiModel.dart';

Future<List<NewsApiModel>> getNews() async {
  Uri url = Uri.parse(Strings.url);

  var response = await http.get(url);

  if (response.statusCode == 200 || response.statusCode == 201) {
    Map<String, dynamic> map = json.decode(response.body);

    List _articlesList = map['articles'] ?? "";

    List<NewsApiModel> newsList =
        _articlesList.map((data) => NewsApiModel.fromJson(data)).toList();

    return newsList;
  } else {
    print("no response.");
    return [];
  }
}
