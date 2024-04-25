import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/location_service.dart';
import 'package:weather_app/utils/connectivity_util.dart';
import 'package:weather_app/widgets/custom_searchfield.dart';
import 'package:weather_app/widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;

  bool _isConnected = true;
  final TextEditingController _searchController = TextEditingController();
  final LocationService _locationService = LocationService();
  String _location = 'Loading...';
  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      Position position = await _locationService.getCurrentLocation();
      String cityName = await _locationService.getCityNameFromLatLng(position);
      setState(() {
        _location = cityName;
      });
    } catch (e) {
      log("Error getting location: $e");
      setState(() {
        _location = 'Unable to get location';
      });
    }
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
        title: _isSearching
            ? CustomSearchTextField(
                controller: _searchController,
              )
            : const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Your current location:\n$_location'),
                  WeatherCard(
                    location: _location,
                    weather: _getWeather(),
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Please check your internet connection.',
                  style: TextStyle(fontSize: 18),
                ),
                ElevatedButton.icon(
                  onPressed: _checkConnectivity,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Refresh'),
                ),
              ],
            ),
    );
  }

  Weather _getWeather() {
    return Weather(
      temperature: 25,
      humidity: 50,
      windSpeed: 10,
      condition: 'Sunny',
    );
  }
}
