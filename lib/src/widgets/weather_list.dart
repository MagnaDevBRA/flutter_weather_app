import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import '../services/open_weather_api.dart';

class WeatherList extends StatefulWidget {
  const WeatherList({super.key, required this.coords});
  // coords = { lat: lat, lon: lon }
  final Map<String, dynamic> coords;

  @override
  _WeatherListState createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  final OpenWeatherService _weatherService = OpenWeatherService();
  List<Map<String, dynamic>> _weatherList = [];

  @override
  void initState() {
    super.initState();
    if(widget.coords.isNotEmpty) fetchData(widget.coords);
  }

  Future<void> fetchData(coords) async {
    try {
      List<Map<String, dynamic>> data = await _weatherService.getCityForecast(coords.lat, coords.lon);
      setState(() {
        _weatherList = data;
      });
    } catch (e) {
      print("Erro ao carregar dados: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        color: Color(0xffafeeee),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column (
        children: [
        ],
      )
    );
  }
}