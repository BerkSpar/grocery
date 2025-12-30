import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:grocery/database/cart_table.dart';
import 'package:path_provider/path_provider.dart';
import 'cart_item_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Cart, CartItem])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'grocery_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  Future<List<CartItemData>> getPreCartItems() {
    return (select(cartItem)..where((item) => item.cartId.isNull())).get();
  }

  Stream<List<CartItemData>> watchPreCartItems() {
    return (select(cartItem)..where((item) => item.cartId.isNull())).watch();
  }

  Future<int> createCart() async {
    return into(cart).insert(CartCompanion(timerValue: Value(0)));
  }

  Future<CartData?> getOpenCart() {
    return (select(
      cart,
    )..where((cart) => cart.finishedAt.isNull())).getSingleOrNull();
  }

  Future<List<CartData?>> getCarts() {
    return (select(cart)..where((cart) => cart.finishedAt.isNotNull())).get();
  }

  void closeCart(int cartId, int timerValue, DateTime fishinedAt) {
    (update(cart)..where((cart) => cart.id.equals(cartId))).write(
      CartCompanion(
        timerValue: Value(timerValue),
        finishedAt: Value(fishinedAt),
      ),
    );
  }

  Future<int> createPreCartItem(CartItemCompanion newItem) {
    return into(cartItem).insert(newItem);
  }

  Future<int?> addExistingItemToOpenCart(CartItemData existingItem) async {
    var currentCart = await getOpenCart();

    if (currentCart == null) {
      return null;
    }

    var newItem = CartItemCompanion(
      cartId: Value(currentCart.id),
      name: Value(existingItem.name),
      quantity: Value(existingItem.quantity),
      emoji: Value(existingItem.emoji),
      barCode: Value(existingItem.barCode),
    );

    return await (into(cartItem).insert(newItem));
  }

  Future<int?> createNewItemToOpenCart(CartItemCompanion newItem) async {
    var currentCart = await getOpenCart();

    if (currentCart == null) {
      return null;
    }

    return await (into(cartItem).insert(newItem));
  }

  Future<List<CartItemData>> getCartItems(int cartId) {
    return (select(
      cartItem,
    )..where((item) => item.cartId.equals(cartId))).get();
  }

  Stream<List<CartItemData>> watchCartItems(int cartId) {
    return (select(
      cartItem,
    )..where((item) => item.cartId.equals(cartId))).watch();
  }

  Future<int> toggleCartItem(int cartItemId) async {
    return (update(cartItem)..where((item) => item.id.equals(cartItemId)))
        .write(CartItemCompanion.custom(checked: cartItem.checked.not()));
  }
}
