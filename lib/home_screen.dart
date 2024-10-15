import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherappoprovider/data/mdoel/weatherModel.dart';
import 'package:weatherappoprovider/enum_variable.dart';
import 'package:weatherappoprovider/provider/weather_provider.dart';
import 'package:weatherappoprovider/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel=Provider.of<WeatherProvider>(context).weatherModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 26 ,color: Colors.white),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder:
                (context) {
              return const SearchScreen();
            },));
          }, icon: const Icon(Icons.search,color: Colors.white,))
        ],
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weatherModel?.city??"sa",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 26 ,color: Colors.black),),
             Text(weatherModel?.conditionTemp??"",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 26 ,color: Colors.black),),
             Text(weatherModel?.maxTemperature.toString()??"",style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 26 ,color: Colors.black),),
          ],
        ),
      ),
    );
  }
}
