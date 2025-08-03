import 'dart:convert'; // Asegúrate de importar jsonDecode
import 'package:weather_app/features/city_weather/data/models/city_weather_info_model.dart';
import 'package:http/http.dart' as http;

abstract class CityWeatherInfoRemoteDatasource {
  Future<CityWeatherInfoModel> getCityWeatherInfo(String cityName);
}

class CityWeatherInfoRemoteDatasourceImpl implements CityWeatherInfoRemoteDatasource {
  @override
  Future<CityWeatherInfoModel> getCityWeatherInfo(String cityName) async {
    // print('Fetching weather info for $cityName');
    final apiKey = 'd6137fef665e4694941135215250208';
    final url = 'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName';

    // Hacemos la solicitud HTTP
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      print('Response for $cityName: $json');

      String conditionText = json['current']['condition']['text'];
      print('Condition text for $cityName: $conditionText');
      // Convertimos el texto a un formato más genérico (sunny, cloudy, rainy)
      String weatherCondition = getWeatherCondition(conditionText);
      json['current']['condition']['text'] = weatherCondition;
      // print('Weather condition for $cityName: $weatherCondition');
      return CityWeatherInfoModel.fromJson(json);
    } else {
      throw Exception('Failed to load weather info for $cityName');
    }
  }

  // Función para obtener el estado genérico del clima
  String getWeatherCondition(String conditionText) {
    String condition = conditionText.toLowerCase();
  
    // Comprobar si el texto contiene alguna de las palabras clave
    if (condition.contains('cloudy')) {
      return 'cloudy';
    } else if (condition.contains('sunny')) {
      return 'sunny';
    } else if (condition.contains('rainy')) {
      return 'rainy';
    } else {
      return 'unknown';
    }
  }
}
