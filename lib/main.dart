import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether_api_search/screen/search_screen/search.dart';
import 'package:wether_api_search/screen/splash/splash_screen.dart';
import 'package:wether_api_search/screen/weather/view/weather_screen.dart';

import 'screen/weather/provider/weather_provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherScreenProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplseScreen (),
          'weather': (context) => const weatherScreen(),
          'add': (context) => const AddData(),
        },
      ),
    ),
  );
}