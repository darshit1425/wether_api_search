import 'package:flutter/cupertino.dart';
import 'package:wether_api_search/screen/weather/model/weather_model.dart';
import 'package:wether_api_search/utils/api_helper.dart';

class WeatherScreenProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  WeatherModel? weatherModel;


  String Name = "Surat";
  TextEditingController txtcityname = TextEditingController();

  void changeData(String name){
    Name = name;
    notifyListeners();
  }


  Future<WeatherModel?> weatherData(String name) async {
    weatherModel = await apiHelper.WeatherApiCall(name);
    return weatherModel;
  }
}