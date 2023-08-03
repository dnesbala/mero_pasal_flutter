import 'package:flutter/material.dart';
import 'package:mero_pasal/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              height: 300,
              width: double.maxFinite,
            ),
            SizedBox(height: 20),
            Chip(label: Text(product.category.name)),
            SizedBox(height: 5),
            Text(product.title),
            SizedBox(height: 5),
            Text(product.description),
            SizedBox(height: 5),
            Text("Rs. ${product.price}"),
            SizedBox(height: 5),
            Text(
              "${product.rating.rate} ⭐ (${product.rating.count} ratings)",
            ),
          ],
        ),
      ),
    );
  }
}
