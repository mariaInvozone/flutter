import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:world_time_pro/models/product_model.dart';
class ApiService{
  
  static var client =http.Client();
  static Future<List<ProductModel?>?> fetchProducts (String ? category )  async {
    var response = await client.get(Uri.parse(
        'https://dummyjson.com/products/category/${category}'));

var decode=    json.decode(response.body);
 //   print('${decode.runtimeType} : $decode');
  //print(decode['products']);
    // if(response.statusCode ==200){
    var jsonString = decode['products'];
    String nameString = jsonEncode(jsonString);
    

    return productModelFromJson(nameString);
  // }

  }

  static Future<List<ProductModel?>?> fetchAllProduct (String ? category )  async {
    var response = await client.get(Uri.parse(
        'https://dummyjson.com/products/'));

    var decode=    json.decode(response.body);
    //   print('${decode.runtimeType} : $decode');
    //print(decode['products']);
    // if(response.statusCode ==200){
    var jsonString = decode['products'];
    String nameString = jsonEncode(jsonString);


    return productModelFromJson(nameString);
    // }

  }
}