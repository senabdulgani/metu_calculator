import 'package:flutter/material.dart';

class StateData with ChangeNotifier{

  double result = 4.7;

  void updateResult(double newResult) {
    result = newResult;
  }




  int _currentPageIndex = 1;

  int get currentPageIndex => _currentPageIndex;

  void setCurrentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners(); // Değişiklikleri dinleyen widgetları güncelle
  }
}