import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

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
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
        height: 200,
        decoration: BoxDecoration(
          color: Color(0xffafeeee),
          borderRadius: BorderRadius.circular(20),
        ),
        child: GroupedListView<Map<String, dynamic>, String>(
          elements: widget.weatherList,
          groupBy: (item) => item['day'],
          sort: false,
          groupSeparatorBuilder: (String day) => Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xFF001166),
                border: Border(
                    bottom: BorderSide(
                  width: 1.0,
                ))),
            child: Text(day,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
          itemBuilder: (context, Map<String, dynamic> item) {
            return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: const Color(0xFFcccccc),
                    )
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${item['hour']}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("${item['temp']}°C",
                          style: TextStyle(
                            fontSize: 14,
                          )),
                      Text("${item['description']}",
                          style: TextStyle(
                            fontSize: 14,
                          )),
                      Image.network(
                          "https://openweathermap.org/img/wn/${item['icon']}@2x.png",
                          width: 40,
                          height: 40),
                    ]));
          },
        ));
  }
}
