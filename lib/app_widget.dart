import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/daos/cart_dao.dart';
import 'package:grocery/views/home/home_screen.dart';
import 'package:provider/provider.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => CartDAO(),
      child: MaterialApp(
        title: 'Grocery',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.robotoCondensedTextTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
              ),
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
