import 'package:dio/dio.dart';
import 'package:weather_app/utils/constants.dart'; 

class BaseApiService {
 final Dio _dio = Dio();

 BaseApiService() {
    _dio.options.baseUrl = Constants.apiUrl;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Constants.apiKey}',
    };
 }

 Future<Response> getWeatherData({required double lat, required double lon}) {
    return _dio.get(
      '/weather?lat=$lat&lon=$lon&appid=${Constants.apiKey}&units=metric',
    );
 }
}
