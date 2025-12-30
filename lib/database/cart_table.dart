import 'package:drift/drift.dart';

class Cart extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get timerValue => integer()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get finishedAt => dateTime().nullable()();
}
