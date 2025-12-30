import 'package:flutter/material.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:intl/intl.dart';

class CartSummary extends StatelessWidget {
  final double totalValue;
  final int itemCount;

  const CartSummary({
    super.key,
    required this.totalValue,
    required this.itemCount,
  });

  static final _currencyFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: NeoCard(
          backgroundColor: Colors.green,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('carrinho • $itemCount items'),
                const SizedBox(height: 8),
                Text(
                  _currencyFormat.format(totalValue),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
