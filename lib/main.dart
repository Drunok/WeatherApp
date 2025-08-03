import 'package:flutter/material.dart';
import 'package:weather_app/config/routes/app_routes.dart';

import 'features/start_page/presentation/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      title: 'Weather App',
      home: StartPage()
    );
  }
}