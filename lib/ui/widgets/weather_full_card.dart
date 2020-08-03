import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/core/models/weather_response.dart';

class WeatherFullCard extends StatelessWidget {

  final WeatherResponse weatherDeets;

  static const BoxShadow _cardShadow = const BoxShadow(
    color: Color(0x4B73E394),
    offset: Offset(1, 2),
    spreadRadius: 3,
    blurRadius: 20,
  );

  const WeatherFullCard({Key key, @required this.weatherDeets}) : super(key: key);

  String _iconUrl(String code) {
    return 'http://openweathermap.org/img/wn/$code@2x.png';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [_cardShadow],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.location_on),
                    SizedBox(width: 2),
                    Text(
                      '${weatherDeets.name}, ${weatherDeets.sys.country}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: CachedNetworkImage(
                        imageUrl: _iconUrl(weatherDeets.weather.first.icon),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      weatherDeets.weather.first.main,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      weatherDeets.weather.first.description,
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '${weatherDeets.main.temp.toStringAsPrecision(3)}°C',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Feels like ${weatherDeets.main.feelsLike.toStringAsPrecision(3)}°',
                      textAlign: TextAlign.right,
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 24,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: <Widget>[
                      SvgPicture.asset('assets/icons/wind.svg'),
                      Text('${weatherDeets.wind.speed.toStringAsPrecision(3)}m/s'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/drop.svg'),
                    Text('${weatherDeets.main.humidity}%'),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    children: <Widget>[
                      SvgPicture.asset('assets/icons/umbrella.svg'),
                      Text('${weatherDeets.clouds.all}%'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
