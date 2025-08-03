import 'package:flutter/material.dart';
import 'package:weather_app/features/city_selection/presentation/pages/city_selection.dart';
import 'package:weather_app/features/city_weather/presentation/pages/city_weather_page.dart';
import 'package:weather_app/features/start_page/presentation/pages/start_page.dart';

class AppRoutes {
  static const String start = '/start';
  static const String citySelection = '/city-selection';
  static const String cityWeather = '/city-weather';

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case start:
        return _materialRoute(const StartPage());
      case citySelection:
        return _materialRoute(CitySelection());
      case cityWeather:
        return _materialRoute(WeatherPage());
      default:
        return _materialRoute(const StartPage()); // Default route if none matches
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}