import 'package:drift/drift.dart';

class Cart extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get timerValue => integer()();
  //List<CartItem> get cartItems => cartItems;
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get finishedAt => dateTime().nullable()();
}
