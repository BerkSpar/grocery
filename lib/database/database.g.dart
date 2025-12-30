// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CartTable extends Cart with TableInfo<$CartTable, CartData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _timerValueMeta = const VerificationMeta(
    'timerValue',
  );
  @override
  late final GeneratedColumn<int> timerValue = GeneratedColumn<int>(
    'timer_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _finishedAtMeta = const VerificationMeta(
    'finishedAt',
  );
  @override
  late final GeneratedColumn<DateTime> finishedAt = GeneratedColumn<DateTime>(
    'finished_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, timerValue, createdAt, finishedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart';
  @override
  VerificationContext validateIntegrity(
    Insertable<CartData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timer_value')) {
      context.handle(
        _timerValueMeta,
        timerValue.isAcceptableOrUnknown(data['timer_value']!, _timerValueMeta),
      );
    } else if (isInserting) {
      context.missing(_timerValueMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('finished_at')) {
      context.handle(
        _finishedAtMeta,
        finishedAt.isAcceptableOrUnknown(data['finished_at']!, _finishedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      timerValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timer_value'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      finishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}finished_at'],
      ),
    );
  }

  @override
  $CartTable createAlias(String alias) {
    return $CartTable(attachedDatabase, alias);
  }
}

class CartData extends DataClass implements Insertable<CartData> {
  final int id;
  final int timerValue;
  final DateTime createdAt;
  final DateTime? finishedAt;
  const CartData({
    required this.id,
    required this.timerValue,
    required this.createdAt,
    this.finishedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timer_value'] = Variable<int>(timerValue);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || finishedAt != null) {
      map['finished_at'] = Variable<DateTime>(finishedAt);
    }
    return map;
  }

  CartCompanion toCompanion(bool nullToAbsent) {
    return CartCompanion(
      id: Value(id),
      timerValue: Value(timerValue),
      createdAt: Value(createdAt),
      finishedAt: finishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(finishedAt),
    );
  }

