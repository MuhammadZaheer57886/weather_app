class Weather {
 final double temperature;
 final int humidity;
 final double windSpeed;
 final String condition;

 Weather({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.condition,
 });

 factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['temperature'].toDouble(),
      humidity: json['humidity'].toInt(),
      windSpeed: json['windSpeed'].toDouble(),
      condition: json['condition'],
    );
 }
}
