// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Grocery';

  @override
  String get emptyListMessage =>
      'You don\'t have any items in\nyour shopping list yet';

  @override
  String get add => 'add';

  @override
  String get shoppingList => 'Shopping list';

  @override
  String get openCart => 'Open cart';

  @override
  String get startShopping => 'Start shopping';

  @override
  String get totalInCart => 'Total in cart';

  @override
  String get itemName => 'Item name';

  @override
  String get quantity => 'Quantity';

  @override
  String get price => 'Price';

  @override
  String get addToCart => 'Add to cart';

  @override
  String get addToList => 'Add to list';

  @override
  String get delete => 'Hold to delete';

  @override
  String get readBarcode => 'Scan barcode';

  @override
  String get holdToFinish => 'Hold to finish shopping';

  @override
  String get shoppingListTapToScan => 'SHOPPING LIST • TAP TO SCAN';

  @override
  String get noItemsInCart => 'No items in cart';

  @override
  String get placeBarcode => 'Place the barcode here';

  @override
  String get analyzingProduct => 'Analyzing product...';

  @override
  String get noName => 'No name';

  @override
  String get prefixMoneySymbol => '\$';
}
