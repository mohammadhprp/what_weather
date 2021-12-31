import 'package:flutter/material.dart';

class WeatherTempScreen extends StatelessWidget {
  final String weatherMain;
  final String weatherIcon;
  final String weatherDescription;
  final int mainTemp;
  final double mainMaxTemp;
  final double mainMinTemp;
  // ignore: use_key_in_widget_constructors
  const WeatherTempScreen(
      this.weatherMain,
      this.weatherIcon,
      this.weatherDescription,
      this.mainTemp,
      this.mainMinTemp,
      this.mainMaxTemp);

  @override
  Widget build(BuildContext context) {
    var toCelsius = 273.15;
    var temp = mainTemp - toCelsius;
    var minTemp = mainMinTemp - toCelsius - 9;
    var maxTemp = mainMaxTemp - toCelsius + 5;
    var icon = "http://openweathermap.org/img/wn/$weatherIcon.png";
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 60),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image(
                          image: NetworkImage(icon),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          weatherMain,
                          style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w300,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  weatherDescription,
                  style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                )
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "${temp.toStringAsFixed(0)}°",
                    style: const TextStyle(
                      fontSize: 200,
                      fontWeight: FontWeight.w100,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text("${maxTemp.toStringAsFixed(0)}°C",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.white70,
                          )),
                      const Divider(
                        thickness: 0.8,
                        color: Colors.white,
                        indent: 1,
                        endIndent: 1,
                      ),
                      Text("${minTemp.toStringAsFixed(0)}°C",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            color: Colors.white70,
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
