import 'package:flutter/material.dart';
import 'package:cartly/extensions/context_extensions.dart';
import 'package:cartly/utils/currency_utils.dart';
import 'package:cartly/widgets/neo_card.dart';

class CartSummary extends StatefulWidget {
  final double totalValue;
  final VoidCallback onTap;

  const CartSummary({super.key, required this.totalValue, required this.onTap});

  @override
  State<CartSummary> createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {
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
                  CurrencyUtils.getFormattedLocalizedPrice(
                    context,
                    widget.totalValue,
                  ),
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
