import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weatherappoprovider/data/mdoel/weatherModel.dart';
import 'package:weatherappoprovider/data/weateher_repo.dart';
import 'package:weatherappoprovider/error/faliure.dart';
import 'package:weatherappoprovider/helper/api.dart';

class WeatherImplementRepo implements WeatherRepo{
  final Api api;
  WeatherImplementRepo({required this.api});
  @override
  Future<Either<Failure, WeatherModel>> fetchWeatherData({required String city}) async{
    try {
      var response =await  api.get(url: "http://api.weatherapi.com/v1/forecast.json?key=5541ba7213f1438f959123924242805&q=$city&days=7&aqi=no&alerts=no");
      WeatherModel weatherModel=WeatherModel.fromJson(response);
      debugPrint(weatherModel.toString());
      return right(weatherModel);
    } catch (e){ 
      debugPrint("error ${e.toString()}");
      return left(ServerFailure(message: e.toString()));
    }
  }

}