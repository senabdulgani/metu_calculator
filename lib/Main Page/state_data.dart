import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateData with ChangeNotifier{

  double result = 4.7;

  void updateResult(double newResult) {
    result = newResult;
  }

  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  void setCurrentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners(); // Değişiklikleri dinleyen widgetları güncelle



  String selectedTheme = 'Light'; // Initially set to Light theme
  
  }
}