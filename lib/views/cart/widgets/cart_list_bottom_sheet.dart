import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/daos/cart_dao.dart';
import 'package:grocery/extensions/context_extensions.dart';
import 'package:grocery/utils/currency_utils.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class CartListBottomSheet extends StatefulWidget {
  const CartListBottomSheet({super.key});

  @override
  State<CartListBottomSheet> createState() => _CartListBottomSheetState();
}

class _CartListBottomSheetState extends State<CartListBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: .min,
        children: [
          const SizedBox(height: 4),
          const SizedBox(width: 40, child: Divider(thickness: 3)),
          const SizedBox(height: 12),
          StreamBuilder(
            stream: context.read<CartDAO>().watchOpenCartItems(),
            builder: (context, stream) {
              if ((stream.data ?? []).isEmpty) {
                return Row(
                  mainAxisAlignment: .center,
                  children: [Text(context.l10n.noItemsInCart)],
                );
              }

              return Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: (stream.data ?? []).length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),

                  itemBuilder: (context, index) {
                    final item = stream.data![index];

                    return NeoCard(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      backgroundColor: Colors.white,
                      child: Row(
                        crossAxisAlignment: .center,
                        children: [
                          Text(item.emoji, style: TextStyle(fontSize: 30)),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  item.name,
                                  maxLines: 1,
                                  overflow: .ellipsis,
                                ),
                                Text(
                                  '${item.quantity} • ${CurrencyUtils.getFormattedLocalizedPrice(context, item.price)}',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<CartDAO>().deleteCartItem(item.id);
                              HapticFeedback.lightImpact();
                            },
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: PhosphorIcon(
                                PhosphorIconsBold.trashSimple,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
