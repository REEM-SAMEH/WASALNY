import 'package:flutter/material.dart';
import 'weather_info.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherInfo weatherService = WeatherInfo();
  String city = '';
  String country = '';
  Map<String, dynamic>? weatherData;
  final _formKey = GlobalKey<FormState>();

  Future<void> _getWeather() async {
    if (_formKey.currentState!.validate()) {
      try {
        weatherData = await weatherService.fetchWeatherByCity(city, country: country);
        setState(() {});
      } catch (e) {
        print(e);
        // Handle error appropriately, maybe show a snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to fetch weather data')),
        );
      }
    }
  }

  // Function to determine background color based on weather condition
  Color _getBackgroundColor() {
    if (weatherData == null) {
      return Colors.white;  // Default background when no weather data
    }

    String condition = weatherData!['data'][0]['weather']['description'].toLowerCase();

    if (condition.contains('clear') || condition.contains('sunny')) {
      return Colors.orangeAccent;  // Sunny or clear weather
    } else if (condition.contains('cloud') || condition.contains('overcast')) {
      return Colors.lightBlueAccent;  // Cloudy weather
    } else if (condition.contains('rain') || condition.contains('drizzle')) {
      return Colors.blueGrey;  // Rainy weather
    } else if (condition.contains('snow')) {
      return Colors.white;  // Snowy weather
    } else {
      return Colors.greenAccent;  // Default for other conditions (windy, fog, etc.)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Container(
        color: _getBackgroundColor(),  // Set the dynamic background color
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'City'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a city';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      city = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Country (optional)'),
                    onChanged: (value) {
                      country = value; // Optional country input
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _getWeather,
                    child: Text('Get Weather'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            weatherData == null
                ? Container()
                : Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weather in ${weatherData!['data'][0]['city_name']}, ${weatherData!['data'][0]['country_code']}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Temperature: ${weatherData!['data'][0]['temp']}°C'),
                  Text('Condition: ${weatherData!['data'][0]['weather']['description']}'),
                  // Add more weather information as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
