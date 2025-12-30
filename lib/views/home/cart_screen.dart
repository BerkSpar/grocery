import 'package:flutter/material.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: NeoCard(
                backgroundColor: Colors.green,
                child: SizedBox(
                  width: .maxFinite,
                  child: Column(
                    children: [
                      Text('carrinho • 10 items'),
                      const SizedBox(height: 8),
                      Text(
                        '\$ 14,35',
                        style: TextStyle(fontSize: 40, fontWeight: .bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: NeoCard(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      'Ler código de barras',
                      style: TextStyle(fontSize: 20, fontWeight: .bold),
                    ),
                    PhosphorIcon(PhosphorIconsBold.barcode),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('LISTA DE COMPRAS • TOQUE PARA SCANNEAR'),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 110,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, _) => NeoCard(
                  backgroundColor: Colors.white,
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Text('🧀', style: TextStyle(fontSize: 24)),
                        Text(
                          'batata asdasd. asdasd',
                          maxLines: 1,
                          textAlign: .center,
                          overflow: .ellipsis,
                        ),
                        Text('1kg', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
                itemCount: 10,
                separatorBuilder: (_, _) => SizedBox(width: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
