import 'package:flutter/material.dart';
import 'package:Wasalny/dates.dart'; // Ensure the import is correct

class HotelScreen extends StatefulWidget {
  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  DateTime? fromDate;
  DateTime? toDate;
  final TextEditingController countryController = TextEditingController();

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2101),
      helpText: isFromDate ? 'Select From Date' : 'Select To Date',
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel'),
      ),
      backgroundColor: Color(0xFF880E43),  // Your specified color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row for From Date and To Date buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.date_range, size: 24),
                    label: Text('From Date'),
                    onPressed: () => _selectDate(context, true),
                  ),
                ),
                SizedBox(width: 10), // Spacing between the buttons
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.date_range, size: 24),
                    label: Text('To Date'),
                    onPressed: () => _selectDate(context, false),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Spacing between the row and text fields

            // Display selected dates
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (fromDate != null)
                  Text('From Date: ${fromDate!.toLocal().toString().split(' ')[0]}'),
                if (toDate != null)
                  Text('To Date: ${toDate!.toLocal().toString().split(' ')[0]}'),
              ],
            ),

            SizedBox(height: 20), // Spacing

            // Country Input Field
            TextField(
              controller: countryController,
              decoration: InputDecoration(
                labelText: 'Enter Country',
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
                  // Check if dates and country are selected before navigating
                  if (fromDate != null && toDate != null && countryController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dates(
                          fromDate: fromDate!,  // Pass the required 'fromDate'
                          toDate: toDate!,      // Pass the required 'toDate'
                          country: countryController.text,  // Pass the 'country' from TextField
                        ),
                      ),
                    );
                  } else {
                    // Show a message if not all data is filled
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select dates and enter a country.')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
