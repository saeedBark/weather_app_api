import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_api/models/weather_model.dart';
import 'package:weather_app_api/pages/home_page.dart';
import 'package:weather_app_api/provider/provider_weather.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context).weatherData!.getThemColor(),
      ),
      home: HomePage(),
    );
  }
}
