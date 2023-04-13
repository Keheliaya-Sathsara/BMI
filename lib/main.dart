import 'package:flutter/material.dart';
import 'package:test1/results_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 70;

  double _calculateBMI(int height, int weight) {
    double heightInMeters = height / 100.0;
    return weight / (heightInMeters * heightInMeters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Height',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    '$height',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'cm',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Slider(
              value: height.toDouble(),
              min: 120.0,
              max: 220.0,
              onChanged: (double newValue) {
                setState(() {
                  height = newValue.round();
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Weight',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    '$weight',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'kg',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white70,
                  ),
                ),
                onPressed: () {
                  double bmi = _calculateBMI(height, weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(bmi: bmi),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
