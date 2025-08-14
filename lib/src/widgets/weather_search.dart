import 'package:flutter/material.dart';
import '../services/open_weather_api.dart';

class WeatherSearch extends StatefulWidget {
  Map<String, dynamic> coords = {};

  WeatherSearch({Key? key, this.coords = const {}}) : super(key: key);
  @override
  _WeatherSearchState createState() => _WeatherSearchState();
}

class _WeatherSearchState extends State<WeatherSearch> {
  List<Map<String, dynamic>> _cityData = [];
  TextEditingController _controller = TextEditingController();
  final OpenWeatherService _weatherService = OpenWeatherService();

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchData(city) async {
    print("Buscando dados da cidade: $city");
    try {
      List<Map<String, dynamic>> data =
          await _weatherService.getCityCoordsByName(city);
      print("Dados da cidade: $data");
      setState(() {
        _cityData = data;
      });
    } catch (e) {
      print("Erro ao carregar dados: $e");
    }
  }

  void handleItemTap(Map<String, dynamic> item) {
    print("Item clicado: ${item['name']}, ${item['country']}");
    _controller.text = "";
    setState(() {
      _cityData = [];
    });
    widget.coords = {
      "lat": item['lat'],
      "lon": item['lon'],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Pesquisar cidade",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => fetchData(value),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _cityData.length,
                itemBuilder: (context, index) {
                  final item = _cityData[index];
                  return ListTile(
                    title: Text("${item['name']}, ${item['country']}"),
                    subtitle: Text("Lat: ${item['lat']} | Lon: ${item['lon']}"),
                    onTap: () => {
                      handleItemTap(item),
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
