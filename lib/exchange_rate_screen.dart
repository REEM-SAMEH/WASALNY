import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExchangeRateScreen extends StatefulWidget {
  @override
  _ExchangeRateScreenState createState() => _ExchangeRateScreenState();
}

class _ExchangeRateScreenState extends State<ExchangeRateScreen> {
  Map<String, dynamic> exchangeRates = {};
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchExchangeRates();
  }

  Future<void> fetchExchangeRates() async {
    final String apiKey = 'b8e40344d21f810110ac3927'; // Your API Key
    final String baseCurrency = 'USD'; // Change to your desired base currency
    final String url = 'https://v6.exchangerate-api.com/v6/$apiKey/latest/$baseCurrency';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          exchangeRates = data['conversion_rates'];
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load exchange rates.';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exchange Rates'),
      ),
      body: Container(
        color: Colors.green[300],  // Background color suited for a currency screen
        child: Center(
          child: errorMessage.isNotEmpty
              ? Text(errorMessage)
              : exchangeRates.isNotEmpty
              ? ListView.builder(
            itemCount: exchangeRates.length,
            itemBuilder: (context, index) {
              String currency = exchangeRates.keys.elementAt(index);
              var rate = exchangeRates[currency];
              return ListTile(
                title: Text('$currency: ${rate is int ? rate.toDouble() : rate}'),
              );
            },
          )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
