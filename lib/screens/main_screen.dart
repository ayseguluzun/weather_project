// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hava_durumu_projesi/utils/weather.dart';

class MainScreen extends StatefulWidget {
  final WeatherData weatherData;
  MainScreen({required this.weatherData});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var temperature;
  late AssetImage backgroundImage;
  late Icon weatherDisplayIcon;
  late String city;

  void updateDisplayInfo(WeatherData weatherData) {
    // static verileri anlık olarak değiştirmek için setstate kullandık
    setState(() {
      city = weatherData.city;
      temperature = weatherData.currentTemperature.round();
      WeatherDisplayData weatherDisplayData =
          weatherData.getWeatherDisplayData();
      backgroundImage = weatherDisplayData.weatherImage;
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          // derece ve icon eklemesi yapavağız ve burada dikey bir hizalama
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              child: weatherDisplayIcon,
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                '$temperature°C',
                style: TextStyle(
                    color: Colors.white24, fontSize: 60.0, letterSpacing: -5),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                '$city',
                style: TextStyle(
                    color: Colors.white24, fontSize: 40.0, letterSpacing: -5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
