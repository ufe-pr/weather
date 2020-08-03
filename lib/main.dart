import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/ui/home/home_view.dart';

import 'core/services/fetch_weather_details.dart';

void main() {
  GetIt.I.registerLazySingleton<WeatherService>(() => WeatherService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
    );
  }
}
