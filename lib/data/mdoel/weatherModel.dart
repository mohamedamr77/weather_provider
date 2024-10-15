class WeatherModel {
  final String city;
  final double maxTemperature;
  final double minTemperature;
  final DateTime updateAt;
  final String image;
  final double averageTemperature;
  final String conditionTemp;
  final List<HourlyForecast> hourlyForecast;
  final List<DailyForecast> dailyForecast;

  WeatherModel({
    required this.city,
    required this.maxTemperature,
    required this.minTemperature,
    required this.updateAt,
    required this.image,
    required this.averageTemperature,
    required this.conditionTemp,
    required this.hourlyForecast,
    required this.dailyForecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    List<HourlyForecast> hourlyList = [];
    List<DailyForecast> dailyList = [];

    // Parse hourly forecast for the first day
    for (var hour in json["forecast"]["forecastday"][0]["hour"]) {
      hourlyList.add(HourlyForecast.fromJson(hour));
    }

    // Parse daily forecast for 7 days
    for (var day in json["forecast"]["forecastday"]) {
      dailyList.add(DailyForecast.fromJson(day));
    }

    return WeatherModel(
      city: json["location"]["name"],
      maxTemperature: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemperature: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      updateAt: DateTime.parse(json["current"]["last_updated"]),
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      averageTemperature: json["forecast"]["forecastday"][0]["day"]
          ["avgtemp_c"],
      conditionTemp: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
      hourlyForecast: hourlyList,
      dailyForecast: dailyList,
    );
  }

  @override
  String toString() {
    return 'WeatherModel('
        'city: $city, '
        'maxTemperature: $maxTemperature,'
        ' minTemperature: $minTemperature,'
        ' updateAt: $updateAt,'
        ' image: $image,'
        ' averageTemperature: $averageTemperature,'
        ' conditionTemp: $conditionTemp,'
        ' hourlyForecast: $hourlyForecast,'
        ' dailyForecast: $dailyForecast ,)';
  }
}

class HourlyForecast {
  final DateTime time;
  final double temperature;
  final String image;

  HourlyForecast({
    required this.time,
    required this.temperature,
    required this.image,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    return HourlyForecast(
      time: DateTime.parse(json["time"]),
      temperature: json["temp_c"],
      image: json["condition"]["icon"],
    );
  }
}

class DailyForecast {
  final DateTime date;
  final double temperature;
  final String image;

  DailyForecast({
    required this.date,
    required this.temperature,
    required this.image,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: DateTime.parse(json["date"]),
      temperature: json["day"]["avgtemp_c"],
      image: json["day"]["condition"]["icon"],
    );
  }
}
