import 'package:http/http.dart' as http;
import 'package:new_rest_api_app/constants/strings.dart';

class ApiManager {
  //
  //
  void getNews() async {
    var client = http.Client();
    var response = await client.get(Strings.url as Uri);

    if (response.statusCode == 200) {
      var jsonString = response.body;
    }
  }
}
