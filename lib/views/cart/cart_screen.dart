import 'package:flutter/material.dart';
import 'package:grocery/daos/cart_dao.dart';
import 'package:grocery/database/database.dart';
import 'package:grocery/models/product.dart';
import 'package:grocery/views/cart/widgets/add_cart_item_bottom_sheet.dart';
import 'package:grocery/views/cart/widgets/barcode_scanner_button.dart';
import 'package:grocery/views/cart/widgets/cart_list_bottom_sheet.dart';
import 'package:grocery/views/cart/widgets/cart_summary.dart';
import 'package:grocery/views/cart/widgets/close_cart_button.dart';
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
    Navigator.of(context).pop();
    context.read<CartDAO>().closeCart(DateTime.now());
  }

  void onOpenCartList() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CartListBottomSheet();
      },
    );
  }

  void openScanner([CartItemData? item]) async {
    // final Product? product = await Navigator.of(
    //   context,
    // ).push(MaterialPageRoute(builder: (context) => ScannerScreen()));

    final product = Product(name: 'teste', barCode: '123123');

    if (product == null) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return AddCartItemBottomSheet(
          barcode: product.barCode,
          name: item?.name ?? product.name ?? 'Sem nome',
          quantity: item?.quantity,
          id: item?.id,
          categoryCode: item?.categoryCode,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            StreamBuilder(
              stream: context.read<CartDAO>().watchOpenCart(),
              builder: (context, stream) {
                return TimerHeader(
                  startedAt: stream.data?.createdAt ?? DateTime.now(),
                );
              },
            ),
            const SizedBox(height: 16),
            StreamBuilder(
              stream: context.read<CartDAO>().watchOpenCartTotalPrice(),
              builder: (context, stream) {
                return CartSummary(
                  totalValue: stream.data ?? 0,
                  onTap: onOpenCartList,
                );
              },
            ),
            const SizedBox(height: 16),
            BarcodeScannerButton(onTap: openScanner),
            const SizedBox(height: 16),
            CloseCartButton(onCloseCart: closeCart),
            const SizedBox(height: 16),
            StreamBuilder(
              stream: context.read<CartDAO>().watchOpenCartItemsToScan(),
              builder: (context, stream) {
                return NextItemsList(
                  items: stream.data ?? [],
                  onOpenScanner: (item) => openScanner(item),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
