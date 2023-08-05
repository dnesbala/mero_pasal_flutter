import 'package:mero_pasal/models/product_model.dart';

class CartModel {
  final int id;
  final ProductModel product;
  final int quantity;

  CartModel({
    required this.id,
    required this.product,
    required this.quantity,
  });
}
