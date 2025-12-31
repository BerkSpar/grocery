import 'package:grocery/models/cart_item.dart';

class Cart {
  Cart(this.id, this.timerValue, this.items, this.createdAt, this.finishedAt);

  String id;
  int timerValue;
  List<CartItem> items = [];
  DateTime createdAt;
  DateTime? finishedAt;
}
