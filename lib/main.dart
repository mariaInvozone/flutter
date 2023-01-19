import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_time_pro/helper/route_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Route Managment',
      initialRoute: '/',
      getPages: appRoutes(),
    );
  }
}


