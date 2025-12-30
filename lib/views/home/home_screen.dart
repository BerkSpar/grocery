import 'package:flutter/material.dart';
import 'package:grocery/daos/cart_dao.dart';
import 'package:grocery/views/home/widgets/cart_home_summary.dart';
import 'package:grocery/views/home/widgets/cart_items_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void createNewItem() async {
    await context.read<CartDAO>().createPreCartItem(
      name: 'Pizza',
      quantity: '12un',
      emoji: '🍕',
    );
  }

  void toggleCartItem(int cartItemId) {
    context.read<CartDAO>().toggleCartItem(cartItemId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder(
              stream: context.read<CartDAO>().watchOpenCartTotalPrice(),
              builder: (context, stream) {
                return CartHomeSummary(totalValue: stream.data ?? 0);
              },
            ),
            const SizedBox(height: 16),
            StreamBuilder(
              stream: context.read<CartDAO>().watchPreCartItems(),
              builder: (context, stream) {
                return CartItemsList(
                  items: stream.data ?? [],
                  onAddNewItem: createNewItem,
                  onItemToggled: toggleCartItem,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
