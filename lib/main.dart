import 'package:flutter/material.dart';
import 'package:weather_app/config/routes/app_routes.dart';
import 'package:weather_app/injection_container.dart' as dependencies;

import 'features/start_page/presentation/pages/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
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