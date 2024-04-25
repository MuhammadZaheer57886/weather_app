import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;
  final String location;

  const WeatherCard({
    required this.weather,
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$location,',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildInfoItem('Temperature', '${weather.temperature}°C'),
                const SizedBox(width: 16),
                _buildInfoItem('Humidity', '${weather.humidity}%'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildInfoItem('Wind Speed', '${weather.windSpeed} m/s'),
                const SizedBox(width: 16),
                _buildInfoItem('Condition', weather.condition),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
