import 'package:weather_app/features/city_weather/domain/entities/city_weather_info.dart';

class CityWeatherInfoModel extends CityWeatherInfo{
  const CityWeatherInfoModel({
    required super.cityName, 
    required super.regionName, 
    required super.countryName, 
    required super.date, 
    required super.lastUpdated, 
    required super.temperatureC, 
    required super.temperatureF, 
    required super.isDay, 
    required super.weatherCondition
  });

  factory CityWeatherInfoModel.fromJson(Map<String, dynamic> json) {
    return CityWeatherInfoModel(
      cityName: json['location']['name'],
      regionName: json['location']['region'],
      countryName: json['location']['country'],
      date: DateTime.parse(json['location']['localtime']),
      lastUpdated: DateTime.parse(json['current']['last_updated']),
      temperatureC: json['current']['temp_c'].toDouble(),
      temperatureF: json['current']['temp_f'].toDouble(),
      isDay: json['current']['is_day'] == 1,
      weatherCondition: json['current']['condition']['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': cityName,
      'region': regionName,
      'country': countryName,
      'localtime': date.toIso8601String(),
      'last_updated': lastUpdated.toIso8601String(),
      'temp_c': temperatureC,
      'temp_f': temperatureF,
      'is_day': isDay ? 1 : 0,
      'condition': {'text': weatherCondition},
    };
  }

}
