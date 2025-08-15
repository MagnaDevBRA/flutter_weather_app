import 'package:flutter/material.dart';

class WeatherList extends StatefulWidget {
  final List<Map<String, dynamic>> weatherList;

  const WeatherList({super.key, required this.weatherList});

  @override
  _WeatherListState createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xffafeeee),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: widget.weatherList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.weatherList[index];
          return Container (
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF001166),
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
              ))
            ),
            child: Text(
              "${item['day']}", 
              style: TextStyle(
                  color: Colors.white, 
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
              )
            ),
          );
        },
      ),  
    );
  }
}