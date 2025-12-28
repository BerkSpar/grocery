import 'package:drift/drift.dart';

class CartItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 32)();
  TextColumn get quantity => text().named('body')();
  TextColumn get emoji => text().withLength(min: 1, max: 8)();
  BoolColumn get checked => boolean().clientDefault(() => false)();
  DateTimeColumn get createdAt => dateTime().nullable()();
}
