import 'package:flutter/material.dart';

class WeatherBGScreen extends StatelessWidget {
  final int status;
  final String icon;
  const WeatherBGScreen(this.status, this.icon);

  @override
  Widget build(BuildContext context) {
    //   String regexs(String pattern, String text) {
    //   final regex = RegExp(pattern);
    //   return regex.firstMatch(text)?.group(0) as String;
    // }
    final regexStatusCode = RegExp(r'^([0-9])');
    final regexIconcCode = RegExp(r'(d|n)$');
    var statusCode = regexStatusCode.firstMatch(status.toString())?.group(0);
    var iconCode = regexIconcCode.firstMatch(icon.toString())?.group(0);

    Container buildBackgroundContainer(Color top, Color bottom) {
      return Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [top, bottom],
            tileMode: TileMode.repeated,
            stops: [
              0.0,
              1.0,
            ]),
      ));
    }

    Widget background =
        buildBackgroundContainer(Color(0xFF000000), Color(0xFFFFFFFF));
    if (status.toString() == "800") {
      // Clear
      return background = buildBackgroundContainer(
          iconCode == 'd' ? Color(0xFF51A4DB) : Color(0xFF112158), // tops
          iconCode == 'd' ? Color(0xFF73BAE1) : Color(0xFF9561A1)); // bottoms
    }
    print("weather code: $statusCode, and is $iconCode");
    // statusCode = "8";
    // iconCode = "n";
    switch (statusCode) {
      case "2": // Thunderstorm
        background = buildBackgroundContainer(
            iconCode == 'd' ? Color(0xFF616A9E) : Color(0xFF292D44), // tops
            iconCode == 'd' ? Color(0xFFCDACA7) : Color(0xFFAA928F)); // bottoms
        break;
      case "3": // Drizzle
        background = buildBackgroundContainer(
            iconCode == 'd' ? Color(0xFF666E82) : Color(0xFF081B1F), // tops
            iconCode == 'd' ? Color(0xFFC4D5D9) : Color(0xFF628790)); // bottoms
        break;
      case "5": // Rain
        background = buildBackgroundContainer(
            iconCode == 'd' ? Color(0xFF4C97BE) : Color(0xFF1B3045), // tops
            iconCode == 'd' ? Color(0xFFC8D4E7) : Color(0xFF8196AB)); // bottoms
        break;
      case "6": // Snow
        background = buildBackgroundContainer(
            iconCode == 'd' ? Color(0xFF648fc1) : Color(0xFF3D567F), // tops
            iconCode == 'd' ? Color(0xFF609DCD) : Color(0xFF629CD5)); // bottoms
        break;
      case "7": // Atmosphere
        background = buildBackgroundContainer(
            iconCode == 'd' ? Color(0xFF343762) : Color(0xFF20224B), // tops
            iconCode == 'd' ? Color(0xFF757D97) : Color(0xFF414B67)); // bottoms
        break;
      case "8": // Clouds
        background = buildBackgroundContainer(
            iconCode == 'd' ? Color(0xFF5393B2) : Color(0xFF363441), // tops
            iconCode == 'd' ? Color(0xFFA6BCCA) : Color(0xFF80ADC0)); // bottoms
        break;
      default:
    }
    return background;
  }
}
