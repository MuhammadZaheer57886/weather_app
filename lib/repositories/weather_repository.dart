import 'dart:developer';

import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_api_service.dart';

class WeatherRepository {
  final BaseApiService _apiService = BaseApiService();

  Future<Weather> fetchWeatherData(double lat, double lon) async {
    try {
      final response = await _apiService.getWeatherData(lat: lat, lon: lon);
      final data = response.data;
      log('Weather data: $response');
      final weather = Weather.fromJson(data);
      return weather;
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }
}
