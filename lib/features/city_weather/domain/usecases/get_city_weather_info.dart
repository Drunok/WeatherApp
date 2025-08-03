import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/city_weather_info.dart';
import '../repositories/city_weather_information_repository.dart';

class GetCityWeatherInfo implements UseCase<CityWeatherInfo, Params>{

  final CityWeatherInformationRepository repository;

  GetCityWeatherInfo({required this.repository});

  @override
  Future<Either<Failure, CityWeatherInfo>> call(Params params) async {
    return await repository.getCityWeatherInfo(params.cityName);
  }

}

class Params {
  final String cityName;

  Params({required this.cityName});

  List<Object> get props => [cityName];
}