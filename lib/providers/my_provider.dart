import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String languageCode="en";
  ThemeMode myTheme=ThemeMode.light;
  changeLanguage(String code){
    languageCode=code;
    notifyListeners();

  }
  changeThemeMode(ThemeMode mode){
    myTheme=mode;
    notifyListeners();


  }

}