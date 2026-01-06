import 'package:flutter/material.dart';
import 'package:grocery/extensions/context_extensions.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:intl/intl.dart';

class CartSummary extends StatefulWidget {
  final double totalValue;
  final VoidCallback onTap;

  const CartSummary({super.key, required this.totalValue, required this.onTap});

  @override
  State<CartSummary> createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {
  late final _currencyFormat = NumberFormat.currency(
    locale: Localizations.localeOf(context).languageCode,
    symbol: context.l10n.prefixMoneySymbol,
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: NeoCard(
          onTap: widget.onTap,
          backgroundColor: Colors.greenAccent,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.l10n.totalInCart),
                const SizedBox(height: 8),
                Text(
                  _currencyFormat.format(widget.totalValue),
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
