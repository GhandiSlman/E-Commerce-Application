// import 'package:eco/model/cart_model.dart';

// class OrderModel {
//   String? userId, dateTime;
//   Address? address;
//   List<CartModel>? products;

//   OrderModel({this.userId, this.dateTime, this.address, this.products});

//   OrderModel.fromJson(Map<String, dynamic> map) {
//     userId = map['userId'];
//     dateTime = map['dateTime'];
//     address = map.containsKey('address') ? Address.fromJson(map['address']) : null;
//     if (map.containsKey('products') && map['products'] != null) {
//       products = List<CartModel>.from(map['products'].map((item) => CartModel.fromJson(item)));
//     }
//   }

//   toJson() {
//     return {
//       'userId': userId,
//       'dateTime': dateTime,
//       'address': address?.toJson(),
//       'products': products?.map((product) => product.toJson()).toList(),
//     };
//   }
// }

// class Address {
//   String? street1, street2, city, state, country;

//   Address({this.street1, this.street2, this.city, this.state, this.country});


//   Address.fromJson(Map<String, dynamic> map) {
//     street1 = map['street1'];
//     street2 = map['street2'];
//     city = map['city'];
//     state = map['state'];
//     country = map['country'];
//   }

//   toJson() {
//     return {
//       'street1': street1,
//       'street2': street2,
//       'city': city,
//       'state': state,
//       'country': country,
//     };
//   }
// }

import 'package:eco/model/cart_model.dart';

class OrderModel {
  String? userId, deliveryType;
  String? street1, street2, city, state, country;
  List<CartModel>? products;

  OrderModel({
    this.userId,
    this.deliveryType,
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.country,
    this.products
  });

  OrderModel.fromJson(Map<String, dynamic> map) {
    userId = map['userId'];
    deliveryType = map['deliveryType'];
    street1 = map['street1'];
    street2 = map['street2'];
    city = map['city'];
    state = map['state'];
    country = map['country'];

    if (map.containsKey('products') && map['products'] != null) {
      products = List<CartModel>.from(map['products'].map((item) => CartModel.fromJson(item)));
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'deliveryType': deliveryType,
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'country': country,
      'products': products?.map((product) => product.toJson()).toList(),
    };
  }
}
