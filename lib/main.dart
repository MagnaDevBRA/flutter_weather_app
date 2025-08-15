import 'package:flutter/material.dart';
import 'src/widgets/weather_list.dart';
import 'src/widgets/weather_search.dart';
import 'src/widgets/weather_view.dart';
import './src/services/open_weather_api.dart';

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


// Classe para construir o corpo da aplicação
class MyBody extends StatefulWidget {
  const MyBody({super.key});

  @override
  State<MyBody> createState() => _MyBodyState();
}


class _MyBodyState extends State<MyBody> {
  Map<String, dynamic> coords =  {};
  Map<String, dynamic> _weatherData = {};
  List<Map<String, dynamic>> _weatherList = [];
  final OpenWeatherService _weatherService = OpenWeatherService();


  void updateCoords(Map<String, dynamic> newCoords) {
    setState(() {
      coords = newCoords;
    });

    print("Atualizou o widget");
    if(coords.isNotEmpty) fetchDataView(coords);
    if(coords.isNotEmpty) fetchDataList(coords);
    print("Fim da atualização");
  }

  Future<void> fetchDataView(coords) async {
    try {
      print("Coordenadas view: $coords");
      print("lat: ${coords['lat']}, lon: ${coords['lon']}");
      double lat = coords['lat'];
      double lon = coords['lon'];
      Map<String, dynamic> data =
          await _weatherService.getCityWeather(lat, lon);
      print("Dados view: $data");
      setState(() {
        _weatherData = data;
      });
    } catch (e) {
      print("Erro ao carregar dados da view: $e");
    }
  }

  Future<void> fetchDataList(coords) async {
    try {
      List<Map<String, dynamic>> data = await _weatherService.getCityForecast(coords['lat'], coords['lon']);
      setState(() {
        _weatherList = data;
      });
    } catch (e) {
      print("Erro ao carregar dados: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          WeatherSearch(onValueChanged: updateCoords),
          if(_weatherData.isNotEmpty) WeatherView(weatherData: _weatherData),
          // if(coords.isNotEmpty) WeatherList(coords: coords),
        ],
    );
  }
}