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

  Future<CartData?> createCart() async {
    var currentCart = await _database.getOpenCart();

    if (currentCart != null) {
      throw Exception("A cart is already opened");
    }

    await _database.createCart();

    var preCartItems = await _database.getPreCartItems();

    for (var item in preCartItems) {
      await _database.addExistingItemToOpenCart(item);
    }

    return _database.getOpenCart();
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

  void closeCart(int timerValue) async {
    var currentCart = await _database.getOpenCart();

    if (currentCart == null) return;

    _database.closeCart(currentCart.id, timerValue, DateTime.now());
  }

  Future<int> toggleCartItem(int cartItemId) async {
    return await _database.toggleCartItem(cartItemId);
  }
}
