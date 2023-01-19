import 'package:flutter/material.dart';
import 'package:world_time_pro/pages/all_products.dart';
import 'package:world_time_pro/services/my_controller.dart';
//import 'package:world_time_pro/pages/home.dart';
import 'home.dart';
import 'package:world_time_pro/services/world_time.dart';
import 'package:get/get.dart';
import 'package:world_time_pro/models/product_model.dart';
import 'package:flutter/services.dart';
import 'package:world_time_pro/commonmodule/AppString.dart';
import 'package:world_time_pro/product_controller.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<Cart> {




  @override

  final ProductController productController =Get.put(ProductController());

  void initState() {
    super.initState();
    print('init state runs');
    // products[0].getProducts();
  }

  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      //
      body: SafeArea(
        child:



                Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 22.0, 12.0, 12.0),
                        child: Text(
                          'You Cart Items',

                          style: const TextStyle(

                              fontFamily: 'Comforta',
                              fontWeight: FontWeight.w900,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                    GetBuilder<AddToCartVM>(
                      // specify type as Controller
                      //  init: AddToCartVM(), // intialize with the Controller
                      builder: (value) =>Container(
                        // height: 50,
                        // width: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: value.pp.length,
                            //  itemCount: value.lst.length,
                            itemBuilder: (BuildContext context, int index) {
                              return     ListTile(title:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text("${value.lst[index]?.title}",
                                    style: const TextStyle(

                                        fontFamily: 'Comforta',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0),
                                  ),
                                  Text("${value.pp[index]?.quan}",
                                    style: const TextStyle(

                                        fontFamily: 'Comforta',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      value.del(index);
                                      // Get.changeTheme(ThemeData.dark());
                                    },
                                    child: Icon(Icons.delete,
                                        color: Colors.blue, size: 25
                                    ),
                                  ),

                                ],
                              ),
                              );
                            }
                        ),
                      ),
                    ),

                    Row(

                      children: [




                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                            child: Text(
                                                "Checkout".toUpperCase(),
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
                                            onPressed: () =>{
                                              Get.back(),
                                              Get.snackbar(
                                                "",
                                                "",
                                                isDismissible: true,
                                                dismissDirection: DismissDirection.horizontal,
                                                titleText:Text( "Order Placed Successful",
                                                  style: TextStyle(color: Colors.black,
                                                    fontFamily: 'Comforta',
                                                    fontWeight: FontWeight.w900,
                                                  ),),
                                                //vg leftBarIndicatorColor: Colors.black,
                                                messageText:Text("Happy Shopping",
                                                  style: TextStyle(color: Colors.black,
                                                    fontFamily: 'Comforta',

                                                  ),
                                                ),
                                                colorText: Colors.white,
                                                backgroundColor: Colors.grey[400],
                                                icon: const Icon(Icons.price_change),
                                                snackPosition: SnackPosition.BOTTOM,
                                              ),
                                            }
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
                                            onPressed: () =>{Get.back()}
                                        )
                                      ]
                                  ),
                                ),





                      ],
                    ),
                  ],
                ),

      ),

    );


  }
}








