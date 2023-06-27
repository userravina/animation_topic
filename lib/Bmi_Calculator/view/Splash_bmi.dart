import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash_Bmi extends StatefulWidget {
  const Splash_Bmi({super.key});

  @override
  State<Splash_Bmi> createState() => _Splash_BmiState();
}

class _Splash_BmiState extends State<Splash_Bmi> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 5),
      () => Navigator.pushNamed(context, '/'),
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Lottie.asset('assets/json/loading.json'),
                Text("Calculate your BMI",
                    style: TextStyle(
                        color: Colors.blueGrey.shade700, fontSize: 20)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
