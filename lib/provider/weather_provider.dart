import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weatherappoprovider/data/mdoel/weatherModel.dart';
import 'package:weatherappoprovider/data/weateher_repo.dart';

import '../enum_variable.dart';

class WeatherProvider with ChangeNotifier {
  Status _status = Status.initial;
  WeatherModel? weatherModel;
  final WeatherRepo weatherRepo;
  Status get statusGetter => _status;
  WeatherProvider({
    required this.weatherRepo,
  });

  fetchWeatherData(
      {required String city, required BuildContext context}) async {
    _status = Status.loading;
    notifyListeners();
    var result = await weatherRepo.fetchWeatherData(city: city);
    result.fold((error) {
      _status = Status.failure;
      notifyListeners();
      // Fluttertoast.showToast(
      //     msg: error.message,
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );
    }, (success) {
      _status = Status.success;
      weatherModel = success;
      notifyListeners();
      // if (status ==Status.success){
      //   Navigator.pop(context);
      // }
    });
  }
}
