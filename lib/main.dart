import 'package:flutter/material.dart';
import 'package:currency_converter/logic/currency_converter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Currency Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 115, 255)),
      ),
      home: const ConverterScreen(),
    );
  }
}
// Create the necessary classes using lab 2 as a reference
class ConverterScreen extends StatefulWidget { 
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  // Add default values for the converter
  String _fromCurrency = 'USD';
  String _toCurrency = 'EUR';
  double _amount = 100.0;
  @override
  Widget build(BuildContext context){
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    double? exchangeRate = getExchangeRate(_fromCurrency, _toCurrency);
    double? convertedAmount = convertCurrency(_fromCurrency, _toCurrency, _amount);
    
    return Scaffold(
      appBar: AppBar(title:const Text('My Currency Converter')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text('Converted Amount', style: style),
                Text(
                  '${convertedAmount?.toStringAsFixed(2) ?? '-'} $_toCurrency', //adding the maount and the currency code, handle null
                  style: style.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontSize: theme.textTheme.displaySmall?.fontSize,
                  ),
                ),
                Text(
                  '1 $_fromCurrency = ${exchangeRate?.toStringAsFixed(4) ?? '-'} $_toCurrency', //also handles null case
                  style: style.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontSize: theme.textTheme.bodyMedium?.fontSize,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Amount to Convert',
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // add decimals
                    onChanged: (String value) {
                      setState(() {
                        _amount = double.tryParse(value) ?? 0.0;
                      }); // Facilitates updating the converted amount upon input change
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

