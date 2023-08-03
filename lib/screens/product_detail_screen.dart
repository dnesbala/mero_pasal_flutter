import 'package:flutter/material.dart';
import 'package:mero_pasal/models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

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
            Hero(
              tag: product.id,
              child: Image.network(
                product.image,
                height: 300,
                width: double.maxFinite,
              ),
            ),
            SizedBox(height: 20),
            Chip(label: Text(product.category.name)),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 5),
            Text(product.description),
            SizedBox(height: 10),
            Text(
              "${product.rating.rate} ⭐ (${product.rating.count} ratings)",
            ),
            SizedBox(height: 5),
            Text(
              "Rs. ${product.price}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.indigo,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Quantity:"),
                TextButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    child: Text("-")),
                SizedBox(width: 5),
                Text(quantity.toString()),
                SizedBox(width: 5),
                TextButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: Text("+")),
              ],
            ),
            SizedBox(
              height: 50,
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
