import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


class GradesProvider extends ChangeNotifier {
  String _seciliKisi = 'Elif'; // Varsayılan seçilen kişi
  Map<String, double> _notlar = {}; // Varsayılan notlar

  String get seciliKisi => _seciliKisi;
  Map<String, double> get notlar => _notlar;

  Future<void> seciliKisiyiBelirle(String kisi) async {
    _seciliKisi = kisi;
    await _seciliKisiyiPrefsEKaydet(kisi);
    notifyListeners();
  }

  Future<void> kayitliSeciliKisiyiYukle() async {
    final prefs = await SharedPreferences.getInstance();
    final kayitliKisi = prefs.getString('seciliKisi');
    if (kayitliKisi != null) {
      _seciliKisi = kayitliKisi;
      notifyListeners();
    }
  }

  Future<void> notlariBelirle(Map<String, double> notlar) async {
    _notlar = notlar;
    await _notlariPrefsEKaydet(notlar);
    notifyListeners();
  }

  Future<void> kayitliNotlariYukle() async {
    final prefs = await SharedPreferences.getInstance();
    final kayitliNotlar = prefs.getString('notlar');
    if (kayitliNotlar != null) {
      _notlar = _notlariCoz(kayitliNotlar);
      notifyListeners();
    }
  }

  Future<void> _seciliKisiyiPrefsEKaydet(String kisi) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('seciliKisi', kisi);
  }

  Future<void> _notlariPrefsEKaydet(Map<String, double> notlar) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('notlar', _notlariKodla(notlar));
  }

  String _notlariKodla(Map<String, double> notlar) {
    // Notları bir JSON dizesine veya başka bir formata dönüştürün
    // Örneğin, json.encode() yöntemini kullanabilirsiniz.
    // Dizeden sonradan çözülebilecek bir format kullanın.
    return json.encode(notlar);
  }

  Map<String, double> _notlariCoz(String notlarString) {
    // Kaydedilmiş dizeden notları geri dönüştürün
    // Örneğin, json.decode() yöntemini kullanabilirsiniz.
    return json.decode(notlarString);
  }
}
