import 'package:flutter/material.dart';

import 'package:world_time_pro/services/my_controller.dart';
import 'package:get/get.dart';
import 'package:world_time_pro/services/world_time.dart';
class MyController extends GetxController{

  final user = User(name: "Camila", age: 18).obs;

  void updateValue(){
    user.update( (user) { // this parameter is the class itself that you want to update
      user?.name = 'Jonny';
      user?.age = 18;
    });
    update();

  }
}