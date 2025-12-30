import 'package:flutter/material.dart';
import 'package:grocery/database/cart_item_table.dart';
import 'package:grocery/extensions/list_extension.dart';
import 'package:grocery/widgets/neo_button.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:grocery/widgets/neo_list_tile.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CartItem> items = [
    CartItem(),
    CartItem(),
    CartItem(),
    CartItem(),
    CartItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            NeoCard(
              backgroundColor: Colors.green,
              onTap: () {},
              child: Row(
                crossAxisAlignment: .end,
                mainAxisAlignment: .spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text('Total no carrinho'),
                      Text(
                        '\$ 14,35',
                        style: TextStyle(fontSize: 32, fontWeight: .bold),
                      ),
                    ],
                  ),
                  PhosphorIcon(PhosphorIconsBold.arrowCircleRight),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'Lista de compras',
                  style: TextStyle(fontWeight: .bold, fontSize: 20),
                ),
                NeoButton(
                  text: 'adicionar',
                  onPressed: () {},
                  backgroundColor: Color(0xFFFFE156),
                  shadowOffset: 4,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, _) {
                return NeoListTile(
                  emoji: ['🥛', '🧀', '🍞'].random(),
                  title: ['batata', 'leite', 'açucar'].random(),
                  subtitle: ['200g', '1kg', '5un'].random(),
                  checked: [true, false].random(),
                );
              },
              separatorBuilder: (_, _) => SizedBox(height: 16),
              itemCount: items.length,
            ),
          ],
        ),
      ),
    );
  }
}
