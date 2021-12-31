import 'package:flutter/material.dart';

class WeatherBox extends StatelessWidget {
  final String value;
  final String unit;
  final String title;
  final IconData icon;
  // ignore: use_key_in_widget_constructors
  const WeatherBox(this.value, this.unit, this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white60,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.white54,
              ),
              Text(
                "$value$unit",
                style: const TextStyle(fontSize: 20, color: Colors.white54),
              ),
              Text(title,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                      fontWeight: FontWeight.w300))
            ],
          ),
        ));
  }
}
