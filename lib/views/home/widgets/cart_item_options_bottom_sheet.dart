import 'package:flutter/material.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CartItemOptionsBottomSheet extends StatelessWidget {
  final int id;

  const CartItemOptionsBottomSheet({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: .min,
          children: [
            SizedBox(height: 4),
            SizedBox(width: 40, child: Divider(thickness: 3)),
            SizedBox(height: 12),
            NeoCard(
              onTap: () {},
              padding: EdgeInsetsGeometry.all(8),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Editar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  PhosphorIcon(PhosphorIconsBold.pencilSimple),
                ],
              ),
            ),
            SizedBox(height: 8),
            NeoCard(
              onTap: () {},
              padding: EdgeInsetsGeometry.all(8),
              backgroundColor: Colors.redAccent,
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Apagar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  PhosphorIcon(PhosphorIconsBold.trashSimple),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
