import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:what_weather/model/weather.dart';

Future<Weathers> fetchWeather() async {
  var city = "Tehran";
  var key = "YOUR_API_KEY";
  var lang = "fa";
  final response = await http.get(Uri.parse(
      'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$key'));

  if (response.statusCode == 200) {
    return Weathers.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
