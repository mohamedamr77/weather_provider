
import 'package:flutter/material.dart';
import 'package:weatherappoprovider/data/mdoel/weatherModel.dart';
import 'package:weatherappoprovider/data/weateher_repo.dart';

import '../enum_variable.dart';

class WeatherProvider with ChangeNotifier{
  Status status= Status.initial ;
  WeatherModel? weatherModel;
  final WeatherRepo weatherRepo;
  Status get statusGetter => status;
  WeatherProvider({required this.weatherRepo,});

  fetchWeatherData({required String city,})async{
    status = Status.loading;
    notifyListeners();
    var result =await weatherRepo.fetchWeatherData(city: city);
    result.fold(
            (error){
              status = Status.failure;
              notifyListeners();
            }, (success){
              status =Status.success;
              weatherModel= success;
              notifyListeners();
    });
  }
}