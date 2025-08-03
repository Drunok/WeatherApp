import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/features/city_weather/domain/entities/city_weather_info.dart';
import 'package:weather_app/features/city_weather/domain/usecases/get_city_weather_info.dart' as get_city_weather_info;

part 'city_weather_event.dart';
part 'city_weather_state.dart';

class CityWeatherBloc extends Bloc<CityWeatherEvent, CityWeatherState> {

  final get_city_weather_info.GetCityWeatherInfo getCityWeatherInfo;
  CityWeatherBloc({required this.getCityWeatherInfo}) : super(CityWeatherInitial()) {
    on<GetCityWeatherInfoEvent>((event, emit) async {
      emit(CityWeatherLoading());
      print('ejecutandose el bloc antes de result');
      final result = await getCityWeatherInfo.call(get_city_weather_info.Params(cityName: event.cityName));
      result.fold(
        (failure) => emit(CityWeatherError()),
        (weatherInfo) => emit(CityWeatherLoaded(weatherInfo)),
      );
    });
  }
}
