import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmiResult = 0.0;

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;
    if (weight > 0 && height > 0) {
      double bmi = weight / ((height / 100) * (height / 100));
      setState(() {
        bmiResult = bmi;
      });
    }
  }

  static const Color primaryColor = Color.fromARGB(255, 255, 194, 120);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0x000f0f0f),
      ),
      backgroundColor: const Color(0x000f0f0f),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Enter Weight (kg)',
                  labelStyle: TextStyle(color: Colors.white)),
              cursorColor: primaryColor,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Height (cm)',
                labelStyle: TextStyle(color: Colors.white),
              ),
              cursorColor: primaryColor,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () => calculateBMI(),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 255, 194, 120))),
              child: const Text('Calculate BMI',
                  style: TextStyle(fontSize: 16.0, color: Colors.black)),
            ),
            const SizedBox(height: 24.0),
            Text(
              'BMI: ${bmiResult.toStringAsFixed(2)}',
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
