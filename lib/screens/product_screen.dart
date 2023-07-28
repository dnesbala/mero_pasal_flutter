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
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final product = productList[index];
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.image),
              ),
            ),
            child: Column(
              children: [
                Text(product.title),
              ],
            ),
          );
        },
      ),
    );
  }
}
