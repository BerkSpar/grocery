import 'package:flutter/material.dart';
import 'package:grocery/extensions/context_extensions.dart';
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
        holdToConfirm: true,
        holdProgressColor: Colors.greenAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.holdToFinish,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            PhosphorIcon(PhosphorIconsBold.xCircle),
          ],
        ),
      ),
    );
  }
}
