import 'package:flutter/material.dart';
import 'package:grocery/daos/cart_dao.dart';
import 'package:grocery/views/home/cart_screen.dart';
import 'package:grocery/widgets/neo_button.dart';
import 'package:grocery/widgets/neo_card.dart';
import 'package:grocery/widgets/neo_list_tile.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void createNewItem() async {
    await context.read<CartDAO>().createPreCartItem(
      name: 'Pizza',
      quantity: '12un',
      emoji: '🍕',
    );
  }

  void toggleCartItem(int cartItemId) {
    context.read<CartDAO>().toggleCartItem(cartItemId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            NeoCard(
              backgroundColor: Colors.green,
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => CartScreen()));
              },
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
                  onPressed: () => createNewItem(),
                  backgroundColor: Color(0xFFFFE156),
                  shadowOffset: 4,
                ),
              ],
            ),
            const SizedBox(height: 16),

            StreamBuilder(
              stream: context.read<CartDAO>().watchPreCartItems(),
              builder: (context, stream) {
                if (stream.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return NeoListTile(
                        emoji: stream.data![index].emoji,
                        title: stream.data![index].name,
                        subtitle: stream.data![index].quantity,
                        checked: stream.data![index].checked,
                        onTap: () => toggleCartItem(stream.data![index].id),
                      );
                    },
                    separatorBuilder: (_, _) => SizedBox(height: 16),
                    itemCount: stream.data!.length,
                  );
                }

                return Text('Sem Itens');
              },
            ),
          ],
        ),
      ),
    );
  }
}
