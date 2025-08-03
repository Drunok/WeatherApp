part of 'city_weather_bloc.dart';

sealed class CityWeatherState extends Equatable {
  const CityWeatherState();
  
  @override
  List<Object> get props => [];
}

final class CityWeatherInitial extends CityWeatherState {}

final class CityWeatherLoading extends CityWeatherState {}

final class CityWeatherLoaded extends CityWeatherState {
  final CityWeatherInfo cityWeatherInfo;

  const CityWeatherLoaded(this.cityWeatherInfo);

  @override
  List<Object> get props => [cityWeatherInfo];
}

final class CityWeatherError extends CityWeatherState {}
