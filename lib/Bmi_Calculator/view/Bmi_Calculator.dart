import 'package:animation_topic/Bmi_Calculator/provider/Bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Bmi_Calculator extends StatefulWidget {
  const Bmi_Calculator({super.key});

  @override
  State<Bmi_Calculator> createState() => _Bmi_CalculatorState();
}

class _Bmi_CalculatorState extends State<Bmi_Calculator>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? AlignTween;
  Animation? AlignTween1;
  Animation? AlignTweencl;
  Animation? AlignTweencr;
  Animation? AlignTweenb;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    AlignTween =
        Tween<double>(begin: -5, end: -0.98).animate(animationController!);
    AlignTween1 =
        Tween<double>(begin: 5, end: 0.98).animate(animationController!);
    AlignTweencl =
        Tween<double>(begin: -2, end: -0.98).animate(animationController!);
    AlignTweencr =
        Tween<double>(begin: 5, end: 0.98).animate(animationController!);
    AlignTweenb =
        Tween<double>(begin: 2, end: 0.9).animate(animationController!);

    animationController!.forward();
    animationController!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  Bmi_provider? pt;
  Bmi_provider? pf;

  @override
  Widget build(BuildContext context) {
    pt = Provider.of<Bmi_provider>(context, listen: true);
    pf = Provider.of<Bmi_provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment(AlignTween!.value, -0.98),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.shade100,
                        blurRadius: 3,
                        spreadRadius: 4,
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                  child: Icon(Icons.menu_outlined, color: Colors.grey.shade600),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.96),
                child: Text(
                  "BMI Calculator",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(AlignTweencr!.value, -0.98),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.shade100,
                        blurRadius: 2,
                        spreadRadius: 4,
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                  child: Icon(Icons.person, color: Colors.grey.shade600),
                ),
              ),
              Align(
                alignment: Alignment(AlignTween!.value, -0.75),
                child: InkWell(
                  onTap: () {
                    pf!.changeGender();
                  },
                  child: Container(
                    height: 150,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.shade100,
                          blurRadius: 2,
                          spreadRadius: 3,
                          offset: Offset(1, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.male,
                            color: pt!.male
                                ? Colors.red
                                : Colors.blueGrey.shade600,
                            size: 80),
                        Text(
                          "Male",
                          style: TextStyle(
                              color: Colors.blueGrey.shade600, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(AlignTween1!.value, -0.75),
                child: InkWell(
                  onTap: () {
                    pf!.changeGender2();
                  },
                  child: Container(
                    height: 150,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.shade100,
                          blurRadius: 2,
                          spreadRadius: 3,
                          offset: Offset(1, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.female,
                            color: pt!.female
                                ? Colors.red
                                : Colors.blueGrey.shade600,
                            size: 80),
                        Text(
                          "Female",
                          style: TextStyle(
                              color: Colors.blueGrey.shade600, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(AlignTween!.value, 0.3),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 350,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.shade100,
                        blurRadius: 2,
                        spreadRadius: 3,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Height",
                        style: TextStyle(
                            fontSize: 18, color: Colors.blueGrey.shade600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${pt!.height.toInt()} cm",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 264,
                        child: SfSlider.vertical(
                          min: 1,
                          minorTicksPerInterval: 1,
                          max: 200,
                          value: pt!.height.toInt(),
                          enableTooltip: true,
                          activeColor: Colors.blueGrey.shade600,
                          inactiveColor: Colors.blueGrey.shade200,
                          showLabels: true,
                          // labelPlacement: LabelPlacement.betweenTicks,
                          showTicks: true,
                          showDividers: true,
                          onChanged: (value) {
                            pf!.changeHeight(value);
                            print(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(AlignTweencr!.value, 0.3),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.shade100,
                            blurRadius: 2,
                            spreadRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                                color: Colors.blueGrey.shade600, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${pt!.weight}",
                            style: TextStyle(
                                color: Colors.blueGrey.shade600,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueGrey.shade100,
                                      blurRadius: 2,
                                      spreadRadius: 3,
                                      offset: Offset(1, 3),
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    pt!.addWeight();
                                  },
                                  child: Icon(Icons.add,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueGrey.shade100,
                                      blurRadius: 2,
                                      spreadRadius: 3,
                                      offset: Offset(1, 3),
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    pt!.minweight();
                                  },
                                  child: Icon(Icons.remove,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.shade100,
                            blurRadius: 2,
                            spreadRadius: 3,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(
                                color: Colors.blueGrey.shade600, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${pt!.age}",
                            style: TextStyle(
                                color: Colors.blueGrey.shade600,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueGrey.shade100,
                                      blurRadius: 2,
                                      spreadRadius: 3,
                                      offset: Offset(1, 3),
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    pt!.addage();
                                  },
                                  child: Icon(Icons.add,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blueGrey.shade100,
                                      blurRadius: 2,
                                      spreadRadius: 3,
                                      offset: Offset(1, 3),
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    pt!.minage();
                                  },
                                  child: Icon(Icons.remove,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(-0, AlignTweenb!.value),
                child: InkWell(
                  onTap: () {
                    pt!.answer();
                    Navigator.pushNamed(context, 'health');
                  },
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade500,
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          Colors.blueGrey.shade700,
                          Colors.blueGrey.shade600,
                          Colors.blueGrey.shade500,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
