import 'package:flutter/material.dart';
import 'package:grocery/daos/cart_dao.dart';
import 'package:grocery/extensions/context_extensions.dart';
import 'package:grocery/services/emoji_suggestion_service.dart';
import 'package:grocery/utils/currency_utils.dart';
import 'package:grocery/utils/currency_input_formatter.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:grocery/widgets/neo_field.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class AddCartItemBottomSheet extends StatefulWidget {
  final String? name;
  final String? barcode;
  final String? quantity;
  final String? categoryCode;
  final int? id;

  const AddCartItemBottomSheet({
    super.key,
    this.barcode,
    this.name,
    this.quantity,
    this.categoryCode,
    this.id,
  });

  @override
  State<AddCartItemBottomSheet> createState() => _AddCartItemBottomSheetState();
}

class _AddCartItemBottomSheetState extends State<AddCartItemBottomSheet> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.name ?? '';
    _quantityController.text = widget.quantity ?? '';
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
    final quantity = _quantityController.text.trim();

    if (name.isEmpty || priceText.isEmpty) return;

    final price = CurrencyUtils.tryParseCurrencyStringToDouble(priceText);
    final locale = Localizations.localeOf(context).languageCode;
    final emoji = EmojiSuggestionService.instance.suggestEmoji(
      name,
      languageCode: locale,
    );

    if (widget.id != null) {
      context.read<CartDAO>().addExistingItemToOpenCart(
        widget.id!,
        name,
        quantity,
        price,
        emoji,
        widget.barcode,
        widget.categoryCode,
      );
    } else {
      context.read<CartDAO>().createNewItemToOpenCart(
        name,
        quantity,
        price,
        emoji,
        widget.barcode,
        widget.categoryCode,
      );
    }

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
              NeoField(
                hintText: context.l10n.itemName,
                controller: _nameController,
              ),
              SizedBox(height: 8),
              NeoField(
                hintText: context.l10n.quantity,
                controller: _quantityController,
              ),
              SizedBox(height: 8),
              NeoField(
                hintText: context.l10n.price,
                controller: _priceController,
                keyboardType: TextInputType.number,
                prefixText: context.l10n.prefixMoneySymbol,
                inputFormatters: [
                  CurrencyInputFormatter(
                    formatter: NumberFormat.currency(
                      locale: Localizations.localeOf(context).languageCode,
                      symbol: '',
                    ),
                  ),
                ],
                maxLength: 12,
              ),
              SizedBox(height: 16),
              NeoCard(
                onTap: _submit,
                padding: EdgeInsetsGeometry.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.addToCart,
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
