import 'package:equatable/equatable.dart';

class CityWeatherInfo extends Equatable {
  final String cityName;
  final String regionName;
  final String countryName;
  final DateTime date;
  // Weather condition description
  final DateTime lastUpdated;
  final double temperatureC;
  final double temperatureF;
  final bool isDay;
  final String weatherCondition;

  const CityWeatherInfo({
    required this.cityName, 
    required this.regionName, 
    required this.countryName, 
    required this.date, 
    required this.lastUpdated, 
    required this.temperatureC, 
    required this.temperatureF, 
    required this.isDay, 
    required this.weatherCondition
  });
  
  @override
  List<Object?> get props => [
    cityName,
    regionName,
    countryName,
    date,
    lastUpdated,
    temperatureC,
    temperatureF,
    isDay,
    weatherCondition
  ];
}