import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:what_weather/services/weather_service.dart';
import 'package:what_weather/model/weather.dart';

import 'package:what_weather/screen/no_internet_connection_screen.dart';

import 'package:what_weather/widget/weather_box_widget.dart';
import 'package:what_weather/widget/weather_appbar_widget.dart';
import 'package:what_weather/widget/weather_temp_widget.dart';
import 'package:what_weather/widget/weather_bg_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Weathers> _fetchWeather;

  @override
  void initState() {
    super.initState();
    _fetchWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('EE, h:mm a');
    String today = formatter.format(now);
    return FutureBuilder<Weathers>(
      future: _fetchWeather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Stack(
            children: [
              WeatherBGScreen(
                  snapshot.data!.weather[0].id, snapshot.data!.weather[0].icon),
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: MediaQuery.of(context).padding.left,
                right: MediaQuery.of(context).padding.right,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WeatherAppbarScreen(snapshot.data!.name, today),
                    WeatherTempScreen(
                      snapshot.data!.weather[0].main,
                      snapshot.data!.weather[0].icon,
                      snapshot.data!.weather[0].description,
                      snapshot.data!.main.temp,
                      snapshot.data!.main.tempMax,
                      snapshot.data!.main.tempMin,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WeatherBox(snapshot.data!.wind.speed.toString(), "Km/h",
                            "Wind", Icons.speed_outlined),
                        WeatherBox(snapshot.data!.main.humidity.toString(), "%",
                            "Humidity", Icons.water),
                        WeatherBox(snapshot.data!.clouds.all.toString(), "%",
                            "Couldiness", Icons.cloud)
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return NoInternetConnectionScreeen();
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
