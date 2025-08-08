import 'package:flutter/material.dart';
import 'package:par_1/models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};
  String? _packaging;
  double? _packagingPrice;
  String? _menFragrance;
  double? _menFragrancePrice;
  String? _womenFragrance;
  double? _womenFragrancePrice;
  bool _steamSelected = false;
  String? _from;
  String? _to;

  Map<String, CartItem> get items => _items;
  String? get packaging => _packaging;
  double? get packagingPrice => _packagingPrice;
  String? get menFragrance => _menFragrance;
  double? get menFragrancePrice => _menFragrancePrice;
  String? get womenFragrance => _womenFragrance;
  double? get womenFragrancePrice => _womenFragrancePrice;
  bool get steamSelected => _steamSelected;
  String? get from => _from;
  String? get to => _to;
  bool _isSteamSelected = false;
  final double _steamPrice = 0;
  String? selectedFragrance;
  double? fragrancePrice;

  bool get isSteamSelected => _isSteamSelected;
  double get steamPrice => _isSteamSelected ? _steamPrice : 0.0;

  void toggleSteam(bool value) {
    _isSteamSelected = value;
    notifyListeners();
  }

  void addItem(String name, String iconPath, double price) {
    if (_items.containsKey(name)) {
      _items[name] = _items[name]!.copyWith(
        quantity: _items[name]!.quantity + 1,
      );
    } else {
      _items[name] = CartItem(
        name: name,
        quantity: 1,
        iconPath: iconPath,
        price: price,
      );
    }
    notifyListeners();
  }

  void removeItem(String name) {
    if (_items.containsKey(name)) {
      if (_items[name]!.quantity > 1) {
        _items[name] = _items[name]!.copyWith(
          quantity: _items[name]!.quantity - 1,
        );
      } else {
        _items.remove(name);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    _packaging = null;
    _packagingPrice = null;
    _womenFragrance = null;
    _womenFragrancePrice = null;
    _steamSelected = false;
    _from = null;
    _to = null;
    notifyListeners();
  }

  void setPackaging(String name, double price) {
    _packaging = name;
    _packagingPrice = price;
    notifyListeners();
  }

  void setFragrance(String name, double price) {
    selectedFragrance = name;
    fragrancePrice = price;
    notifyListeners();
  }

  void clearFragrance() {
    selectedFragrance = null;
    fragrancePrice = null;
    notifyListeners();
  }

  void setSteamSelected(bool selected) {
    _steamSelected = selected;
    notifyListeners();
  }

  void setPersonalizedCard({String? from, String? to}) {
    _from = from;
    _to = to;
    notifyListeners();
  }

  double calculateTotalCost() {
    double total = 0;

    for (var item in _items.values) {
      total += item.price * item.quantity;
    }

    if (_packagingPrice != null) total += _packagingPrice!;
    if (_menFragrancePrice != null) total += _menFragrancePrice!;
    if (_womenFragrancePrice != null) total += _womenFragrancePrice!;

    return total;
  }
}
