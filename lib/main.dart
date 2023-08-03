import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mero_pasal/screens/home_screen.dart';
import 'package:mero_pasal/screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mero Pasal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
        fontFamily: GoogleFonts.rubik().fontFamily,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/product-detail": (context) => ProductDetailScreen(),
      },
    );
  }
}
