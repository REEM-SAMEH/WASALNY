import 'package:flutter/material.dart';

class Dates extends StatelessWidget {
  final DateTime fromDate;
  final DateTime toDate;
  final String country;

  // Constructor to accept the dates and country
  const Dates({
    super.key,
    required this.fromDate,
    required this.toDate,
    required this.country,
  });

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
            children: [
              Text(
                'You successfully booked from ${fromDate.toLocal().toString().split(' ')[0]} to ${toDate.toLocal().toString().split(' ')[0]} in $country!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black ,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
