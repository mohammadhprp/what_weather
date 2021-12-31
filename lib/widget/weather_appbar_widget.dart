import 'package:flutter/material.dart';

class WeatherAppbarScreen extends StatelessWidget {
  const WeatherAppbarScreen(this.name, this.date);
  final String name;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      // alignment: Alignment.center,
      child: ListTile(
        title: Column(
          children: [
            Text(
              "$name City",
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 32,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              date,
              style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
        trailing: const Icon(
          Icons.add,
          color: Colors.white60,
          size: 28,
        ),
        leading: const Icon(
          Icons.menu,
          color: Colors.white60,
          size: 28,
        ),
      ),
    );
  }
}
