import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_api/models/weather_model.dart';
import 'package:weather_app_api/pages/search_page.dart';
import 'package:weather_app_api/provider/provider_weather.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    String? hour;
    String? minute;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(
                  updateUi: updateUi,
                );
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  weatherData!.getThemColor(),
                  weatherData!.getThemColor()[300]!,
                  weatherData!.getThemColor()[100]!,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context).cityName!,
                      style:
                          const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      // 'Update at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                      weatherData!.date,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData!.getImage()),
                        Text(
                          weatherData!.temp.toInt().toString(),
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text('maxTemp : ${weatherData!.maxTemp.toInt()} '),
                            Text('mintemp : ${weatherData!.mintemp.toInt()}'),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      weatherData!.weatherStateName,
                      style:
                          const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                  ]),
            ),
    );
  }
}
