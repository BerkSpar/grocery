import 'package:drift/drift.dart';
import 'package:cartly/database/cart_table.dart';

class CartItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cartId => integer().references(Cart, #id).nullable()();
  TextColumn get name => text().withLength(min: 3)();
  TextColumn get quantity => text()();
  RealColumn get price => real()();
  TextColumn get emoji => text()();
  TextColumn get barCode => text().nullable()();
  TextColumn get categoryCode => text().nullable()();
  BoolColumn get checked => boolean().clientDefault(() => false)();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
