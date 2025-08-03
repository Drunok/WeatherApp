import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utilities.dart';
import 'package:weather_app/features/city_weather/domain/entities/city_weather_info.dart';
import 'package:weather_app/features/city_weather/presentation/bloc/city_weather_bloc.dart';
import 'package:weather_app/injection_container.dart';// Asegúrate de importar tu modelo

class WeatherPage extends StatefulWidget {
  
  WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final Utilities utilities = Utilities();
  @override
  Widget build(BuildContext context) {    

    final departmentName = utilities.getCityName() ?? 'New York'; 

    return BlocProvider(
      create: (context) => sl<CityWeatherBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Clima de tu ciudad'),
        ),
        body: BlocBuilder<CityWeatherBloc, CityWeatherState>(
          builder: (context, state) {
            if (state is CityWeatherInitial) {
              // Disparar el evento para cargar el clima de una ciudad por defecto
              BlocProvider.of<CityWeatherBloc>(context).add(GetCityWeatherInfoEvent(departmentName));
            }
            if (state is CityWeatherLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CityWeatherError) {
              return Center(child: Text('Error loading weather data.'));
            } else if (state is CityWeatherLoaded) {
              return buildWeatherInfo(state.cityWeatherInfo);
            }
            return Center(child: Text('Select a city.'));
          },
        ),
      ),
    );
  }

  // Widget para construir la UI del clima cuando los datos se cargan correctamente
  Widget buildWeatherInfo(CityWeatherInfo weatherInfo) {
    // print(weatherInfo.weatherCondition);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nombre de la ciudad y fecha
          Text(
            weatherInfo.cityName,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            'Fecha actual: ${weatherInfo.date.toLocal()}',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),

          // Condición del clima (por ejemplo, soleado, nublado, etc.)
          
          Image.asset(getWeatherIcon(weatherInfo.weatherCondition)),
          const SizedBox(height: 20),

          // Temperatura
          Text(
            'Temperatura actual: ${weatherInfo.temperatureC}°C',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Se siente como: ${weatherInfo.temperatureF}°F',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),          
        ],
      ),
    );
  }

  // Función para mostrar el ícono basado en el estado del clima
  String getWeatherIcon(String condition) {
    if (condition == 'sunny') {
      return 'assets/images/sunny.png';
    } else if (condition == 'cloudy') {
      return 'assets/images/cloudy.png';
    } else if (condition == 'rainy') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/default.png';
    }
  }

  // Widget para la información adicional (viento, humedad, etc.)
  Widget _buildInfoColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        Text(
          value,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
