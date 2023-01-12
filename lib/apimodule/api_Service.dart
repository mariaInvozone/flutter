import 'package:http/http.dart' as http;
import 'package:world_time_pro/models/product_model.dart';
class ApiService{
  
  static var client =http.Client();
  static Future<List<ProductModel?>?> fetchProducts ()  async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=nyx'));

    // if(response.statusCode ==200){
    var jsonString = response.body;



    //return [];
    return productModelFromJson(jsonString);
  // }

  }
}