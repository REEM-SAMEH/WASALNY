import 'package:flutter/material.dart';

class FlightScreen extends StatefulWidget {
  @override
  _FlightScreenState createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> {
  String? tripType; // Variable to store selected trip type
  String? transitType; // Variable to store selected transit type
  String fromCountry = ''; // Variable for departure country
  String toCountry = ''; // Variable for arrival country

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight'),
      ),
      backgroundColor: Color(0xFF87CEEB), // Set custom sky blue background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start, // Aligns children to the start of the column
          children: [
            // Trip Type Dropdown
            DropdownButton<String>(
              value: tripType,
              hint: Text('Select Trip Type'),
              items: <String>['One Way', 'Round Trip']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  tripType = newValue;
                });
              },
            ),

            SizedBox(height: 20), // Spacing

            // Transit Type Dropdown
            DropdownButton<String>(
              value: transitType,
              hint: Text('Select Transit Type'),
              items: <String>['Direct', 'Transit']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  transitType = newValue;
                });
              },
            ),

            SizedBox(height: 20), // Spacing

            // From Country Text Field
            TextField(
              onChanged: (value) {
                fromCountry = value; // Update fromCountry on text change
              },
              decoration: InputDecoration(
                labelText: 'From Country',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20), // Spacing

            // To Country Text Field
            TextField(
              onChanged: (value) {
                toCountry = value; // Update toCountry on text change
              },
              decoration: InputDecoration(
                labelText: 'To Country',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20), // Spacing

            // Centered Done Button
            Center(
              child: ElevatedButton(
                child: Text(
                  'Done!',
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                ),
                onPressed: () {
                  // Print selected information
                  print('Trip Type: $tripType');
                  print('Transit Type: $transitType');
                  print('From Country: $fromCountry');
                  print('To Country: $toCountry');
                  // Add further logic if needed (e.g., navigating or showing a summary)
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
