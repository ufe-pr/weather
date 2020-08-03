import 'dart:convert';

class WeatherResponse {
    WeatherResponse({
        this.coord,
        this.weather,
        this.base,
        this.main,
        this.visibility,
        this.wind,
        this.clouds,
        this.dt,
        this.sys,
        this.timezone,
        this.id,
        this.name,
        this.cod,
    });

    final Coord coord;
    final List<Weather> weather;
    final String base;
    final Main main;
    final int visibility;
    final Wind wind;
    final Clouds clouds;
    final int dt;
    final Sys sys;
    final int timezone;
    final int id;
    final String name;
    final int cod;

    factory WeatherResponse.fromRawJson(String str) => WeatherResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WeatherResponse.fromJson(Map<String, dynamic> json) => WeatherResponse(
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        weather: json["weather"] == null ? null : List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        base: json["base"] == null ? null : json["base"],
        main: json["main"] == null ? null : Main.fromJson(json["main"]),
        visibility: json["visibility"] == null ? null : json["visibility"],
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        dt: json["dt"] == null ? null : json["dt"],
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        timezone: json["timezone"] == null ? null : json["timezone"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        cod: json["cod"] == null ? null : json["cod"],
    );

    Map<String, dynamic> toJson() => {
        "coord": coord == null ? null : coord.toJson(),
        "weather": weather == null ? null : List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base == null ? null : base,
        "main": main == null ? null : main.toJson(),
        "visibility": visibility == null ? null : visibility,
        "wind": wind == null ? null : wind.toJson(),
        "clouds": clouds == null ? null : clouds.toJson(),
        "dt": dt == null ? null : dt,
        "sys": sys == null ? null : sys.toJson(),
        "timezone": timezone == null ? null : timezone,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "cod": cod == null ? null : cod,
    };
}

class Clouds {
    Clouds({
        this.all,
    });

    final int all;

    factory Clouds.fromRawJson(String str) => Clouds.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"] == null ? null : json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all == null ? null : all,
    };
}

class Coord {
    Coord({
        this.lon,
        this.lat,
    });

    final double lon;
    final double lat;

    factory Coord.fromRawJson(String str) => Coord.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lon": lon == null ? null : lon,
        "lat": lat == null ? null : lat,
    };
}

class Main {
    Main({
        this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.humidity,
    });

    final double temp;
    final double feelsLike;
    final double tempMin;
    final double tempMax;
    final int pressure;
    final int humidity;

    factory Main.fromRawJson(String str) => Main.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"] == null ? null : json["temp"].toDouble(),
        feelsLike: json["feels_like"] == null ? null : json["feels_like"].toDouble(),
        tempMin: json["temp_min"] == null ? null : json["temp_min"].toDouble(),
        tempMax: json["temp_max"] == null ? null : json["temp_max"].toDouble(),
        pressure: json["pressure"] == null ? null : json["pressure"],
        humidity: json["humidity"] == null ? null : json["humidity"],
    );

    Map<String, dynamic> toJson() => {
        "temp": temp == null ? null : temp,
        "feels_like": feelsLike == null ? null : feelsLike,
        "temp_min": tempMin == null ? null : tempMin,
        "temp_max": tempMax == null ? null : tempMax,
        "pressure": pressure == null ? null : pressure,
        "humidity": humidity == null ? null : humidity,
    };
}

class Sys {
    Sys({
        this.type,
        this.id,
        this.message,
        this.country,
        this.sunrise,
        this.sunset,
    });

    final int type;
    final int id;
    final double message;
    final String country;
    final int sunrise;
    final int sunset;

    factory Sys.fromRawJson(String str) => Sys.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"] == null ? null : json["type"],
        id: json["id"] == null ? null : json["id"],
        message: json["message"] == null ? null : json["message"].toDouble(),
        country: json["country"] == null ? null : json["country"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "id": id == null ? null : id,
        "message": message == null ? null : message,
        "country": country == null ? null : country,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
    };
}

class Weather {
    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    final int id;
    final String main;
    final String description;
    final String icon;

    factory Weather.fromRawJson(String str) => Weather.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"] == null ? null : json["id"],
        main: json["main"] == null ? null : json["main"],
        description: json["description"] == null ? null : json["description"],
        icon: json["icon"] == null ? null : json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "main": main == null ? null : main,
        "description": description == null ? null : description,
        "icon": icon == null ? null : icon,
    };
}

class Wind {
    Wind({
        this.speed,
        this.deg,
    });

    final double speed;
    final int deg;

    factory Wind.fromRawJson(String str) => Wind.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"] == null ? null : json["speed"].toDouble(),
        deg: json["deg"] == null ? null : json["deg"],
    );

    Map<String, dynamic> toJson() => {
        "speed": speed == null ? null : speed,
        "deg": deg == null ? null : deg,
    };
}
