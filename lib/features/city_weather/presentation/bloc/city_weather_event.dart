part of 'city_weather_bloc.dart';

sealed class CityWeatherEvent extends Equatable {
  const CityWeatherEvent();

  @override
  List<Object> get props => [];
}

class GetCityWeatherInfoEvent extends CityWeatherEvent {
  final String cityName;

  const GetCityWeatherInfoEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}
