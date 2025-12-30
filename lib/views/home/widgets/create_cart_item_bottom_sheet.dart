import 'package:flutter/material.dart';
import 'package:grocery/daos/cart_dao.dart';
import 'package:grocery/services/emoji_suggestion_service.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:grocery/widgets/neo_field.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class CreateCartItemBottomSheet extends StatefulWidget {
  const CreateCartItemBottomSheet({super.key});

  @override
  State<CreateCartItemBottomSheet> createState() =>
      _CreateCartItemBottomSheetState();
}

class _CreateCartItemBottomSheetState extends State<CreateCartItemBottomSheet> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _nameController.text.trim();
    final quantity = _quantityController.text.trim();

    if (name.isEmpty || quantity.isEmpty) return;

    final emoji = EmojiSuggestionService.instance.suggestEmoji(name);

    context.read<CartDAO>().createPreCartItem(
      name: name,
      quantity: quantity,
      emoji: emoji,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 4),
            SizedBox(width: 40, child: Divider(thickness: 3)),
            SizedBox(height: 12),
            NeoField(hintText: 'Nome do item', controller: _nameController),
            SizedBox(height: 8),
            NeoField(hintText: 'Quantidade', controller: _quantityController),
            SizedBox(height: 16),
            NeoCard(
              onTap: _submit,
              padding: EdgeInsetsGeometry.all(8),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Adicionar à lista',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  PhosphorIcon(PhosphorIconsBold.plusCircle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
