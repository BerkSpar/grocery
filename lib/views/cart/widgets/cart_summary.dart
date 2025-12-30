import 'package:flutter/material.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:intl/intl.dart';

class CartSummary extends StatelessWidget {
  final double totalValue;

  const CartSummary({super.key, required this.totalValue});

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
          backgroundColor: Colors.greenAccent,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total no carrinho'),
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
