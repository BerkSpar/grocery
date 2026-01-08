import 'package:flutter/material.dart';
import 'package:cartly/database/database.dart';
import 'package:cartly/extensions/context_extensions.dart';
import 'package:cartly/widgets/neo_card.dart';
import 'package:cartly/widgets/neo_list_tile.dart';

class CartItemsList extends StatelessWidget {
  final VoidCallback onAddNewItem;
  final Function(int id) onItemToggled;
  final Function(int id) onTapOption;
  final List<CartItemData> items;

  const CartItemsList({
    super.key,
    required this.onAddNewItem,
    required this.items,
    required this.onItemToggled,
    required this.onTapOption,
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
                  context.l10n.emptyListMessage,
                  style: TextStyle(fontSize: 20),
                  textAlign: .center,
                ),
                const SizedBox(height: 16),
                NeoCard(
                  onTap: onAddNewItem,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    context.l10n.add,
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
                  context.l10n.shoppingList,
                  style: TextStyle(fontWeight: .bold, fontSize: 20),
                ),
                NeoCard(
                  onTap: onAddNewItem,
                  backgroundColor: Color(0xFFFFE156),
                  shadowOffset: 4,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    context.l10n.add,
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
                    onTapOption: () => onTapOption(item.id),
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