  factory CartData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartData(
      id: serializer.fromJson<int>(json['id']),
      timerValue: serializer.fromJson<int>(json['timerValue']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      finishedAt: serializer.fromJson<DateTime?>(json['finishedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timerValue': serializer.toJson<int>(timerValue),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'finishedAt': serializer.toJson<DateTime?>(finishedAt),
    };
  }

  CartData copyWith({
    int? id,
    int? timerValue,
    DateTime? createdAt,
    Value<DateTime?> finishedAt = const Value.absent(),
  }) => CartData(
    id: id ?? this.id,
    timerValue: timerValue ?? this.timerValue,
    createdAt: createdAt ?? this.createdAt,
    finishedAt: finishedAt.present ? finishedAt.value : this.finishedAt,
  );
  CartData copyWithCompanion(CartCompanion data) {
    return CartData(
      id: data.id.present ? data.id.value : this.id,
      timerValue: data.timerValue.present
          ? data.timerValue.value
          : this.timerValue,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      finishedAt: data.finishedAt.present
          ? data.finishedAt.value
          : this.finishedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartData(')
          ..write('id: $id, ')
          ..write('timerValue: $timerValue, ')
          ..write('createdAt: $createdAt, ')
          ..write('finishedAt: $finishedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, timerValue, createdAt, finishedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartData &&
          other.id == this.id &&
          other.timerValue == this.timerValue &&
          other.createdAt == this.createdAt &&
          other.finishedAt == this.finishedAt);
}

class CartCompanion extends UpdateCompanion<CartData> {
  final Value<int> id;
  final Value<int> timerValue;
  final Value<DateTime> createdAt;
  final Value<DateTime?> finishedAt;
  const CartCompanion({
    this.id = const Value.absent(),
    this.timerValue = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.finishedAt = const Value.absent(),
  });
  CartCompanion.insert({
    this.id = const Value.absent(),
    required int timerValue,
    this.createdAt = const Value.absent(),
    this.finishedAt = const Value.absent(),
  }) : timerValue = Value(timerValue);
  static Insertable<CartData> custom({
    Expression<int>? id,
    Expression<int>? timerValue,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? finishedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timerValue != null) 'timer_value': timerValue,
      if (createdAt != null) 'created_at': createdAt,
      if (finishedAt != null) 'finished_at': finishedAt,
    });
  }

  CartCompanion copyWith({
    Value<int>? id,
    Value<int>? timerValue,
    Value<DateTime>? createdAt,
    Value<DateTime?>? finishedAt,
  }) {
    return CartCompanion(
      id: id ?? this.id,
      timerValue: timerValue ?? this.timerValue,
      createdAt: createdAt ?? this.createdAt,
      finishedAt: finishedAt ?? this.finishedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timerValue.present) {
      map['timer_value'] = Variable<int>(timerValue.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (finishedAt.present) {
      map['finished_at'] = Variable<DateTime>(finishedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartCompanion(')
          ..write('id: $id, ')
          ..write('timerValue: $timerValue, ')
          ..write('createdAt: $createdAt, ')
          ..write('finishedAt: $finishedAt')
          ..write(')'))
        .toString();
  }
}

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
  static const VerificationMeta _cartIdMeta = const VerificationMeta('cartId');
  @override
  late final GeneratedColumn<int> cartId = GeneratedColumn<int>(
    'cart_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cart (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
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
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
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
  static const VerificationMeta _barCodeMeta = const VerificationMeta(
    'barCode',
  );
  @override
  late final GeneratedColumn<String> barCode = GeneratedColumn<String>(
    'bar_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    clientDefault: () => false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cartId,
    name,
    quantity,
    price,
    emoji,
    barCode,
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
    if (data.containsKey('cart_id')) {
      context.handle(
        _cartIdMeta,
        cartId.isAcceptableOrUnknown(data['cart_id']!, _cartIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('emoji')) {
      context.handle(
        _emojiMeta,
        emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta),
      );
    } else if (isInserting) {
      context.missing(_emojiMeta);
    }
    if (data.containsKey('bar_code')) {
      context.handle(
        _barCodeMeta,
        barCode.isAcceptableOrUnknown(data['bar_code']!, _barCodeMeta),
      );
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
      cartId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cart_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quantity'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      emoji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emoji'],
      )!,
      barCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bar_code'],
      ),
      checked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}checked'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CartItemTable createAlias(String alias) {
    return $CartItemTable(attachedDatabase, alias);
  }
}

class CartItemData extends DataClass implements Insertable<CartItemData> {
  final int id;
  final int? cartId;
  final String name;
  final String quantity;
  final double price;
  final String emoji;
  final String? barCode;
  final bool checked;
  final DateTime createdAt;
  const CartItemData({
    required this.id,
    this.cartId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.emoji,
    this.barCode,
    required this.checked,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || cartId != null) {
      map['cart_id'] = Variable<int>(cartId);
    }
    map['name'] = Variable<String>(name);
    map['quantity'] = Variable<String>(quantity);
    map['price'] = Variable<double>(price);
    map['emoji'] = Variable<String>(emoji);
    if (!nullToAbsent || barCode != null) {
      map['bar_code'] = Variable<String>(barCode);
    }
    map['checked'] = Variable<bool>(checked);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CartItemCompanion toCompanion(bool nullToAbsent) {
    return CartItemCompanion(
      id: Value(id),
      cartId: cartId == null && nullToAbsent
          ? const Value.absent()
          : Value(cartId),
      name: Value(name),
      quantity: Value(quantity),
      price: Value(price),
      emoji: Value(emoji),
      barCode: barCode == null && nullToAbsent
          ? const Value.absent()
          : Value(barCode),
      checked: Value(checked),
      createdAt: Value(createdAt),
    );
  }

  factory CartItemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartItemData(
      id: serializer.fromJson<int>(json['id']),
      cartId: serializer.fromJson<int?>(json['cartId']),
      name: serializer.fromJson<String>(json['name']),
      quantity: serializer.fromJson<String>(json['quantity']),
      price: serializer.fromJson<double>(json['price']),
      emoji: serializer.fromJson<String>(json['emoji']),
      barCode: serializer.fromJson<String?>(json['barCode']),
      checked: serializer.fromJson<bool>(json['checked']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cartId': serializer.toJson<int?>(cartId),
      'name': serializer.toJson<String>(name),
      'quantity': serializer.toJson<String>(quantity),
      'price': serializer.toJson<double>(price),
      'emoji': serializer.toJson<String>(emoji),
      'barCode': serializer.toJson<String?>(barCode),
      'checked': serializer.toJson<bool>(checked),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CartItemData copyWith({
    int? id,
    Value<int?> cartId = const Value.absent(),
    String? name,
    String? quantity,
    double? price,
    String? emoji,
    Value<String?> barCode = const Value.absent(),
    bool? checked,
    DateTime? createdAt,
  }) => CartItemData(
    id: id ?? this.id,
    cartId: cartId.present ? cartId.value : this.cartId,
    name: name ?? this.name,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
    emoji: emoji ?? this.emoji,
    barCode: barCode.present ? barCode.value : this.barCode,
    checked: checked ?? this.checked,
    createdAt: createdAt ?? this.createdAt,
  );
  CartItemData copyWithCompanion(CartItemCompanion data) {
    return CartItemData(
      id: data.id.present ? data.id.value : this.id,
      cartId: data.cartId.present ? data.cartId.value : this.cartId,
      name: data.name.present ? data.name.value : this.name,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      barCode: data.barCode.present ? data.barCode.value : this.barCode,
      checked: data.checked.present ? data.checked.value : this.checked,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartItemData(')
          ..write('id: $id, ')
          ..write('cartId: $cartId, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('emoji: $emoji, ')
          ..write('barCode: $barCode, ')
          ..write('checked: $checked, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cartId,
    name,
    quantity,
    price,
    emoji,
    barCode,
    checked,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartItemData &&
          other.id == this.id &&
          other.cartId == this.cartId &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.emoji == this.emoji &&
          other.barCode == this.barCode &&
          other.checked == this.checked &&
          other.createdAt == this.createdAt);
}

class CartItemCompanion extends UpdateCompanion<CartItemData> {
  final Value<int> id;
  final Value<int?> cartId;
  final Value<String> name;
  final Value<String> quantity;
  final Value<double> price;
  final Value<String> emoji;
  final Value<String?> barCode;
  final Value<bool> checked;
  final Value<DateTime> createdAt;
  const CartItemCompanion({
    this.id = const Value.absent(),
    this.cartId = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.emoji = const Value.absent(),
    this.barCode = const Value.absent(),
    this.checked = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CartItemCompanion.insert({
    this.id = const Value.absent(),
    this.cartId = const Value.absent(),
    required String name,
    required String quantity,
    required double price,
    required String emoji,
    this.barCode = const Value.absent(),
    this.checked = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       quantity = Value(quantity),
       price = Value(price),
       emoji = Value(emoji);
  static Insertable<CartItemData> custom({
    Expression<int>? id,
    Expression<int>? cartId,
    Expression<String>? name,
    Expression<String>? quantity,
    Expression<double>? price,
    Expression<String>? emoji,
    Expression<String>? barCode,
    Expression<bool>? checked,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cartId != null) 'cart_id': cartId,
      if (name != null) 'name': name,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (emoji != null) 'emoji': emoji,
      if (barCode != null) 'bar_code': barCode,
      if (checked != null) 'checked': checked,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CartItemCompanion copyWith({
    Value<int>? id,
    Value<int?>? cartId,
    Value<String>? name,
    Value<String>? quantity,
    Value<double>? price,
    Value<String>? emoji,
    Value<String?>? barCode,
    Value<bool>? checked,
    Value<DateTime>? createdAt,
  }) {
    return CartItemCompanion(
      id: id ?? this.id,
      cartId: cartId ?? this.cartId,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      emoji: emoji ?? this.emoji,
      barCode: barCode ?? this.barCode,
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
    if (cartId.present) {
      map['cart_id'] = Variable<int>(cartId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<String>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String>(emoji.value);
    }
    if (barCode.present) {
      map['bar_code'] = Variable<String>(barCode.value);
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
          ..write('cartId: $cartId, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('emoji: $emoji, ')
          ..write('barCode: $barCode, ')
          ..write('checked: $checked, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CartTable cart = $CartTable(this);
  late final $CartItemTable cartItem = $CartItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cart, cartItem];
}

typedef $$CartTableCreateCompanionBuilder =
    CartCompanion Function({
      Value<int> id,
      required int timerValue,
      Value<DateTime> createdAt,
      Value<DateTime?> finishedAt,
    });
typedef $$CartTableUpdateCompanionBuilder =
    CartCompanion Function({
      Value<int> id,
      Value<int> timerValue,
      Value<DateTime> createdAt,
      Value<DateTime?> finishedAt,
    });

final class $$CartTableReferences
    extends BaseReferences<_$AppDatabase, $CartTable, CartData> {
  $$CartTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CartItemTable, List<CartItemData>>
  _cartItemRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cartItem,
    aliasName: $_aliasNameGenerator(db.cart.id, db.cartItem.cartId),
  );

  $$CartItemTableProcessedTableManager get cartItemRefs {
    final manager = $$CartItemTableTableManager(
      $_db,
      $_db.cartItem,
    ).filter((f) => f.cartId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_cartItemRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CartTableFilterComposer extends Composer<_$AppDatabase, $CartTable> {
  $$CartTableFilterComposer({
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

  ColumnFilters<int> get timerValue => $composableBuilder(
    column: $table.timerValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> cartItemRefs(
    Expression<bool> Function($$CartItemTableFilterComposer f) f,
  ) {
    final $$CartItemTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cartItem,
      getReferencedColumn: (t) => t.cartId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CartItemTableFilterComposer(
            $db: $db,
            $table: $db.cartItem,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CartTableOrderingComposer extends Composer<_$AppDatabase, $CartTable> {
  $$CartTableOrderingComposer({
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

  ColumnOrderings<int> get timerValue => $composableBuilder(
    column: $table.timerValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CartTableAnnotationComposer
    extends Composer<_$AppDatabase, $CartTable> {
  $$CartTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get timerValue => $composableBuilder(
    column: $table.timerValue,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get finishedAt => $composableBuilder(
    column: $table.finishedAt,
    builder: (column) => column,
  );

  Expression<T> cartItemRefs<T extends Object>(
    Expression<T> Function($$CartItemTableAnnotationComposer a) f,
  ) {
    final $$CartItemTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cartItem,
      getReferencedColumn: (t) => t.cartId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CartItemTableAnnotationComposer(
            $db: $db,
            $table: $db.cartItem,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CartTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CartTable,
          CartData,
          $$CartTableFilterComposer,
          $$CartTableOrderingComposer,
          $$CartTableAnnotationComposer,
          $$CartTableCreateCompanionBuilder,
          $$CartTableUpdateCompanionBuilder,
          (CartData, $$CartTableReferences),
          CartData,
          PrefetchHooks Function({bool cartItemRefs})
        > {
  $$CartTableTableManager(_$AppDatabase db, $CartTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CartTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CartTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CartTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> timerValue = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> finishedAt = const Value.absent(),
              }) => CartCompanion(
                id: id,
                timerValue: timerValue,
                createdAt: createdAt,
                finishedAt: finishedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int timerValue,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> finishedAt = const Value.absent(),
              }) => CartCompanion.insert(
                id: id,
                timerValue: timerValue,
                createdAt: createdAt,
                finishedAt: finishedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$CartTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({cartItemRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (cartItemRefs) db.cartItem],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cartItemRefs)
                    await $_getPrefetchedData<
                      CartData,
                      $CartTable,
                      CartItemData
                    >(
                      currentTable: table,
                      referencedTable: $$CartTableReferences._cartItemRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$CartTableReferences(db, table, p0).cartItemRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.cartId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CartTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CartTable,
      CartData,
      $$CartTableFilterComposer,
      $$CartTableOrderingComposer,
      $$CartTableAnnotationComposer,
      $$CartTableCreateCompanionBuilder,
      $$CartTableUpdateCompanionBuilder,
      (CartData, $$CartTableReferences),
      CartData,
      PrefetchHooks Function({bool cartItemRefs})
    >;
typedef $$CartItemTableCreateCompanionBuilder =
    CartItemCompanion Function({
      Value<int> id,
      Value<int?> cartId,
      required String name,
      required String quantity,
      required double price,
      required String emoji,
      Value<String?> barCode,
      Value<bool> checked,
      Value<DateTime> createdAt,
    });
typedef $$CartItemTableUpdateCompanionBuilder =
    CartItemCompanion Function({
      Value<int> id,
      Value<int?> cartId,
      Value<String> name,
      Value<String> quantity,
      Value<double> price,
      Value<String> emoji,
      Value<String?> barCode,
      Value<bool> checked,
      Value<DateTime> createdAt,
    });

final class $$CartItemTableReferences
    extends BaseReferences<_$AppDatabase, $CartItemTable, CartItemData> {
  $$CartItemTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CartTable _cartIdTable(_$AppDatabase db) =>
      db.cart.createAlias($_aliasNameGenerator(db.cartItem.cartId, db.cart.id));

  $$CartTableProcessedTableManager? get cartId {
    final $_column = $_itemColumn<int>('cart_id');
    if ($_column == null) return null;
    final manager = $$CartTableTableManager(
      $_db,
      $_db.cart,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cartIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

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

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barCode => $composableBuilder(
    column: $table.barCode,
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

  $$CartTableFilterComposer get cartId {
    final $$CartTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cartId,
      referencedTable: $db.cart,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CartTableFilterComposer(
            $db: $db,
            $table: $db.cart,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barCode => $composableBuilder(
    column: $table.barCode,
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

  $$CartTableOrderingComposer get cartId {
    final $$CartTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cartId,
      referencedTable: $db.cart,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CartTableOrderingComposer(
            $db: $db,
            $table: $db.cart,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<String> get barCode =>
      $composableBuilder(column: $table.barCode, builder: (column) => column);

  GeneratedColumn<bool> get checked =>
      $composableBuilder(column: $table.checked, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CartTableAnnotationComposer get cartId {
    final $$CartTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cartId,
      referencedTable: $db.cart,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CartTableAnnotationComposer(
            $db: $db,
            $table: $db.cart,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
          (CartItemData, $$CartItemTableReferences),
          CartItemData,
          PrefetchHooks Function({bool cartId})
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
                Value<int?> cartId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> quantity = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<String> emoji = const Value.absent(),
                Value<String?> barCode = const Value.absent(),
                Value<bool> checked = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CartItemCompanion(
                id: id,
                cartId: cartId,
                name: name,
                quantity: quantity,
                price: price,
                emoji: emoji,
                barCode: barCode,
                checked: checked,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> cartId = const Value.absent(),
                required String name,
                required String quantity,
                required double price,
                required String emoji,
                Value<String?> barCode = const Value.absent(),
                Value<bool> checked = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CartItemCompanion.insert(
                id: id,
                cartId: cartId,
                name: name,
                quantity: quantity,
                price: price,
                emoji: emoji,
                barCode: barCode,
                checked: checked,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CartItemTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cartId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cartId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cartId,
                                referencedTable: $$CartItemTableReferences
                                    ._cartIdTable(db),
                                referencedColumn: $$CartItemTableReferences
                                    ._cartIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
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
      (CartItemData, $$CartItemTableReferences),
      CartItemData,
      PrefetchHooks Function({bool cartId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CartTableTableManager get cart => $$CartTableTableManager(_db, _db.cart);
  $$CartItemTableTableManager get cartItem =>
      $$CartItemTableTableManager(_db, _db.cartItem);
}
