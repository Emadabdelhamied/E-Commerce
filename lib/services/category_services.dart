import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/utils/my-strings.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return CategoryModelFromJson(jsonData);
    } else {
      return throw Exception('Data not loaded');
    }
  }

  static Future<List<ProductModel>> getAllCategory(String categoryName) async {
    var response = await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception('Data not loaded');
    }
  }
}
