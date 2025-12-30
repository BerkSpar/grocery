import 'package:flutter/material.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CloseCartButton extends StatelessWidget {
  final VoidCallback onCloseCart;

  const CloseCartButton({super.key, required this.onCloseCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: NeoCard(
        onTap: onCloseCart,
        backgroundColor: Colors.redAccent,
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              'Encerrar compras',
              style: TextStyle(fontSize: 16, fontWeight: .bold),
            ),
            PhosphorIcon(PhosphorIconsBold.xCircle),
          ],
        ),
      ),
    );
  }
}
