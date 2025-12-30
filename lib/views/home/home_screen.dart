import 'package:flutter/material.dart';
import 'package:grocery/views/home/widgets/cart_home_summary.dart';
import 'package:grocery/views/home/widgets/cart_items_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CartHomeSummary(totalValue: 0),
            const SizedBox(height: 16),
            CartItemsList(
              items: [],
              onAddNewItem: () {},
              onItemToggled: (id) {},
            ),
          ],
        ),
      ),
    );
  }
}
