import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHandeler{
// Base url
  String baseUrl = "https://api.exchangeratesapi.io/latest";
// Get method
  Future get(String url) async{
    url = baseUrl;
    var response = await http.get(url);
    if (response.statusCode == 200){
      return json.decode(response.body);
    }
    print(response.body);
    print(response.statusCode);
  }
}