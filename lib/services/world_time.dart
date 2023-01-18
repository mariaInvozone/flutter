
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:world_time_pro/models/product_model.dart';
import 'package:counter/counter.dart';
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


class AddToCartVM extends GetxController {
   List<ProductModel> lst = <ProductModel>[];

  add(products) {
    lst.add(products
        // ProductModel(
        //     {products}
        // )
    );
    update();
  }

  del(int index) {
    lst.removeAt(index);
    update();
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({ Key ? key, this.products}) : super(key: key);
  // final Products products;
  final  ProductModel ? products;
  @override
  Widget build(BuildContext context) {

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
                  Get.bottomSheet(

                    Container(
                        child:Wrap (
                          children: [

                            Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(12.0, 22.0, 12.0, 12.0),
                                child: Text(
                                  'Add to cart',

                                  style: const TextStyle(

                                      fontFamily: 'Comforta',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18.0),
                                ),
                              ),
                            ),

                            // ListTile(title:Row(
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network('${products?.images?[0]}',
                                    height: 50,
                                    width: 50,

                                    fit: BoxFit.fill,
                                  ),

                                  Column(
                                    children: [
                                      Text("${products?.title}" ,

                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontFamily: 'Comforta',
                                            fontWeight: FontWeight.w900,
                                            fontSize: 15.0),
                                      ),
                                      SizedBox(height: 2),


                                      Container(
                                        decoration: BoxDecoration(color: Colors.grey[200],
                                            borderRadius:  BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                          child: Row(
                                            children: [
                                              Counter(

                                                min: 0,
                                                max: 10,
                                                bound: 1,
                                                step: 1,
                                               initial: 5,
                                                onValueChanged: print,

                                              ),
                                            ],
                                          ),
                                        ),
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
                                  ),

                                ],

                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.all(34.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        child: Text(
                                            "Add to Cart".toUpperCase(),
                                            style: TextStyle(fontSize: 14,
                                              fontFamily: 'Comforta',
                                              fontWeight: FontWeight.w900,
                                            )
                                        ),
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12)),
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                    side: BorderSide(color: Colors.black)
                                                )
                                            )
                                        ),
                                        onPressed: () => null
                                    ),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                        child: Text(
                                            "Cancel".toUpperCase(),
                                            style: TextStyle(fontSize: 14)
                                        ),
                                        style: ButtonStyle(
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                    side: BorderSide(color: Colors.black)
                                                )
                                            )
                                        ),
                                        onPressed: () => {Get.back()}
                                    )
                                  ]
                              ),
                            ),


              GetBuilder<AddToCartVM>(
                  // specify type as Controller
                  init: AddToCartVM(), // intialize with the Controller
                  builder: (value) => InkWell(
                  onTap: () {
                  value.add(products);
                  },
                  child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                   height:50,
                   width:100,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue),
                  child: Center(
                  child: Text(
                  "${products?.title} ADD",
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  ),
                  ),
                  )),
                  ),
                  ),),

                          ],
                        )
                    ),

                    isDismissible: true,

                    backgroundColor: Colors.white,

                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15),
                      side: BorderSide(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 2.0
                      ),
                    ),
                  );

                },
                // onTap: (){


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

