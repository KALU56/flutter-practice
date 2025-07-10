import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  static const String apiKey = 'dd6307bc9310dfa77911c6ed52bd1638';
  static const String baseUrl = 'https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}';

  Future<Weather> fetchWeather(String city) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return Weather.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
