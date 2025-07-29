import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, int> _cartItems = {};

  String? _packaging;
  String? _perfume;
  bool _steamSelected = false;

  void addItem(String itemLabel, int count) {
    _cartItems.update(itemLabel, (value) => value + 1, ifAbsent: () => 1);
    notifyListeners();
  }

  void removeItem(String itemLabel) {
    if (_cartItems.containsKey(itemLabel) && _cartItems[itemLabel]! > 0) {
      _cartItems[itemLabel] = _cartItems[itemLabel]! - 1;
      if (_cartItems[itemLabel] == 0) _cartItems.remove(itemLabel);
      notifyListeners();
    }
  }

  Map<String, int> get cartItems => _cartItems;

  void setPackaging(String packaging) {
    _packaging = packaging;
    notifyListeners();
  }

  String? get packaging => _packaging;

  void setPerfume(String perfume) {
    _perfume = perfume;
    notifyListeners();
  }

  String? get perfume => _perfume;

  void toggleSteam(bool selected) {
    _steamSelected = selected;
    notifyListeners();
  }

  bool get isSteamSelected => _steamSelected;

  void resetCart() {
    _cartItems.clear();
    _packaging = null;
    _perfume = null;
    _steamSelected = false;
    notifyListeners();
  }
}
