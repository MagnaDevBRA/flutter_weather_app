import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/date_formatter.dart' as formatter;

const String url = 'https://api.openweathermap.org/data/2.5/';
const String apiKey = 'SUA_CHAVE_QUI';
const String lang = 'pt_br';
const String units = 'metric';

class OpenWeatherService {
  Future<List<Map<String, dynamic>>> getCityCoordsByName(String city) async {
    try {
      final response = await http.get(Uri.parse(
          '${url}find?q=$city&appid=$apiKey&units=$units&lang=$lang'));
      final data = json.decode(response.body);
      if (data['cod'].toString() == '200') {
        List<Map<String, dynamic>> filteredList =
            data['list'].map<Map<String, dynamic>>((item) {
          return {
            "id": item["id"],
            "name": item["name"],
            "lat": item["coord"]["lat"],
            "lon": item["coord"]["lon"],
            "country": item["sys"]["country"],
          };
        }).toList();
        return filteredList;
      } else if (data['cod'].toString() == '404') {
        print('API returned an error: ${data["message"]}');
        return [];
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> getCityWeather(double lat, double lon) async {
    try {
      final response = await http.get(Uri.parse(
          '${url}weather?lat=$lat&lon=$lon&appid=$apiKey&units=$units&lang=$lang'));
      final data = json.decode(response.body);

      if (data['cod'].toString() == '200') {
        Map<String, dynamic> weatherData = {
          "city": data["name"],
          "country": data["sys"]["country"],
          "temp": data["main"]["temp"].round(),
          "icon": data["weather"][0]["icon"],
          "description": data["weather"][0]["description"],
          "feels_like": data["main"]["feels_like"].round(),
          "temp_min": data["main"]["temp_min"].floor(),
          "temp_max": data["main"]["temp_max"].ceil(),
          "humidity": data["main"]["humidity"],
          "wind_speed": data["wind"]["speed"],
          "sunrise": formatter.formateHour(data["sys"]["sunrise"]),
          "sunset": formatter.formateHour(data["sys"]["sunset"]),
        };
        return weatherData;
      } else {
        print('API returned an error: ${data["message"]}');
        return {};
      }
    } catch (e) {
      print("Erro ao carregar dados: $e");
      return {};
    }
  }

  Future<List<Map<String, dynamic>>> getCityForecast(
      double lat, double lon) async {
    try {
      final response = await http.get(Uri.parse(
          '${url}forecast?lat=$lat&lon=$lon&appid=$apiKey&units=$units&lang=$lang'));

      final data = json.decode(response.body);

      if (data['cod'].toString() == '200') {
        final List<dynamic> apiList = data['list'];
        final todayDate = formatter
            .formateDate(DateTime.now().toIso8601String().split('T')[0]);

        try {
          final List<Map<String, dynamic>> filteredList =
              apiList.map<Map<String, dynamic>>((item) {
            final dateString = item['dt_txt'].split(' ')[0];
            final formattedKey = formatter.formateDate(dateString);
            final newKey = (todayDate == formattedKey)
                ? 'Hoje'
                : '${formatter.formateWeekday(dateString)} - ${formatter.formateDate(dateString)}';

            return {
              'day': newKey,
              'hour': item['dt_txt'].split(' ')[1].substring(0, 5),
              'temp': item['main']['temp'].round(),
              'description': item['weather'][0]['description'],
              'icon': item['weather'][0]['icon'],
            };
          }).toList();

          return filteredList;
        } catch (e) {
          print('Error processing forecast data: $e');
          return [];
        }
      } else {
        print('API returned an error: ${data["message"]}');
        return [];
      }
    } catch (e) {
      print('Error fetching forecast: $e');
      return [];
    }
  }
}
