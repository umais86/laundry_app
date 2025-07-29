import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _cartItems = {};

  String? _packaging;
  String? _perfume;
  bool _steamSelected = false;

  void addItem(String name, String iconPath) {
    if (_cartItems.containsKey(name)) {
      final existingItem = _cartItems[name]!;
      _cartItems[name] = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
      );
    } else {
      _cartItems[name] = CartItem(name: name, quantity: 1, iconPath: iconPath);
    }
    notifyListeners();
  }

  void removeItem(String name) {
    if (_cartItems.containsKey(name)) {
      final currentItem = _cartItems[name]!;
      if (currentItem.quantity > 1) {
        _cartItems[name] = currentItem.copyWith(
          quantity: currentItem.quantity - 1,
        );
      } else {
        _cartItems.remove(name);
      }
      notifyListeners();
    }
  }

  Map<String, CartItem> get cartItems => _cartItems;

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
