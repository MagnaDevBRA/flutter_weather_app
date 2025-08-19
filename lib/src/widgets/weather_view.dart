import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';

class WeatherView extends StatefulWidget {
  final Map<String, dynamic> weatherData;

  const WeatherView({super.key, required this.weatherData});

  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                Icon(Entypo.location, color: Colors.black, size: 18),
                Text("${widget.weatherData['city']}, ${widget.weatherData['country']}", style: TextStyle(fontSize: 18)),
              ],
            )
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text("${widget.weatherData['temp']}°C", style: TextStyle(fontSize: 50)),
                Image.network("https://openweathermap.org/img/wn/${widget.weatherData['icon']}@2x.png", width: 70, height: 70),
                Text("${widget.weatherData['description']}", style: TextStyle(fontSize: 20)),
              ],
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            alignment: Alignment.center,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Text("Sensação térmica: ${widget.weatherData['feels_like']}°C"),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Row(
              spacing: 110,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Icon(FontAwesome5.long_arrow_alt_down, color: Colors.black, size: 18),
                    Text("${widget.weatherData['temp_min']}°C"),
                ]),
                Row(
                  spacing: 5,
                  children: [
                    Icon(FontAwesome5.long_arrow_alt_up, color: Colors.black, size: 18),
                    Text("${widget.weatherData['temp_max']}°C")
                ])
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 10, 0),
            child: Row(
              spacing: 110,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Icon(Entypo.droplet, color: Colors.black, size: 18),
                    Text("${widget.weatherData['humidity']}%"),
                ]),
                Row(
                  spacing: 5,
                  children: [
                    Icon(FontAwesome5.wind, color: Colors.black, size: 18),
                    Text("${widget.weatherData['wind_speed']} m/s"),
                ]) 
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Row(
              spacing: 110,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Icon(Meteocons.sunrise, color: Colors.black, size: 18),
                    Text(widget.weatherData['sunrise']),
                ],),
                Row(
                  spacing: 5,
                  children: [
                    Icon(Meteocons.fog_sun, color: Colors.black, size: 18),
                    Text(widget.weatherData['sunset']),
                ],)
                
              ],
            ),
          ),
        ],
      )
    );
  }
}