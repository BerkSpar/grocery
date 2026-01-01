import 'package:drift/drift.dart';
import 'package:grocery/database/database.dart';

class CartDAO {
  late AppDatabase _database;

  CartDAO() {
    _database = AppDatabase();
  }

  Future<List<CartItemData>> getPreCartItems() async {
    return await _database.getPreCartItems();
  }

  Stream<List<CartItemData>> watchPreCartItems() {
    return _database.watchPreCartItems();
  }

  Stream<List<CartItemData>?> watchOpenCartItemsToScan() {
    return _database.watchOpenCartItemsToScan();
  }

  Future<int> createPreCartItem({
    required String name,
    required String quantity,
    required String emoji,
  }) async {
    return await _database.createPreCartItem(
      CartItemCompanion(
        name: Value(name),
        price: Value(0.0),
        quantity: Value(quantity),
        emoji: Value(emoji),
      ),
    );
  }

  Future<CartData?> getOpenCart() async {
    return await _database.getOpenCart();
  }

  Stream<CartData?> watchOpenCart() {
    return _database.watchOpenCart();
  }

  Stream<double?> watchOpenCartTotalPrice() {
    return _database.watchOpenCartTotalPrice();
  }

  Stream<List<CartItemData>?> watchOpenCartItems() {
    return _database.watchOpenCartItems();
  }

  Future<void> deleteCartItem(int cartItemId) {
    return _database.deleteCartItem(cartItemId);
  }

  Future<CartData?> createCart() async {
    var currentCart = await _database.getOpenCart();

    if (currentCart != null) {
      throw Exception("A cart is already opened");
    }

    await _database.createCart();

    CartData? openCart = await _database.getOpenCart();

    return openCart;
  }

  void createNewItemToOpenCart(
    String name,
    String quantity,
    double price,
    String emoji,
    String barCode,
    bool checked,
  ) async {
    var currentCart = await _database.getOpenCart();

    CartItemCompanion newItem = CartItemCompanion(
      cartId: Value(currentCart!.id),
      name: Value(name),
      price: Value(price),
      quantity: Value(quantity),
      emoji: Value(emoji),
      barCode: Value(barCode),
      checked: Value(checked),
    );

    await _database.createNewItemToOpenCart(newItem);
  }

  void addExistingItemToOpenCart(
    String name,
    String quantity,
    double price,
    String emoji,
    String barCode,
    String categoryCode,
    bool checked,
  ) async {
    CartItemCompanion newItem = CartItemCompanion(
      name: Value(name),
      price: Value(price),
      quantity: Value(quantity),
      emoji: Value(emoji),
      barCode: Value(barCode),
      categoryCode: Value(categoryCode),
      checked: Value(checked),
    );

    await _database.createNewItemToOpenCart(newItem);
  }

  void closeCart(DateTime fishinedAt) async {
    var currentCart = await _database.getOpenCart();

    if (currentCart == null) return;

    _database.closeCart(currentCart.id, DateTime.now());
  }

  Future<int> toggleCartItem(int cartItemId) async {
    return await _database.toggleCartItem(cartItemId);
  }
}
