import 'package:flutter/material.dart';
import 'package:grocery/daos/cart_dao.dart';
import 'package:grocery/views/cart/widgets/barcode_scanner_button.dart';
import 'package:grocery/views/cart/widgets/cart_summary.dart';
import 'package:grocery/views/cart/widgets/next_items_list.dart';
import 'package:grocery/views/cart/widgets/timer_header.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void closeCart() {
    context.read<CartDAO>().closeCart(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            TimerHeader(startedAt: DateTime.now(), onClose: closeCart),
            const SizedBox(height: 16),
            CartSummary(itemCount: 3, totalValue: 34),
            const SizedBox(height: 16),
            BarcodeScannerButton(onTap: () {}),
            const SizedBox(height: 16),
            NextItemsList(items: []),
          ],
        ),
      ),
    );
  }
}
