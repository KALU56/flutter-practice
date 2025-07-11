import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/Weather_service.dart.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _cityController = TextEditingController();
  WeatherService weatherService = WeatherService('5ba0bafa75ce5149ad7eb373644d1dff');
  Weather? _weather;
  bool _isLoading = false;

  void fetchWeather() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final weather = await weatherService.getWeather(_cityController.text);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print('Error fetching weather: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to load weather")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🌤️ Weather App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: "Enter city name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: fetchWeather,
              child: const Text("Get Weather"),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : _weather != null
                    ? Column(
                        children: [
                          Text(
                            _weather!.cityName,
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${_weather!.temperature.toStringAsFixed(1)}°C",
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _weather!.mainCondition,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      )
                    : const Text("No data"),
          ],
        ),
      ),
    );
  }
}
