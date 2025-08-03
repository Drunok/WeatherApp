import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/city_weather_info.dart';

abstract class CityWeatherInformationRepository {
  Future<Either<Failure, CityWeatherInfo>> getCityWeatherInfo(String cityName);
}