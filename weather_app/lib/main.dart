import 'package:flutter/material.dart';
import 'weather_service.dart';
import 'weather_model.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _controller = TextEditingController();
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  String? _error;

  void _searchWeather() async {
    setState(() {
      _error = null;
      _weather = null;
    });

    try {
      final weather = await _weatherService.fetchWeather(_controller.text);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      setState(() {
        _error = 'City not found. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🌤️ Weather App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchWeather,
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_weather != null)
              Column(
                children: [
                  Text(
                    _weather!.cityName,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${_weather!.temperature}°C',
                    style: const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _weather!.description,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            if (_error != null)
              Text(
                _error!,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
