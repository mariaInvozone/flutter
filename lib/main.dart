import 'package:flutter/material.dart';
import 'package:world_time_pro/pages/home.dart';
import 'package:world_time_pro/pages/loading.dart';
import 'pages/choose_location.dart';
import 'pages/all_products.dart';
void main()=> runApp(MaterialApp(

  initialRoute: '/',
  routes: {

    '/':(context)=> Loading(),
    '/home':(context)=> Home(),
    '/location':(context)=> ChooseLocation(),
    '/allproducts':(context)=> AllProducts(),
  },
));

