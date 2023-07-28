import 'package:dio/dio.dart';
import 'package:mero_pasal/config/api_constants.dart';
import 'package:mero_pasal/models/product_model.dart';

class ProductApi {
  final dio = Dio();

  fetchProducts() async {
    final response = await dio.get(ApiConstants.getProducts);
    // if there is data, response is OK
    if (response.statusCode == 200) {
      final data = response.data;
      final productList =
          (data as List).map((json) => ProductModel.fromJson(json)).toList();
      return productList;
    }
  }
}
