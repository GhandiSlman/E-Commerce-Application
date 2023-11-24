import 'package:flutter/cupertino.dart';

class CartModel {
  String? name;
  String? image;
  int quantity = 1;
  String? id;
  String? price;
  CartModel({
    this.name,
    this.image,
    required this.quantity,
    this.price,
    this.id,
  });

  CartModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    id = map['id'];
    price = map['price'];
  }

  toJson() {
    return {
      'id':id,
      'name':name,
      'image':image,
      'quantity':quantity,
      'price':price,
    };
  }
}
