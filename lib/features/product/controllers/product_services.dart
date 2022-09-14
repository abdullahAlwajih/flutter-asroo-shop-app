import 'package:flutter_asroo_shop_app/features/product/models/product_models.dart';
import 'package:http/http.dart' as http;

import '../../../core/utils/my_string.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return ProductModels.fromJsonList(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
