import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:grocery/daos/cart_dao.dart';
import 'package:grocery/views/cart/cart_screen.dart';
import 'package:grocery/views/home/widgets/cart_home_summary.dart';
import 'package:grocery/views/home/widgets/cart_items_list.dart';
import 'package:grocery/views/home/widgets/create_cart_item_bottom_sheet.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void createCartAndNavigate() {
    try {
      context.read<CartDAO>().createCart();
      navigateToCart();
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

  void navigateToCart() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => CartScreen()));
  }

  void toggleCartItem(int cartItemId) {
    context.read<CartDAO>().toggleCartItem(cartItemId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
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
              ],
            ),
            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: StreamBuilder(
                stream: context.read<CartDAO>().watchOpenCartTotalPrice(),
                builder: (context, stream) {
                  return NeoCard(
                    onTap: stream.hasData
                        ? navigateToCart
                        : createCartAndNavigate,
                    backgroundColor: Colors.orangeAccent,
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: .min,
                      spacing: 8,
                      children: [
                        Text(
                          stream.hasData
                              ? 'Abrir o carrinho'
                              : 'Entrar no mercado',
                          style: TextStyle(fontSize: 16, fontWeight: .bold),
                        ),
                        stream.hasData
                            ? PhosphorIcon(
                                PhosphorIconsBold.shoppingBagOpen,
                                size: 20,
                              )
                            : PhosphorIcon(
                                PhosphorIconsBold.shoppingBag,
                                size: 20,
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
