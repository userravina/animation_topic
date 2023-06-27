import 'package:animation_topic/Bmi_Calculator/provider/Bmi_provider.dart';
import 'package:animation_topic/Bmi_Calculator/view/Splash_bmi.dart';
import 'package:animation_topic/Bmi_Calculator/view/health_Screen.dart';
import 'package:animation_topic/Gallaxyplanet/view/Gallaxy_Screen.dart';
import 'package:animation_topic/Gallaxyplanet/view/TwoScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'Bmi_Calculator/view/Bmi_Calculator.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) {
              return Bmi_provider();
            },
          ),
        ],
        child:GetMaterialApp(
          initialRoute: 'S',
          debugShowCheckedModeBanner: false,
          routes: {
            // '/': (p0) => Bmi_Calculator(),
            // 'health': (p0) => healthScreen(),
            // 'S': (p0) => Splash_Bmi(),

            'S': (context) => HomeScreen(),
            'view': (context) => TwoScreen(),
          },
        ),
      ),
    ),
  );
}
