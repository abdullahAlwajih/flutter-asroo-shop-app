import 'package:http/http.dart' as http;

import '../../../core/utils/my_string.dart';
import '../../product/models/product_models.dart';
import '../models/category_model.dart';

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}

class AllCategorySercvises {
  static Future<List<ProductModels>> getAllCategory(
      String categoryNames) async {
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return ProductModels.fromJsonList(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
