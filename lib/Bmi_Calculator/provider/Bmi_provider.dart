import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Bmi_provider extends  ChangeNotifier{
  bool male = false;
  bool female = false;
  double height = 20;
  double weight = 0;
  int age = 0;
  double result = 0;

  void changeGender()
  {
    male = !male;
    notifyListeners();
  }
  void changeGender2()
  {
    female = !female;
    notifyListeners();
  }

  void changeHeight(value)
  {
    height = value;
    notifyListeners();
  }

  void addWeight()
  {
    weight+=1;
    notifyListeners();
  }

  void minweight()
  {
    if(weight > 0)
    {
      weight--;
    }
    notifyListeners();
  }

  void addage()
  {
    age+=1;
    notifyListeners();
  }

  void minage()
  {
    if(age > 0)
    {
      age--;
    }
    notifyListeners();
  }

  void answer()
  {
    double a = height/100;
    result = weight/(a*a);
    print(weight);
    print(height);
    notifyListeners();
  }
  void reload()
  {
    male = false;
    female = false;
    height = 40;
    weight = 0;
    age = 0;
    result = 0;
    notifyListeners();
  }
}