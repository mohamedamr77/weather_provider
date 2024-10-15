import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherappoprovider/data/wather_implement.dart';
import 'package:weatherappoprovider/helper/api.dart';
import 'package:weatherappoprovider/provider/weather_provider.dart';

import 'home_screen.dart';

void main(){
  runApp( ChangeNotifierProvider(create: (BuildContext context) {
    return WeatherProvider(weatherRepo: WeatherImplementRepo(api: Api()));
  },
  child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,

        )
      ),
    );
  }
}
