import 'package:flutter/material.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BarcodeScannerButton extends StatelessWidget {
  final VoidCallback onTap;

  const BarcodeScannerButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: NeoCard(
          onTap: onTap,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhosphorIcon(PhosphorIconsBold.barcode, size: 64),
                const SizedBox(height: 16),
                Text(
                  'Ler código de barras',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
