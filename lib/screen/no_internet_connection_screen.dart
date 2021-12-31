import 'package:flutter/material.dart';
import 'package:what_weather/services/weather_service.dart';

class NoInternetConnectionScreeen extends StatelessWidget {
  const NoInternetConnectionScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF3D4D6A),
      padding: const EdgeInsets.all(16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/NoConnection.png'),
              fit: BoxFit.cover,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'No Internet',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w100,
                    color: Colors.white),
              ),
              Text(
                'Connection',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text('Please check your internet connection',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      color: Colors.white)),
            ]),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                onPressed: () {
                  fetchWeather();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 15.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Try Again',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
