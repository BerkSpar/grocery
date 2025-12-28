import 'package:grocery/database/database.dart';
import 'package:grocery/models/cart_item.dart';

class CartController {
  late AppDatabase _database;

  CartController() {
    _database = AppDatabase();
  }

  List<CartItem> precart = [];
}
