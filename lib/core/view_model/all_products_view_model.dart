import 'package:get/get.dart';

import '../../model/product_model.dart';
import '../services/home_services.dart';

class AllProductsViewModel extends GetxController {
  List<ProductModel> searchList = <ProductModel>[];
  bool isSearching = false;
  bool isLoading = false;
  void searchProducts(String query) {
    searchList.clear();
    isSearching = query.isNotEmpty;

    if (isSearching) {
      for (var product in allProducts) {
        if (product.name!.toLowerCase().contains(query.toLowerCase())) {
          searchList.add(product);
        }
      }
    }
    update();
  }

  final id = Get.arguments['id'];
  List<String> categoryIds = [
    '3t91gxYHTGfNvKHNatws',
    'ASMqI6DsFAEtuQZatgwe',
    'IUvRUo41t3Ed8nflw9j5',
    'Z0prQGjGHRQaKCj90yqi',
    'iOREzfdaYepVxbzZblT6'
  ];

  final List<ProductModel> _allProducts = [];
  List<ProductModel> get allProducts => _allProducts;
  fetchAllProducts(String id) async {
    isLoading = true;
    print('++++++++++++++++++++++++');
    for (String id in categoryIds) {
      print('==================');
      HomeServices().fetchAllProducts(id).then((value) {
        for (int i = 0; i < value.length; i++) {
          _allProducts.add(
              ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
      isLoading = false;
        }
        update();
      });
    }
  }

  @override
  void onInit() {
    fetchAllProducts(id);
    super.onInit();
  }
}
