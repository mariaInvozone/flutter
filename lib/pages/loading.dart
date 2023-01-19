import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_time_pro/pages/home.dart';
import 'package:world_time_pro/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';

void setupWorldTime() async{
  WorldTime inst= WorldTime(location:'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
  await inst.getTime();
  Get.to(Home(), arguments: {
     'location':inst.location,
     'flag':inst.flag,
     'time':inst.time,
  });


  // setState(() {
  //   time=inst.time;
  // });



}


  @override
  void initState() {
    super.initState();
    setupWorldTime();


  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.grey,
          body: Center(
            child: SpinKitCubeGrid(
              color: Colors.black,
              size: 50.0,
            ),

          ),
         );

  }
}
