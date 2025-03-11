import 'package:flutter/material.dart';
import 'package:first_app_filter/bmi_view.dart';

class BmiHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<BmiHomePage> {
  bool isMale = true;
  double height = 180;
  int weight = 60;
  int age = 28;

  double calculateBMI() {
    return weight / ((height / 100) * (height / 100));
  }

  void navigateToResult() {
    double result = calculateBMI();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewPage(
          age: age,
          gender: isMale ? "Male" : "Female",
          result: result.toStringAsFixed(1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _genderCard(Icons.male, "Male", isMale, () {
                  setState(() {
                    isMale = true;
                  });
                }),
                _genderCard(Icons.female, "Female", !isMale, () {
                  setState(() {
                    isMale = false;
                  });
                }),
              ],
            ),
            SizedBox(height: 20),
            _heightSlider(),
            SizedBox(height: 20),
            _counterCard("Weight", weight, () {
              setState(() {
                weight++;
              });
            }, () {
              setState(() {
                weight--;
              });
            }),
            SizedBox(height: 20),
            _counterCard("Age", age, () {
              setState(() {
                age++;
              });
            }, () {
              setState(() {
                age--;
              });
            }),
            Spacer(), // Pushes the button to the bottom
            SizedBox(
              width: double.infinity, // Takes full width
              child: ElevatedButton(
                onPressed: navigateToResult,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "CALCULATE",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _genderCard(IconData icon, String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selected ? Colors.blueAccent : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 60, color: selected ? Colors.white : Colors.black54),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _heightSlider() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "HEIGHT",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          SizedBox(height: 10),
          Text(
            "${height.round()} cm",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Slider(
            value: height,
            min: 100,
            max: 220,
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.grey[300],
            onChanged: (value) {
              setState(() {
                height = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _counterCard(String label, int value, VoidCallback onIncrement, VoidCallback onDecrement) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onDecrement,
                icon: Icon(Icons.remove_circle, color: Colors.red, size: 30),
              ),
              Text(
                "$value",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: onIncrement,
                icon: Icon(Icons.add_circle, color: Colors.green, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}