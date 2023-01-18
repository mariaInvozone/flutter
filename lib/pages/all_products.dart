import 'package:flutter/material.dart';
import 'package:world_time_pro/services/my_controller.dart';
//import 'package:world_time_pro/pages/home.dart';
import 'home.dart';
import 'package:world_time_pro/services/world_time.dart';
import 'package:get/get.dart';
import 'package:world_time_pro/models/product_model.dart';
import 'package:world_time_pro/commonmodule/AppString.dart';
import 'package:world_time_pro/product_controller.dart';
import 'package:counter/counter.dart';
import 'package:world_time_pro/services/world_time.dart';
class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);
  @override
  State<AllProducts> createState() => _AllProductsState();
}
class Choice {
  Choice({ this.title, this.icon, this.category});
  final String? title;
  final String? category;
  final IconData? icon;
}
class _AllProductsState extends State<AllProducts> {

  @override

  final ProductController productController =Get.put(ProductController());



  Widget build(BuildContext context) {
    Object? s = ModalRoute?.of(context)?.settings?.arguments;
    print(s.runtimeType);

    return 
      Scaffold(
appBar: AppBar(
  title:  Text(" ${s}",
    style: TextStyle(color: Colors.black,
        fontFamily: 'Comforta',
        fontWeight: FontWeight.w900,
        fontSize: 18.0,
    ),
  ),
  shadowColor:  null,
  leading: IconButton(
    icon: Icon(Icons.navigate_before, color: Colors.black),
    onPressed: () => Navigator.pushReplacementNamed(context, '/location'),
  ),
  centerTitle: false,
  backgroundColor: Color(0x44000000),
  elevation: 0,
  actions: <Widget>[

    IconButton(
      icon: const Icon(Icons.shopping_bag, color: Colors.black,),
      tooltip: 'Go to the next page',
      onPressed: () {
        Navigator.push(context, MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: false,
                backgroundColor: Color(0x44000000),
                elevation: 0,
                title:  const Text('Your Cart',
                  style: TextStyle(color: Colors.black,
                    fontFamily: 'Comforta',
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0,
                  ),
                ),
              ),
              body:   Container(
                  child:Wrap (
                    children: [
                  Padding(
                          padding: const EdgeInsets.fromLTRB(12.0, 22.0, 12.0, 12.0),
                          child: Text(
                            'You Cart Items',

                            style: const TextStyle(

                                fontFamily: 'Comforta',
                                fontWeight: FontWeight.w900,
                                fontSize: 18.0),
                          ),
                        ),

                      ListTile(title:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text('Shopping Bag Ladies',
                            style: const TextStyle(

                                fontFamily: 'Comforta',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),

                        ],
                      ) , onTap: (){
                        // Get.changeTheme(ThemeData.dark());
                      },),
                      ListTile(title:Text('Kids Collectoin Shoes',
                        style: const TextStyle(

                            fontFamily: 'Comforta',
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0),
                      ) , onTap: (){
                        //  Get.changeTheme(ThemeData.light());
                      },),
                      Padding(
                        padding: const EdgeInsets.all(34.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  child: Text(
                                      "Buy Now".toUpperCase(),
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
                                  onPressed: () => null
                              )
                            ]
                        ),
                      ),

                    ],
                  )
              ),

            );
          },
        ));
      },
    ),
  ],
),
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            //
            body:
            SingleChildScrollView(

              child:
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget> [

                    Obx(()  {
                      if(productController.isLoading.value)
                        return Center(child: SizedBox(
                          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.grey)
                          ),
                          height: 20.0,
                          width: 20.0,
                        )
                        );
                      else
                        return GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 18.0,
                          mainAxisSpacing: 18.0,
                          childAspectRatio: 1,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children:
                          List.generate(productController.productList.length, (index) {
                            //  return Text("count ${productController.productList[index]?.name}");
                            return ProductCard(products: productController.productList[index]);

                          }
                          ),
                        );

                    }),
                    // Obx(()  {
                    //   if(productController.isLoading.value)
                    //     return Center(child: SizedBox(
                    //       child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.grey)
                    //       ),
                    //       height: 20.0,
                    //       width: 20.0,
                    //     )
                    //     );
                    //   else
                    //     return GridView.count(
                    //       crossAxisCount: 2,
                    //       crossAxisSpacing: 18.0,
                    //       mainAxisSpacing: 18.0,
                    //       childAspectRatio: 1,
                    //       shrinkWrap: true,
                    //       physics: NeverScrollableScrollPhysics(),
                    //       children:
                    //       List.generate(productController.productList.length, (index) {
                    //         //  return Text("count ${productController.productList[index]?.name}");
                    //         return ProductCard(products: productController.productList[index]);
                    //
                    //       }
                    //       ),
                    //     );
                    //
                    // }),
                  ],

                ),
              ),
            )
        );

  }
}


