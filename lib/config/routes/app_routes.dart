import 'package:flutter/material.dart';
import 'package:weather_app/features/start_page/presentation/start_page.dart';

class AppRoutes {
  static const String start = '/';

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case start:
        return _materialRoute(const StartPage());
      default:
        return _materialRoute(const StartPage()); // Default route if none matches
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}