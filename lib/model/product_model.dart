import 'package:flutter/cupertino.dart';

class ProductModel {
  String? name;
  String? image;
  String? desc;
  String? sized;
  int? color;
  String? price;
  String? id;
  ProductModel({
    this.id,
    this.name,
    this.image,
    this.desc,
    this.sized,
    this.color,
    this.price,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    id = map['id'];
    name = map['name'];
    image = map['image'];
    desc = map['desc'];
    sized = map['sized'];
    color = map['color'];
    price = map['price'];
  }

  toJson() {
    return {
      'id' : id,
      'name': name,
      'image': image,
      'desc': desc,
      'sized': sized,
      'color': color,
      'price': price,
    };
  }
}
