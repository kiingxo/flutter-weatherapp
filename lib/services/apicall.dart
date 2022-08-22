import 'package:http/http.dart' as http;
import 'dart:convert';

//requested for the api 

class HttpClient {
  var url;
  HttpClient({required this.url});
  Future getweatherdata() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseDecoded = jsonDecode(response.body);
      return responseDecoded;
    } else {
      print(response.statusCode);
    }
  }
}
