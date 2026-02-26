import 'package:cartly/database/cart_table.dart';
import 'package:cartly/database/helpers.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
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
      name: 'cartly_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  Future<List<CartItemData>> getPreCartItems() {
    return (select(cartItem)
          ..where((item) => item.cartId.isNull() & item.checked.equals(false))
          ..orderBy([(item) => OrderingTerm.desc(item.createdAt)]))
        .get();
  }

  Stream<List<CartItemData>> watchPreCartItems() {
    return (select(cartItem)
          ..where((item) => item.cartId.isNull())
          ..orderBy([(item) => OrderingTerm.desc(item.createdAt)]))
        .watch();
  }

  Future<int> createCart() {
    return into(cart).insert(CartCompanion(timerValue: Value(0)));
  }

  Stream<CartData?> watchOpenCart() {
    return (select(
      cart,
    )..where((cart) => cart.finishedAt.isNull())).watchSingleOrNull();
  }

  Future<CartData?> getOpenCart() {
    return (select(
      cart,
    )..where((cart) => cart.finishedAt.isNull())).getSingleOrNull();
  }

  Stream<double?> watchOpenCartTotalPrice() {
    return switchOnOpenCartOrNull(
      watchOpenCart(),
      (cartId) =>
          (selectOnly(cartItem)
                ..addColumns([cartItem.price.sum()])
                ..where(
                  cartItem.cartId.equals(cartId) &
                      cartItem.checked.equals(true),
                ))
              .watchSingle()
              .map((row) => row.read(cartItem.price.sum()) ?? 0.0),
    );
  }

  Stream<List<CartItemData>?> watchOpenCartItems() {
    return switchOnOpenCartOrNull(
      watchOpenCart(),
      (cartId) =>
          (select(cartItem)..where(
                (cartItem) =>
                    cartItem.cartId.equals(cartId) &
                    cartItem.checked.equals(true),
              ))
              .watch(),
    );
  }

  Future<void> deleteCartItem(int cartItemId) {
    return (delete(
      cartItem,
    )..where((cartItem) => cartItem.id.equals(cartItemId))).go();
  }

  Stream<List<CartItemData>?> watchOpenCartItemsToScan() {
    return switchOnOpenCartOrNull(
      watchOpenCart(),
      (cartId) =>
          (select(cartItem)..where(
                (cartItem) =>
                    cartItem.cartId.isNull() & cartItem.checked.equals(false),
              ))
              .watch(),
    );
  }

  Future<List<CartData?>> getCarts() {
    return (select(cart)..where((cart) => cart.finishedAt.isNotNull())).get();
  }

  Future<void> closeCart(int cartId, DateTime fishinedAt) async {
    await (update(cart)..where((cart) => cart.id.equals(cartId))).write(
      CartCompanion(finishedAt: Value(fishinedAt)),
    );
  }

  Future<int> createPreCartItem(CartItemCompanion newItem) {
    return into(cartItem).insert(newItem);
  }

  Future<void> addExistingItemToOpenCart(CartItemCompanion updatedItem) async {
    var currentCart = await getOpenCart();

    if (currentCart == null) {
      return;
    }

    await (update(
      cartItem,
    )..where((item) => item.id.equals(updatedItem.id.value))).write(
      updatedItem.copyWith(cartId: Value(currentCart.id), checked: Value(true)),
    );
  }

  Future<void> createNewItemToOpenCart(CartItemCompanion newItem) async {
    var currentCart = await getOpenCart();

    if (currentCart == null) {
      return;
    }

    await (into(cartItem).insertReturning(newItem));
  }

  Future<List<CartItemData>> getCartItems(int cartId) {
    return (select(
      cartItem,
    )..where((item) => item.cartId.equals(cartId))).get();
  }

  Future<int> toggleCartItem(int cartItemId) {
    return (update(cartItem)..where((item) => item.id.equals(cartItemId)))
        .write(CartItemCompanion.custom(checked: cartItem.checked.not()));
  }
}
