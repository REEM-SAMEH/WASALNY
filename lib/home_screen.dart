import 'package:flutter/material.dart';
import 'package:Wasalny/flightsceen.dart'; // Ensure the file path is correct
import 'package:Wasalny/hotelbook.dart';
import 'package:Wasalny/exchange_rate_screen.dart'; // Ensure the correct import for the exchange rate screen
import 'package:Wasalny/weather_screen.dart'; // Ensure WeatherScreen is correctly imported
import 'custom_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasalny'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/icon.png', width: 150, height: 150),
              const SizedBox(height: 40), // Increased spacing above the first button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HotelScreen()), // Ensure class name matches
                  );
                },
                child: const CustomText(text: 'HOTEL', icon: Icon(Icons.bed)),
              ),
              const SizedBox(height: 20), // Adjusted spacing between buttons
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FlightScreen()), // Ensure class name matches
                  );
                },
                child: const CustomText(text: 'FLIGHT', icon: Icon(Icons.book)),
              ),
              const SizedBox(height: 20), // Adjusted spacing between buttons
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherScreen()), // Navigate to WeatherScreen
                  );
                },
                child: const CustomText(text: 'WEATHER', icon: Icon(Icons.cloud)), // Icon for weather
              ),
              const SizedBox(height: 20), // Adjusted spacing between buttons
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExchangeRateScreen()), // Navigate to the exchange rate screen
                  );
                },
                child: const CustomText(text: 'EXCHANGE RATE', icon: Icon(Icons.attach_money_rounded)), // Icon for exchange rate
              ),
              const SizedBox(height: 40), // Increased spacing at the bottom
            ],
          ),
        ),
      ),
      backgroundColor: Colors.indigo[900],
    );
  }
}
