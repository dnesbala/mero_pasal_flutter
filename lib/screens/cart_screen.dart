import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:mero_pasal/models/cart_model.dart';

class CartScreen extends StatelessWidget {
  final List<CartModel> cartList;
  final void Function(int) deleteItem;
  const CartScreen({
    Key? key,
    required this.cartList,
    required this.deleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (context, index) {
          final item = cartList[index];
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (dir) {
              deleteItem(item.id);
              Fluttertoast.showToast(msg: "Item deleted from cart");
            },
            confirmDismiss: (dir) {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Are you sure?"),
                      content: Text(
                          "Are you sure you want to delete item from cart?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text("NO")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text("YES")),
                      ],
                    );
                  });
            },
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.only(right: 16),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              leading: Image.network(item.product.image, height: 80, width: 80),
              minLeadingWidth: 60,
              title: Text(item.product.title),
              subtitle: Row(
                children: [
                  Text("Qty : ${item.quantity}"),
                  SizedBox(width: 20),
                  Text("Total : \$${item.product.price * item.quantity}"),
                ],
              ),
            ),
          );
        },
      ),
      bottomSheet: SizedBox(
        height: 60,
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Checkout"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
          ),
        ),
      ),
    );
  }
}
