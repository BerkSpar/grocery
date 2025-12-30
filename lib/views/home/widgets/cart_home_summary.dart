import 'package:flutter/material.dart';
import 'package:grocery/views/cart/cart_screen.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CartHomeSummary extends StatelessWidget {
  final double totalValue;

  const CartHomeSummary({super.key, required this.totalValue});

  static final _currencyFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: NeoCard(
        backgroundColor: Colors.green,
        onTap: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => CartScreen()));
        },
        child: Row(
          crossAxisAlignment: .end,
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                Text('Total no carrinho'),
                Text(
                  _currencyFormat.format(totalValue),
                  style: TextStyle(fontSize: 32, fontWeight: .bold),
                ),
              ],
            ),
            PhosphorIcon(PhosphorIconsBold.arrowCircleRight),
          ],
        ),
      ),
    );
  }
}
