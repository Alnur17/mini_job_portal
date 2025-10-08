import 'package:get/get.dart';

import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/products_model.dart';

class HomeController extends GetxController {
  RxList<Product> productsList = <Product>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final response = await BaseClient.getRequest(
        api: Api.allProducts,
        headers: {'Content-Type': 'application/json'},
      );
      final jsonData = await BaseClient.handleResponse(response);
      final productsModel = ProductsModel.fromJson(jsonData);
      productsList.assignAll(productsModel.products);
    } catch (e) {
      print('Error fetching products: $e');
      // Handle error, e.g., show snackbar
    } finally {
      isLoading.value = false;
    }
  }
}