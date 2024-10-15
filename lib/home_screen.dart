import 'package:flutter/material.dart';
import 'package:weatherappoprovider/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cairo",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 26 ,color: Colors.black),),
            Text("Home",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 26 ,color: Colors.black),),
           Text("Degree",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 26 ,color: Colors.black),),
           Text("enviroment",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 26 ,color: Colors.black),),

          ],
        ),
      ),
    );
  }
}
