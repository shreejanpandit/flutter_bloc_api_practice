import 'package:http/http.dart' as http;

import '../../models/product_models.dart';

class ProductRepository {
  Future<List<Product>> getProducts() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
