
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:world_time_pro/models/product_model.dart';
class Choice {
  Choice({ this.title, this.icon, this.category});
  final String? title;
  final String? category;
  final IconData? icon;
}

List<Choice> choices =  <Choice>[
  Choice(title: 'Clothes', category:'womens-dresses',icon: Icons.person),
  Choice(title: 'Bags',  category:'womens-bags',icon: Icons.shopping_bag),
  Choice(title: 'Shoes', category:'womens-shoes', icon: Icons.roller_skating),
  Choice(title: 'Electronics',  category:'automotive',icon: Icons.settings_remote),
  Choice(title: 'Watch', category:'womens-watches', icon: Icons.watch),
  Choice(title: 'Jewelry', category:'womens-jewellery', icon: Icons.diamond),
  Choice(title: 'Kitchen', category:'groceries', icon: Icons.soup_kitchen),
  Choice(title: 'Toys',  category:'home-decoration',icon: Icons.smart_toy),
];


//test class
class User {
  User({this.name, this.age});
  var name;
  var age;
}

//Products
class Products {
  Products({ this.title, this.icon, this.description, this.rating, this.sold,required this.thumbnail, this.price});
  final String? title;
  final IconData? icon;
  final String ?description;
  final String thumbnail;
  final double ?price;
  final num ?sold;
  final double? rating;
  Future<void> getProducts() async{
    try{
      http.Response response= await  http.get(Uri.parse('https://dummyjson.com/products'));
     Map data=convert.jsonDecode(response.body);
      print('JJH');
     print(data);
    }
    catch(e){
      print('eoor $e');
    }
  }
}



class ProductCard extends StatelessWidget {
  const ProductCard({ Key ? key, this.products}) : super(key: key);
  // final Products products;
  final  ProductModel ? products;


  @override
  Widget build(BuildContext context) {
print(products?.images);

    return
      Column(


      children: [


       Card(
          color: Colors.grey[200],
            margin: EdgeInsets.zero,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
              child: InkWell(
                onTap: (){
                  Get.snackbar(
                    "",
                    "",
                    isDismissible: true,
                    dismissDirection: DismissDirection.horizontal,
                    titleText:Text( "Added to cart successfully",
                      style: TextStyle(color: Colors.black,
                        fontFamily: 'Comforta',
                        fontWeight: FontWeight.w900,
                      ),),
                    //vg leftBarIndicatorColor: Colors.black,
                    messageText:Text("${products?.title}",
                      style: TextStyle(color: Colors.black,
                        fontFamily: 'Comforta',

                      ),
                    ),
                    colorText: Colors.white,
                    backgroundColor: Colors.grey[400],
                    icon: const Icon(Icons.price_change),
                    snackPosition: SnackPosition.BOTTOM,
                  );


                },
                              child: new Image.network('${products?.images?[0]}',
                                   height: 50,
                                   width: 50,

                                    fit: BoxFit.fill,
                                  ),
                            ),



    ),
        SizedBox(height: 5),
         Text("${products?.title}" ,

           maxLines: 1,
           style: const TextStyle(
               fontFamily: 'Comforta',
               fontWeight: FontWeight.w900,
               fontSize: 15.0),
         ),
         SizedBox(height: 2),

        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.orange,
              size: 24.0,
            ),

            Text(
              "${products?.rating} |  ",

              style: const TextStyle(
                  fontFamily: 'Comforta',
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                  fontSize: 17.0),
            ),


            Container(
              decoration: BoxDecoration(color: Colors.grey[200],
                  borderRadius:  BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Text(
                  "${products?.stock} sold",
                  style: const TextStyle(
                      fontFamily: 'Comforta',
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      fontSize: 17.0),
                ),
              ),
            ),
          ],
        ),

         SizedBox(height: 2),


         Text(
          "${products?.discountPercentage} rs",
           style: const TextStyle(
               fontFamily: 'Comforta',
               fontWeight: FontWeight.w900,
               fontSize: 17.0),
            ),
      ],
    );


  }
}










class SelectCard extends StatelessWidget {
  const SelectCard({ Key ? key,required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {

    return
        Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Flexible(
          child:  SizedBox(
            height: 75, width:75,
            child:
                    Card(
                        color: Colors.grey[200],
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(75),

                          //set border radius more than 50% of height and width to make circle
                        ),

                        child: Center(child: Column(
                            mainAxisSize: MainAxisSize.min,

                            children: <Widget>[

                              Icon(choice.icon, size:25.0,),
                              //  Text(choice.title),
                            ]
                        ),
                        )
                    ),
                )

        ),
        SizedBox(height: 5),
        Text(
          choice.title.toString(),
          style: const TextStyle(
              fontFamily: 'Comforta',
              fontWeight: FontWeight.w600,
              fontSize: 15.0),
        ),
      ],
    );
  }
}

class WorldTime{
  String location;
  String time="";
  String flag;
  String url;
  bool isDaytime =false;



  Future<void> getTime() async{

    try{
      http.Response response= await  http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data=convert.jsonDecode(response.body);

      //getProps
      String datetime=data['datetime'];
      String utc_offset=data['utc_offset'].substring(1,3);
      DateTime now=DateTime.parse(datetime);
      now =now.add(Duration(hours:int.parse(utc_offset) ));
      time=DateFormat.jm().format(now);
     // time=now.toString();

    }
    catch(e){
      print('eoor $e');
      time='Could not get time data ';
      
    }
    
  }

  WorldTime({required this.location,required this.flag,required this.url});


}

