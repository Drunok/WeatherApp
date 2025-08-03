import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/injection_container.dart';

class Utilities {
   final SharedPreferences sharedPreferences = sl<SharedPreferences>();

   void saveCityName(String cityName) {
     sharedPreferences.setString('city_name', cityName);
   }

   void clearCityName() {
     sharedPreferences.remove('city_name');
   }

    String? getCityName() {
      return sharedPreferences.getString('city_name');
    }
}