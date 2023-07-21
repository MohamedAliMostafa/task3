import 'package:flutter/material.dart';
import 'package:task3/Screen/Market.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PetMarket.RouteName,
      routes: {
        PetMarket.RouteName:(context)=>PetMarket()

      },
    );
  }
}