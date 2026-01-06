import 'package:flutter/material.dart';
import 'package:grocery/extensions/context_extensions.dart';
import 'package:grocery/views/cart/cart_screen.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CartHomeSummary extends StatefulWidget {
  final double totalValue;

  const CartHomeSummary({super.key, required this.totalValue});

  @override
  State<CartHomeSummary> createState() => _CartHomeSummaryState();
}

class _CartHomeSummaryState extends State<CartHomeSummary> {
  late final _currencyFormat = NumberFormat.currency(
    locale: Localizations.localeOf(context).languageCode,
    symbol: context.l10n.prefixMoneySymbol,
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: NeoCard(
        backgroundColor: Colors.orangeAccent,
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
                Text(context.l10n.totalInCart),
                Text(
                  _currencyFormat.format(widget.totalValue),
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
