import 'package:flutter/material.dart';
import 'package:cartly/database/database.dart';
import 'package:cartly/extensions/context_extensions.dart';
import 'package:cartly/widgets/neo_card.dart';

class NextItemsList extends StatelessWidget {
  final List<CartItemData> items;
  final Function(CartItemData item) onOpenScanner;

  const NextItemsList({
    super.key,
    required this.items,
    required this.onOpenScanner,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(context.l10n.shoppingListTapToScan),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final item = items[index];

              return NeoCard(
                onTap: () => onOpenScanner(item),
                backgroundColor: Colors.white,
                child: SizedBox(
                  width: 100,
                  child: Column(
                    children: [
                      Text(item.emoji, style: TextStyle(fontSize: 24)),
                      Text(
                        item.name,
                        maxLines: 1,
                        textAlign: .center,
                        overflow: .ellipsis,
                      ),
                      Text(
                        item.quantity,
                        style: TextStyle(fontSize: 12),
                        maxLines: 1,
                        textAlign: .center,
                        overflow: .ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: items.length,
            separatorBuilder: (_, _) => SizedBox(width: 16),
          ),
        ),
      ],
    );
  }
}
