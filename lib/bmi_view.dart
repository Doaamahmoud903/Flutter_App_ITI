import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  final int age;
  final String gender;
  final String result;

  ViewPage({required this.age, required this.gender, required this.result});

  String getBMICategory(double bmi) {
    if (bmi < 18.5) return "Underweight";
    else if (bmi >= 18.5 && bmi <= 24.9) return "Normal";
    else if (bmi >= 25 && bmi <= 29.9) return "Overweight";
    else return "Obese";
  }

  @override
  Widget build(BuildContext context) {
    double bmiValue = double.parse(result);
    String bmiCategory = getBMICategory(bmiValue);
    Color categoryColor = bmiValue < 18.5
        ? Colors.blue
        : (bmiValue < 25 ? Colors.green : (bmiValue < 30 ? Colors.orange : Colors.red));

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
        backgroundColor: Colors.blue[600],
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Age: $age", style: _infoTextStyle()),
              SizedBox(height: 10),
              Text("Gender: $gender", style: _infoTextStyle()),
              SizedBox(height: 20),
              Text("BMI: $result", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(bmiCategory, style: TextStyle(fontSize: 24, color: categoryColor, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _infoTextStyle() {
    return TextStyle(color: Colors.black54, fontSize: 22);
  }
}
