// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps, avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

import 'location.dart';

const apiKey = "513b94cac5543c0b26995d524616f6cc";

class WeatherDisplayData {
  late Icon weatherIcon;
  late AssetImage weatherImage;
  WeatherDisplayData(
      {required this.weatherIcon, required this.weatherImage}); //constructor
}

class WeatherData {
  WeatherData({required this.locationData});

  LocationHelper locationData;
  var currentTemperature;
  var currentCondition;
  var city;

  Future<void> getCurrentTemperature() async {
    Response response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric"));

    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);
      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
        city = currentWeather['name'];
      } catch (e) {
        print(e);
      }
    } else {
      print("Api'den değer gelmiyor");
    }
  }

  WeatherDisplayData getWeatherDisplayData() {
    if (currentCondition < 600) {
      return WeatherDisplayData(
        weatherIcon: Icon(
          FontAwesomeIcons.cloud,
          size: 75.0,
          color: Colors.white24,
        ),
        weatherImage: AssetImage('assets/hava_bulutlu.jpg'),
      );
    } else {
      //hava iyi
      //gece gündüz kontrolü

      var now = new DateTime.now();
      if (now.hour >= 19) {
        return WeatherDisplayData(
            weatherIcon:
                Icon(FontAwesomeIcons.moon, size: 75.0, color: Colors.white24),
            weatherImage: AssetImage('assets/gece.png'));
      } else {
        return WeatherDisplayData(
            weatherIcon:
                Icon(FontAwesomeIcons.sun, size: 75.0, color: Colors.white24),
            weatherImage: AssetImage('assets/gunesli.png'));
      }
    }
  }
}
