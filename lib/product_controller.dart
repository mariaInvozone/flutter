import 'package:flutter/material.dart';

// import 'package:world_time_pro/services/my_controller.dart';
import 'package:get/get.dart';
// import 'package:world_time_pro/services/world_time.dart';
import 'package:world_time_pro/apimodule/api_Service.dart';
import 'package:world_time_pro/models/product_model.dart';

class ProductController extends GetxController{

  var isLoading =true.obs;

  var productList=<ProductModel?>[].obs;


  @override
  void onInit(){
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async{
    try{
      isLoading(true);
      var products =await ApiService?.fetchProducts();
      if(products!=null){
        productList?.assignAll(products);
      }
    } finally{
      isLoading(false);
    }

  }





}