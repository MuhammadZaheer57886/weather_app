import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/utils/connectivity_util.dart';
import 'package:weather_app/widgets/weather_card.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isConnected = true;
  @override
  void initState() {
    super.initState();
    _checkConnectivity(); // Check connectivity when the screen is first displayed
  }
Future<void> _checkConnectivity() async {
  bool isConnected = await ConnectivityUtil.isInternetAvailable();
  setState(() {
    _isConnected = isConnected;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: _isConnected
          ? Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade200,
                    Colors.blue.shade400,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: WeatherCard(
                weather: _getWeather(),
              ),
            )
          : Center(
              child: Text(
                'Please check your internet connection.',
                style: TextStyle(fontSize: 18),
              ),
            ),
    );
  }

  // Dummy weather data (replace this with real data)
  Weather _getWeather() {
    return Weather(
      location: 'New York',
      temperature: 25,
      humidity: 50,
      windSpeed: 10,
      condition: 'Sunny',
    );
  }
}
