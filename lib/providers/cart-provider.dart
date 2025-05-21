import 'package:flutter/material.dart';
import 'package:flutter_online_store/models/product.dart';
import 'package:flutter_online_store/models/cart-item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount => _items.fold(
      0, (sum, item) => sum + (item.product.price * item.quantity));

  CartProvider() {
    _loadCartFromPrefs();
  }

  Future<void> _loadCartFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartData = prefs.getString('cart');
      if (cartData != null) {
        final List<dynamic> decodedData = json.decode(cartData);
        // This is a simplified version. In a real app, you'd need to reconstruct
        // the Product objects from the saved data
        // For now, we'll just initialize with an empty cart
        notifyListeners();
      }
    } catch (e) {
      print('Error loading cart: $e');
    }
  }

  Future<void> _saveCartToPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartData = json.encode(_items.map((item) => item.toMap()).toList());
      await prefs.setString('cart', cartData);
    } catch (e) {
      print('Error saving cart: $e');
    }
  }

  void addItem(Product product) {
    final existingIndex = _items.indexWhere(
        (item) => item.product.id == product.id);

    if (existingIndex >= 0) {
      _items[existingIndex].quantity += 1;
    } else {
      _items.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners();
    _saveCartToPrefs();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
    _saveCartToPrefs();
  }

  void updateQuantity(String productId, int quantity) {
    if (quantity <= 0) {
      removeItem(productId);
      return;
    }

    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      _items[index].quantity = quantity;
      notifyListeners();
      _saveCartToPrefs();
    }
  }

  void clear() {
    _items = [];
    notifyListeners();
    _saveCartToPrefs();
  }
}
