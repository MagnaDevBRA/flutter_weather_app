import 'package:flutter/material.dart';
import 'src/widgets/weather_list.dart';
import 'src/widgets/weather_search.dart';
import 'src/widgets/weather_view.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Weather App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Previsão do Tempo",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Roboto",
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  final Map<String, dynamic> coords =  const {};
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          WeatherSearch(),
          if(coords.isNotEmpty) WeatherView(coords: coords),
          if(coords.isNotEmpty) WeatherList(coords: coords),
        ],
      );
  }
}