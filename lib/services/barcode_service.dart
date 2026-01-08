import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:cartly/models/product.dart';

Future<Product?> getProduct(String barCode) async {
  final dio = Dio();

  try {
    final result = await dio.get(
      'https://api.cosmos.bluesoft.com.br/gtins/$barCode.json',
      options: Options(headers: {"X-Cosmos-Token": "5gBZV8dknRBICwH41_xuXw"}),
    );

    if (result.statusCode != 200) {
      return null;
    }

    var rawData = result.data;

    Product product = Product(
      name: rawData['description'],
      barCode: barCode,
      categoryCode: rawData['category']?['id']?.toString(),
    );

    return product;
  } on Exception catch (e) {
    log(e.toString());
    Product emptyProduct = Product(name: '', barCode: '');

    return emptyProduct;
  }
}
