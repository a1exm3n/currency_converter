import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:const Text('My Currency Converter')),
    );
  }
}
