import 'package:dartz/dartz.dart';
import 'package:weatherappoprovider/data/mdoel/weatherModel.dart';

import '../error/faliure.dart';

abstract class WeatherRepo{
   Future<Either<Failure,WeatherModel>> fetchWeatherData({required String city});
}