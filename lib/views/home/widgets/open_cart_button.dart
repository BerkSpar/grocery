import 'dart:developer';

import 'package:cartly/daos/cart_dao.dart';
import 'package:cartly/extensions/context_extensions.dart';
import 'package:cartly/views/cart/cart_screen.dart';
import 'package:cartly/widgets/neo_card.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class OpenCartButton extends StatefulWidget {
  final bool canOpen;

  const OpenCartButton({super.key, required this.canOpen});

  @override
  State<OpenCartButton> createState() => _OpenCartButtonState();
}

class _OpenCartButtonState extends State<OpenCartButton> {
  void createCartAndNavigate() {
    try {
      context.read<CartDAO>().createCart();
      navigateToCart();
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  void navigateToCart() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => CartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NeoCard(
        onTap: widget.canOpen ? navigateToCart : createCartAndNavigate,
        backgroundColor: Colors.orangeAccent,
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: .min,
          spacing: 8,
          children: [
            Text(
              widget.canOpen
                  ? context.l10n.openCart
                  : context.l10n.startShopping,
              style: TextStyle(fontSize: 16, fontWeight: .bold),
            ),
            widget.canOpen
                ? PhosphorIcon(PhosphorIconsBold.shoppingBagOpen, size: 20)
                : PhosphorIcon(PhosphorIconsBold.shoppingBag, size: 20),
          ],
        ),
      ),
    );
  }
}
