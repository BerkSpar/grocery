import 'package:flutter/material.dart';
import 'package:grocery/daos/cart_dao.dart';
import 'package:grocery/services/emoji_suggestion_service.dart';
import 'package:grocery/utils/currency_input_formatter.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:grocery/widgets/neo_field.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class AddCartItemBottomSheet extends StatefulWidget {
  final String? name;
  final String? barcode;

  const AddCartItemBottomSheet({super.key, this.barcode, this.name});

  @override
  State<AddCartItemBottomSheet> createState() => _AddCartItemBottomSheetState();
}

class _AddCartItemBottomSheetState extends State<AddCartItemBottomSheet> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.name ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _nameController.text.trim();
    final priceText = _priceController.text.trim();

    if (name.isEmpty || priceText.isEmpty) return;

    final price = double.tryParse(priceText.replaceAll(',', '.')) ?? 0.0;
    final emoji = EmojiSuggestionService.instance.suggestEmoji(name);

    context.read<CartDAO>().createNewItemToOpenCart(
      name,
      '',
      price,
      emoji,
      widget.barcode ?? '',
      true,
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
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 4),
              SizedBox(width: 40, child: Divider(thickness: 3)),
              SizedBox(height: 12),
              NeoField(hintText: 'Nome do item', controller: _nameController),
              SizedBox(height: 8),
              NeoField(
                hintText: 'Preço',
                controller: _priceController,
                keyboardType: TextInputType.number,
                prefixText: '\$ ',
                inputFormatters: [CurrencyInputFormatter()],
              ),
              SizedBox(height: 16),
              NeoCard(
                onTap: _submit,
                padding: EdgeInsetsGeometry.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Adicionar ao carrinho',
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
      ),
    );
  }
}
