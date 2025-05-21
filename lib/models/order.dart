import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_online_store/models/cart-item.dart';

class Order {
  final String? id;
  final String fullName;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String postalCode;
  final String paymentMethod;
  final String? notes;
  final List<CartItem> items;
  final double totalAmount;
  final String status;
  final DateTime createdAt;
  final String userId;

  Order({
    this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.postalCode,
    required this.paymentMethod,
    this.notes,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city,
      'postalCode': postalCode,
      'paymentMethod': paymentMethod,
      'notes': notes,
      'items': items.map((item) => item.toMap()).toList(),
      'totalAmount': totalAmount,
      'status': status,
      'createdAt': Timestamp.fromDate(createdAt),
      'userId': userId,
    };
  }
}
