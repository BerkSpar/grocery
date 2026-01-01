import 'package:flutter/material.dart';
import 'package:grocery/daos/cart_dao.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class CartListBottomSheet extends StatelessWidget {
  const CartListBottomSheet({super.key});

  static final _currencyFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

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
                  children: [Text('Não há itens no carrinho')],
                );
              }

              return Column(
                spacing: 16,
                mainAxisSize: .min,
                children: (stream.data ?? [])
                    .map(
                      (item) => NeoCard(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        backgroundColor: Colors.white,
                        child: Row(
                          crossAxisAlignment: .center,
                          children: [
                            Text(item.emoji, style: TextStyle(fontSize: 20)),
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
                                    '${item.quantity} • ${_currencyFormat.format(item.price)}',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                context.read<CartDAO>().deleteCartItem(item.id);
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
                      ),
                    )
                    .toList(),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
