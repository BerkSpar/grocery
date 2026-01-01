import 'package:dio/dio.dart';
import 'package:grocery/models/product.dart';

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
      categoryCode: rawData['ncm']['code'],
    );

    return product;
  } catch (e) {
    return null;
  }
}
