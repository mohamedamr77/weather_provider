import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:weatherappoprovider/enum_variable.dart';
import 'package:weatherappoprovider/provider/weather_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            title: const Text(
              "Search screen",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: Colors.white),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<WeatherProvider>(
                    builder: (context, value, child) {
                      return TextFormField(
                        onFieldSubmitted: (value) async {
                          await Provider.of<WeatherProvider>(context, listen: false).fetchWeatherData(city: value, context: context);
                          if (
                          Provider.of<WeatherProvider>(context, listen: false).statusGetter
                              == Status.success
                          ) {
                            Navigator.pop(context);
                          } else if (Provider.of<WeatherProvider>(context, listen: false).statusGetter == Status.failure) {
                            Fluttertoast.showToast(
                              msg: "Error Message ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          }
                        },

                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          hintText: "Write city",
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        if (context.watch<WeatherProvider>().statusGetter == Status.loading)
          Container(
            alignment: Alignment.center,
            color: Colors.black12,
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
      ],
    );
  }
}

/*
  if (Provider.of<WeatherProvider>(context, listen: false).status==Status.success){
                         Navigator.pop(context);
                       }

                      // if (Provider.of<WeatherProvider>(context, listen: false).status==Status.success){
                      //   Navigator.pop(context);
                      // } else if (Provider.of<WeatherProvider>(context, listen: false).status==Status.failure){
                      //   Fluttertoast.showToast(
                      //       msg: "This is Center Short Toast",
                      //       toastLength: Toast.LENGTH_SHORT,
                      //       gravity: ToastGravity.CENTER,
                      //       timeInSecForIosWeb: 1,
                      //       backgroundColor: Colors.red,
                      //       textColor: Colors.white,
                      //       fontSize: 16.0
                      //   );
                      // }
 */