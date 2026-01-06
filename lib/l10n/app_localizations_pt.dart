// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Grocery';

  @override
  String get emptyListMessage =>
      'Você ainda não tem itens na\nsua lista de compra';

  @override
  String get add => 'adicionar';

  @override
  String get shoppingList => 'Lista de compras';

  @override
  String get openCart => 'Abrir o carrinho';

  @override
  String get startShopping => 'Iniciar mercado';

  @override
  String get totalInCart => 'Total no carrinho';

  @override
  String get itemName => 'Nome do item';

  @override
  String get quantity => 'Quantidade';

  @override
  String get price => 'Preço';

  @override
  String get addToCart => 'Adicionar ao carrinho';

  @override
  String get addToList => 'Adicionar à lista';

  @override
  String get delete => 'Segure para apagar';

  @override
  String get readBarcode => 'Ler código de barras';

  @override
  String get holdToFinish => 'Segure para encerrar o mercado';

  @override
  String get shoppingListTapToScan => 'LISTA DE COMPRAS • TOQUE PARA SCANNEAR';

  @override
  String get noItemsInCart => 'Não há itens no carrinho';

  @override
  String get placeBarcode => 'Coloque o código de barras aqui';

  @override
  String get analyzingProduct => 'Analisando o produto...';

  @override
  String get noName => 'Sem nome';

  @override
  String get prefixMoneySymbol => 'R\$';
}
