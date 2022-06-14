import '../model/product_model.dart';
import 'package:ecommerce/utils/my-strings.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static Future<List<ProductModel>> getProducts() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception('Data not loaded');
    }
  }
}
