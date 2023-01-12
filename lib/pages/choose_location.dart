import 'package:flutter/material.dart';
import 'package:world_time_pro/services/my_controller.dart';
//import 'package:world_time_pro/pages/home.dart';
import 'home.dart';
import 'package:world_time_pro/services/world_time.dart';
import 'package:get/get.dart';
import 'package:world_time_pro/models/product_model.dart';
//
import 'package:world_time_pro/commonmodule/AppString.dart';
import 'package:world_time_pro/product_controller.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {




  @override

  final ProductController productController =Get.put(ProductController());

  void initState() {
    super.initState();
    print('init state runs');
   // products[0].getProducts();
  }

  Widget build(BuildContext context) {

    return GetMaterialApp(
         home:
     Scaffold(

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
               SizedBox(height: 40),

            Row(

                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50'),
                      backgroundColor: Colors.brown.shade800,
                      radius: 35,
                    //  child: const Text('AH'),
                    ),
                      Column(

                        children: [
                          Row(

                            children: [
                              Text(
                                ' Good Mornring',
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Comforta',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18.0),
                              ),
                              Icon(
                                Icons.waving_hand,
                                color: Colors.orange,
                                size: 24.0,
                              ),
                            ],
                          ),
                          Text(
                            'Maria Akhtar      ',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontFamily: 'Comforta',
                                fontWeight: FontWeight.w900,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                  ],
                ),


            SizedBox(height: 20),
            TextField(

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none
                ),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: Icon(Icons.filter_list, color: Colors.grey),
                hintText: 'Search',
                filled: true,
                fillColor:Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text(
                          'Special Offers',

                          style: const TextStyle(

                              fontFamily: 'Comforta',
                              fontWeight: FontWeight.w900,
                              fontSize: 18.0),
                        ),

                      GestureDetector(
                        onTap: (){
                          Get.bottomSheet(

                            Container(
                                child:Wrap (
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

                            isDismissible: true,

                            backgroundColor: Colors.white,

                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 2.0
                            ),
                            ),
                          );

                        },
                      child: Text(
                          'View Cart',
                          style: const TextStyle(
                              fontFamily: 'Comforta',
                              fontWeight: FontWeight.w900,
                              fontSize: 18.0),
                        ),
                      ),
                    ],
                  ),

            SizedBox(height: 20),
            Image.asset('assets/images/poster.png'),


            Flexible(
                child:IgnorePointer(
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    shrinkWrap: true,

                    children: List.generate(choices.length, (index) {
                      return  SelectCard(choice: choices[index]);

                    }
                    ),
                  ),

                )
            ),
            SizedBox(height: 10),

            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Most Popular',

                  style: const TextStyle(

                      fontFamily: 'Comforta',
                      fontWeight: FontWeight.w900,
                      fontSize: 18.0),
                ),
                GestureDetector(
                  onTap: (){

                   Navigator.pushReplacementNamed(context, '/allproducts');

                  },
                  child: Text(
                    'See All',
                    style: const TextStyle(
                        fontFamily: 'Comforta',
                        fontWeight: FontWeight.w900,
                        fontSize: 18.0),
                  ),
                ),
              ],
            ),


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

          children:
          List.generate(productController.productList.length, (index) {
            //  return Text("count ${productController.productList[index]?.name}");
            return ProductCard(products: productController.productList[index]);

          }
          ),
        );

}),
          ],

        ),
      ),
      )
     )
    );
  }
}






