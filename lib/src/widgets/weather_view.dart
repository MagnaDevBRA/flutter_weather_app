import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import '../services/open_weather_api.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key, required this.coords});
  // coords = { lat: lat, lon: lon }
  final Map<String, dynamic> coords;

  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final OpenWeatherService _weatherService = OpenWeatherService();
  Map<String, dynamic> _weatherData = {
    "city": "",
    "country": "",
    "temp": 0,
    "feels_like": 0,
    "temp_min": 0,
    "temp_max": 0,
    "humidity": 0,
    "description": "",
    "icon": "03d",
    "wind_speed": 0,
    "sunrise": "05:30",
    "sunset": "17:30",
    "timezone": "",
  };

  @override
  void initState() {
    super.initState();
    if(widget.coords.isNotEmpty) fetchData(widget.coords);
  }

  Future<void> fetchData(coords) async {
    try {
      Map<String, dynamic> data =
          await _weatherService.getCityWeather(coords.lat, coords.lon);
      setState(() {
        _weatherData = data;
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
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              spacing: 10,
              children: [
                Icon(Entypo.location, color: Colors.black, size: 20),
                Text("${_weatherData['city']}, ${_weatherData['country']}", style: TextStyle(fontSize: 20)),
              ],
            )
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${_weatherData['temp']}", style: TextStyle(fontSize: 60)),
                Image.network("https://openweathermap.org/img/wn/${_weatherData['icon']}@2x.png", width: 80, height: 80),
                Text("${_weatherData['description']}", style: TextStyle(fontSize: 20)),
              ],
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            alignment: Alignment.center,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Text("Sensação térmica: ${_weatherData['feels_like']}°C"),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Row(
              spacing: 10,
              children: [
                Icon(FontAwesome5.long_arrow_alt_down, color: Colors.black, size: 18),
                Text("${_weatherData['temp_min']}°C"),
                Icon(FontAwesome5.long_arrow_alt_up, color: Colors.black, size: 18),
                Text("${_weatherData['temp_max']}°C"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Row(
              spacing: 10,
              children: [
                Icon(Entypo.droplet, color: Colors.black, size: 18),
                Text("${_weatherData['humidity']}%"),
                Icon(FontAwesome5.wind, color: Colors.black, size: 18),
                Text("${_weatherData['wind_speed']} m/s"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Row(
              spacing: 10,
              children: [
                Icon(Meteocons.sunrise, color: Colors.black, size: 18),
                Text(_weatherData['sunrise']),
                Icon(Meteocons.fog_sun, color: Colors.black, size: 18),
                Text(_weatherData['sunset']),
              ],
            ),
          ),
        ],
      )
    );
  }
}