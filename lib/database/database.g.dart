// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CartItemTable extends CartItem
    with TableInfo<$CartItemTable, CartItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<String> quantity = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  @override
  late final GeneratedColumn<String> emoji = GeneratedColumn<String>(
    'emoji',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 8,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _checkedMeta = const VerificationMeta(
    'checked',
  );
  @override
  late final GeneratedColumn<bool> checked = GeneratedColumn<bool>(
    'checked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("checked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    quantity,
    emoji,
    checked,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_item';
  @override
  VerificationContext validateIntegrity(
    Insertable<CartItemData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['body']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('emoji')) {
      context.handle(
        _emojiMeta,
        emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta),
      );
    } else if (isInserting) {
      context.missing(_emojiMeta);
    }
    if (data.containsKey('checked')) {
      context.handle(
        _checkedMeta,
        checked.isAcceptableOrUnknown(data['checked']!, _checkedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartItemData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      emoji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emoji'],
      )!,
      checked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}checked'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $CartItemTable createAlias(String alias) {
    return $CartItemTable(attachedDatabase, alias);
  }
}

class CartItemData extends DataClass implements Insertable<CartItemData> {
  final int id;
  final String name;
  final String quantity;
  final String emoji;
  final bool checked;
  final DateTime? createdAt;
  const CartItemData({
    required this.id,
    required this.name,
    required this.quantity,
    required this.emoji,
    required this.checked,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['body'] = Variable<String>(quantity);
    map['emoji'] = Variable<String>(emoji);
    map['checked'] = Variable<bool>(checked);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  CartItemCompanion toCompanion(bool nullToAbsent) {
    return CartItemCompanion(
      id: Value(id),
      name: Value(name),
      quantity: Value(quantity),
      emoji: Value(emoji),
      checked: Value(checked),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory CartItemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartItemData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      quantity: serializer.fromJson<String>(json['quantity']),
      emoji: serializer.fromJson<String>(json['emoji']),
      checked: serializer.fromJson<bool>(json['checked']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'quantity': serializer.toJson<String>(quantity),
      'emoji': serializer.toJson<String>(emoji),
      'checked': serializer.toJson<bool>(checked),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  CartItemData copyWith({
    int? id,
    String? name,
    String? quantity,
    String? emoji,
    bool? checked,
    Value<DateTime?> createdAt = const Value.absent(),
  }) => CartItemData(
    id: id ?? this.id,
    name: name ?? this.name,
    quantity: quantity ?? this.quantity,
    emoji: emoji ?? this.emoji,
    checked: checked ?? this.checked,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  CartItemData copyWithCompanion(CartItemCompanion data) {
    return CartItemData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      checked: data.checked.present ? data.checked.value : this.checked,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartItemData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('emoji: $emoji, ')
          ..write('checked: $checked, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, quantity, emoji, checked, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartItemData &&
          other.id == this.id &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.emoji == this.emoji &&
          other.checked == this.checked &&
          other.createdAt == this.createdAt);
}

class CartItemCompanion extends UpdateCompanion<CartItemData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> quantity;
  final Value<String> emoji;
  final Value<bool> checked;
  final Value<DateTime?> createdAt;
  const CartItemCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.emoji = const Value.absent(),
    this.checked = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CartItemCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String quantity,
    required String emoji,
    this.checked = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       quantity = Value(quantity),
       emoji = Value(emoji);
  static Insertable<CartItemData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? quantity,
    Expression<String>? emoji,
    Expression<bool>? checked,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (quantity != null) 'body': quantity,
      if (emoji != null) 'emoji': emoji,
      if (checked != null) 'checked': checked,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CartItemCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? quantity,
    Value<String>? emoji,
    Value<bool>? checked,
    Value<DateTime?>? createdAt,
  }) {
    return CartItemCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      emoji: emoji ?? this.emoji,
      checked: checked ?? this.checked,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (quantity.present) {
      map['body'] = Variable<String>(quantity.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String>(emoji.value);
    }
    if (checked.present) {
      map['checked'] = Variable<bool>(checked.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartItemCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('emoji: $emoji, ')
          ..write('checked: $checked, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CartItemTable cartItem = $CartItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cartItem];
}

typedef $$CartItemTableCreateCompanionBuilder =
    CartItemCompanion Function({
      Value<int> id,
      required String name,
      required String quantity,
      required String emoji,
      Value<bool> checked,
      Value<DateTime?> createdAt,
    });
typedef $$CartItemTableUpdateCompanionBuilder =
    CartItemCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> quantity,
      Value<String> emoji,
      Value<bool> checked,
      Value<DateTime?> createdAt,
    });

class $$CartItemTableFilterComposer
    extends Composer<_$AppDatabase, $CartItemTable> {
  $$CartItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get checked => $composableBuilder(
    column: $table.checked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CartItemTableOrderingComposer
    extends Composer<_$AppDatabase, $CartItemTable> {
  $$CartItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get checked => $composableBuilder(
    column: $table.checked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CartItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $CartItemTable> {
  $$CartItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<bool> get checked =>
      $composableBuilder(column: $table.checked, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CartItemTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CartItemTable,
          CartItemData,
          $$CartItemTableFilterComposer,
          $$CartItemTableOrderingComposer,
          $$CartItemTableAnnotationComposer,
          $$CartItemTableCreateCompanionBuilder,
          $$CartItemTableUpdateCompanionBuilder,
          (
            CartItemData,
            BaseReferences<_$AppDatabase, $CartItemTable, CartItemData>,
          ),
          CartItemData,
          PrefetchHooks Function()
        > {
  $$CartItemTableTableManager(_$AppDatabase db, $CartItemTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CartItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CartItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CartItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> quantity = const Value.absent(),
                Value<String> emoji = const Value.absent(),
                Value<bool> checked = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
              }) => CartItemCompanion(
                id: id,
                name: name,
                quantity: quantity,
                emoji: emoji,
                checked: checked,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String quantity,
                required String emoji,
                Value<bool> checked = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
              }) => CartItemCompanion.insert(
                id: id,
                name: name,
                quantity: quantity,
                emoji: emoji,
                checked: checked,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CartItemTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CartItemTable,
      CartItemData,
      $$CartItemTableFilterComposer,
      $$CartItemTableOrderingComposer,
      $$CartItemTableAnnotationComposer,
      $$CartItemTableCreateCompanionBuilder,
      $$CartItemTableUpdateCompanionBuilder,
      (
        CartItemData,
        BaseReferences<_$AppDatabase, $CartItemTable, CartItemData>,
      ),
      CartItemData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CartItemTableTableManager get cartItem =>
      $$CartItemTableTableManager(_db, _db.cartItem);
}
