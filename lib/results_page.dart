import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.bmi});

  final double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your BMI is:',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              bmi.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 64.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              _getInterpretation(bmi),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getInterpretation(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25.0) {
      return 'Normal';
    } else if (bmi < 30.0) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
