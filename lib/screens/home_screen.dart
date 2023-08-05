import 'package:flutter/material.dart';
import 'package:mero_pasal/models/cart_model.dart';
import 'package:mero_pasal/screens/admin_panel_screen.dart';
import 'package:mero_pasal/screens/cart_screen.dart';
import 'package:mero_pasal/screens/product_screen.dart';
import 'package:mero_pasal/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<CartModel> cartList = [];

  void addToCart(CartModel cart) {
    cartList.add(cart);
    setState(() {});
  }

  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      ProductScreen(addToCart: addToCart),
      SearchScreen(),
      CartScreen(),
      AdminPanelScreen(),
    ];
  }

  getBody() {
    return pages[selectedIndex];
    // switch (index) {
    //   case 0:
    //     return ProductScreen();
    //   case 1:
    //     return SearchScreen();
    //   case 2:
    //     return CartScreen();
    //   case 3:
    //     return CartScreen();
    //   default:
    //     return ProductScreen();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings_outlined),
            label: "Admin Panel",
          ),
        ],
      ),
    );
  }
}
