import 'dart:convert';
import 'package:world_time_pro/pages/home.dart';
import 'package:world_time_pro/pages/loading.dart';
import 'package:world_time_pro/pages/choose_location.dart';
import 'package:get/get.dart';
import 'package:world_time_pro/pages/all_products.dart';


appRoutes() => [
  GetPage(
    name: '/',
    page: () => Loading(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/home',
    page: () => Home(),
    middlewares: [MyMiddelware()],
    transition: Transition.leftToRightWithFade,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/allproducts',
    page: () => AllProducts() ,
    middlewares: [MyMiddelware()],
    transition: Transition.leftToRightWithFade,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/location',
    page: () =>  ChooseLocation(),
    middlewares: [MyMiddelware()],
    transition: Transition.leftToRightWithFade,
    transitionDuration: Duration(milliseconds: 500),
  ),
];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}