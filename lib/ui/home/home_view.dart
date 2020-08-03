import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/core/services/fetch_weather_details.dart';
import 'package:weather/ui/widgets/home_appbar.dart';
import 'package:weather/ui/widgets/weather_full_card.dart';

// blue 2598B2, light green 73E394, red 73E394, shadow 73E394 30%

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: FutureBuilder(
        future: GetIt.I<WeatherService>().getWeatherDeets(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30,),
              itemBuilder: (context, index) =>
                  WeatherFullCard(weatherDeets: snapshot.data[index]),
              itemCount: snapshot.data.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20);
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30,),
      //     child: Column(
      //       children: <Widget>[
      //         WeatherFullCard(),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
