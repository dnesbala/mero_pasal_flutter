import 'package:flutter/material.dart';
import 'package:mero_pasal/api/product_api.dart';
import 'package:mero_pasal/models/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductApi productApi = ProductApi();
  List<ProductModel> productList = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  getProducts() async {
    productList = await productApi.fetchProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final product = productList[index];
          return GestureDetector(
            onTap: () {
              // navigate to product detail screen
              Navigator.pushNamed(context, "/product-detail");
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: Image.network(
                      product.image,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.title,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${product.rating.rate} ⭐ (${product.rating.count} ratings)",
                  ),
                  Text("Rs. ${product.price}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
