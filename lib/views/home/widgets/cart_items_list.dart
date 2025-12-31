import 'package:flutter/material.dart';
import 'package:grocery/database/database.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:grocery/widgets/neo_list_tile.dart';

class CartItemsList extends StatelessWidget {
  final VoidCallback onAddNewItem;
  final Function(int id) onItemToggled;
  final List<CartItemData> items;

  const CartItemsList({
    super.key,
    required this.onAddNewItem,
    required this.items,
    required this.onItemToggled,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Expanded(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: .min,
              children: [
                Text(
                  'Você ainda não tem itens na\nsua lista de compra',
                  style: TextStyle(fontSize: 20),
                  textAlign: .center,
                ),
                const SizedBox(height: 16),
                NeoCard(
                  onTap: onAddNewItem,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    'adicionar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'Lista de compras',
                  style: TextStyle(fontWeight: .bold, fontSize: 20),
                ),
                NeoCard(
                  onTap: onAddNewItem,
                  backgroundColor: Color(0xFFFFE156),
                  shadowOffset: 4,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    'adicionar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(bottom: 120),
                itemBuilder: (_, index) {
                  final item = items[index];

                  return NeoListTile(
                    emoji: item.emoji,
                    title: item.name,
                    subtitle: item.quantity,
                    checked: item.checked,
                    onTap: () => onItemToggled(item.id),
                  );
                },
                separatorBuilder: (_, _) => SizedBox(height: 16),
                itemCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
