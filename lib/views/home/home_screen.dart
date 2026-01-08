import 'package:flutter/material.dart';
import 'package:cartly/daos/cart_dao.dart';
import 'package:cartly/views/home/widgets/cart_home_summary.dart';
import 'package:cartly/views/home/widgets/cart_item_options_bottom_sheet.dart';
import 'package:cartly/views/home/widgets/cart_items_list.dart';
import 'package:cartly/views/home/widgets/create_cart_item_bottom_sheet.dart';
import 'package:cartly/views/home/widgets/open_cart_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void createNewCartItem() async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CreateCartItemBottomSheet();
      },
    );
  }

  void showCartItemOptions(int cartItemId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return CartItemOptionsBottomSheet(id: cartItemId);
      },
    );
  }

  void toggleCartItem(int cartItemId) {
    context.read<CartDAO>().toggleCartItem(cartItemId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                StreamBuilder(
                  stream: context.read<CartDAO>().watchOpenCartTotalPrice(),
                  builder: (context, stream) {
                    if (!stream.hasData || stream.data == null) {
                      return SizedBox.shrink();
                    }

                    return CartHomeSummary(totalValue: stream.data ?? 0);
                  },
                ),
                const SizedBox(height: 16),
                StreamBuilder(
                  stream: context.read<CartDAO>().watchPreCartItems(),
                  builder: (context, stream) {
                    return CartItemsList(
                      items: stream.data ?? [],
                      onAddNewItem: createNewCartItem,
                      onItemToggled: toggleCartItem,
                      onTapOption: showCartItemOptions,
                    );
                  },
                ),
              ],
            ),
            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: StreamBuilder(
                stream: context.read<CartDAO>().watchOpenCartTotalPrice(),
                builder: (context, stream) {
                  return OpenCartButton(canOpen: stream.hasData);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
