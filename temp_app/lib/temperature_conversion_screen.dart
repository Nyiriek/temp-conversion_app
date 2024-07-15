import 'package:flutter/material.dart';

class TemperatureConversionScreen extends StatefulWidget {
  const TemperatureConversionScreen({super.key});

  @override
  _TemperatureConversionScreenState createState() => _TemperatureConversionScreenState();
}

class _TemperatureConversionScreenState extends State<TemperatureConversionScreen> {
  final TextEditingController _controller = TextEditingController();
  String _selectedConversion = 'F to C';
  String _convertedValue = '';
  final List<String> _history = [];

  void _convertTemperature() {
    double input = double.tryParse(_controller.text) ?? 0;
    double result;
    String historyEntry;

    if (_selectedConversion == 'F to C') {
      result = (input - 32) * 5 / 9;
      historyEntry = 'F to C: ${input.toStringAsFixed(1)} => ${result.toStringAsFixed(1)}';
    } else {
      result = input * 9 / 5 + 32;
      historyEntry = 'C to F: ${input.toStringAsFixed(1)} => ${result.toStringAsFixed(1)}';
    }

    setState(() {
      _convertedValue = result.toStringAsFixed(1);
      _history.insert(0, historyEntry); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Temp. Converter',
          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1A237E),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white10, Colors.blue.shade300],
            stops: const [0.1, 0.9],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter temperature',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<String>(
                    value: 'F to C',
                    groupValue: _selectedConversion,
                    onChanged: (value) {
                      setState(() {
                        _selectedConversion = value!;
                      });
                    },
                  ),
                  const Text('F to C'),
                  Radio<String>(
                    value: 'C to F',
                    groupValue: _selectedConversion,
                    onChanged: (value) {
                      setState(() {
                        _selectedConversion = value!;
                      });
                    },
                  ),
                  const Text('C to F'),
                ],
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: _convertTemperature,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF009688),
                  foregroundColor: Colors.white, 
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text('Convert'),
              ),
              const SizedBox(height: 16),
              Text(
                'Converted Value: $_convertedValue',
                style: const TextStyle(fontSize: 22.5, color: Color(0xFF212121)),
              ),
              const SizedBox(height: 18),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _history[index],
                      style: const TextStyle(color: Color(0xFF212121)),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
