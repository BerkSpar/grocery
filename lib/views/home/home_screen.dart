import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grocery/daos/cart_dao.dart';
import 'package:grocery/views/home/widgets/cart_home_summary.dart';
import 'package:grocery/views/home/widgets/cart_items_list.dart';
import 'package:grocery/views/home/widgets/create_cart_item_bottom_sheet.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void createCart() {
    try {
      context.read<CartDAO>().createCart();
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  void createNewCartItem() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CreateCartItemBottomSheet();
      },
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
                if (!stream.hasData || stream.data == null) {
                  return SizedBox.shrink();
                }

                return CartHomeSummary(totalValue: stream.data ?? 0);
              },
            ),
            const SizedBox(height: 16),

            StreamBuilder(
              stream: context.read<CartDAO>().watchPreCartItems(),
              builder: (context, stream) {
                return CartItemsList(
                  items: stream.data ?? [],
                  onAddNewItem: createNewCartItem,
                  onItemToggled: toggleCartItem,
                );
              },
            ),

            StreamBuilder(
              stream: context.read<CartDAO>().watchOpenCartTotalPrice(),
              builder: (context, stream) {
                if (stream.hasData) return SizedBox.shrink();
                return NeoCard(
                  onTap: createCart,
                  child: Text('Abrir carrinho'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
