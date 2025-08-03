import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/city_weather_info.dart';
import '../../domain/repositories/city_weather_information_repository.dart';
import '../datasources/city_weather_info_remote_datasource.dart';

class CityWeatherInfoRepositoryImpl implements CityWeatherInformationRepository{

  final CityWeatherInfoRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  CityWeatherInfoRepositoryImpl({
    required this.remoteDatasource, 
    required this.networkInfo
  });

  @override
  Future<Either<Failure, CityWeatherInfo>> getCityWeatherInfo(String cityName) async {
    if (await networkInfo.isConnected) {
      try {
        final cityWeatherInfo = await remoteDatasource.getCityWeatherInfo(cityName);
        return Right(cityWeatherInfo);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(UnknownFailure());
    }
  }

}