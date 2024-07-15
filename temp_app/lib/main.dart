import 'package:flutter/material.dart';
import 'temperature_conversion_screen.dart';

void main() {
  runApp(const TemperatureConversionApp());
}

class TemperatureConversionApp extends StatelessWidget {
  const TemperatureConversionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature Conversion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TemperatureConversionScreen(),
    );
  }
}
