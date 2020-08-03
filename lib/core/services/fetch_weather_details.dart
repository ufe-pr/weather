import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/core/models/weather_response.dart';
import 'package:geolocator/geolocator.dart';

const String API_KEY = '35517307d96a42fa9b37f27371261c80';

class WeatherService {
  static http.Client _netClient = http.Client();

  Future<List<WeatherResponse>> getWeatherDeets() async {
                print('Here');
Position position = await Geolocator().getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
                print('Here');
        if (position == null) position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        print('Here');
    var reqUrlToSend =
        "https://api.openweathermap.org/data/2.5/find?lat=${position.latitude}&lon=${position.longitude}&units=metric&cnt=20&appid=$API_KEY";
    var response = await _netClient.get(reqUrlToSend);
    var decoded = json
            .decode(response.body);
            print(decoded);
        List<WeatherResponse> results = decoded['list'].map<WeatherResponse>((item) => WeatherResponse.fromJson(item)).toList();
    return results;
  }
}

// https://api.openweathermap.org/data/2.5/find?lat=${user_latitude}&lon=${user_longitude}&cnt=20&appid=${API_KEY}
