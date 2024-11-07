import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherInfo {
  final String apiKey = '3a710e84c8294b57a1541fc214fdd05e'; // Your Weatherbit API key
  final String baseUrl = 'https://api.weatherbit.io/v2.0/current';

  Future<Map<String, dynamic>?> fetchWeatherByCity(String city, {String? country}) async {
    // Construct the query parameters
    String countryQuery = country != null ? '&country=$country' : '';
    final response = await http.get(Uri.parse('$baseUrl?key=$apiKey&city=$city$countryQuery'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
