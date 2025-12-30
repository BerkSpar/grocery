import 'package:drift/drift.dart';
import 'package:grocery/database/cart_table.dart';

class CartItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cartId => integer().references(Cart, #id).nullable()();
  TextColumn get name => text().withLength(min: 6, max: 32)();
  TextColumn get quantity => text().named('body')();
  TextColumn get emoji => text().withLength(min: 1, max: 8)();
  TextColumn get barCode => text()();
  BoolColumn get checked => boolean().clientDefault(() => false)();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
