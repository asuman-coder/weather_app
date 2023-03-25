// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url
        // 'http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=$apiKey',
        ));
    // 'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude,uk&APPID=$apiKey'));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
