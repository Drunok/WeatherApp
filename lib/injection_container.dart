import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/features/city_weather/data/datasources/city_weather_info_remote_datasource.dart';
import 'package:weather_app/features/city_weather/data/repositories/city_weather_info_repository_impl.dart';
import 'package:weather_app/features/city_weather/domain/repositories/city_weather_information_repository.dart';
import 'package:weather_app/features/city_weather/domain/usecases/get_city_weather_info.dart';
import 'package:weather_app/features/city_weather/presentation/bloc/city_weather_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //! Feature - City Weather
  // Use Cases
  sl.registerLazySingleton(() => GetCityWeatherInfo(repository: sl()));

  // Repository
  sl.registerLazySingleton<CityWeatherInformationRepository>(() => CityWeatherInfoRepositoryImpl(
    remoteDatasource: sl(), 
    networkInfo: sl()
  ));

  // Data Sources
  sl.registerLazySingleton<CityWeatherInfoRemoteDatasource>(() => CityWeatherInfoRemoteDatasourceImpl());

  // Bloc
  sl.registerFactory(() => CityWeatherBloc(getCityWeatherInfo: sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

   sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  final internetConnection = InternetConnection();
  sl.registerLazySingleton(() => internetConnection);
}