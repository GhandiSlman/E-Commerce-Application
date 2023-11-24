import 'package:eco/core/helper/database/local_storage.dart';
import 'package:eco/core/view_model/auth_view_model.dart';
import 'package:eco/core/view_model/check_out_view_model.dart';
import 'package:eco/core/view_model/control_view_model.dart';
import 'package:eco/core/view_model/home_view_model.dart';
import 'package:eco/core/view_model/profile_view_model.dart';
import 'package:eco/core/view_model/category_products_view_model.dart';

import 'package:get/get.dart';

import '../view_model/cart_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => LocalStorage());
  }
}
