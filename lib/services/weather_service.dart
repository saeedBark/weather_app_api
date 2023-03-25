import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_api/models/weather_model.dart';

class weatherService {
  Future<WeatherModel> getweather({required String cityName}) async {
    WeatherModel? weatherData;
    Uri url = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=d6b0614fd5e44ac7889b0105fd6a801e&q=$cityName&days=1');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}



//http://api.weatherapi.com/v1/forecast.json?key=b7960f1e23bb482399b83714221208&q=London&days=1