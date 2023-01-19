import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:world_time_pro/pages/choose_location.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.black;
    }
    return Colors.black;
  }
  @override
  Widget build(BuildContext context) {

    return  AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
      child:
        Scaffold(

        resizeToAvoidBottomInset: false,
        body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
                      child: Column(
                        children: [
                          Text(
                            'Login to your Account',
                            style: TextStyle(
                              fontFamily: 'Comforta',
                              fontWeight: FontWeight.w900,
                              fontSize:40,

                            ),

                          ),
                          SizedBox(height: 40),
                          TextField(


                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none
                              ),
                              prefixIcon: Icon(Icons.email, color: Colors.grey),


                              hintText: 'Email',
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none
                              ),
                              prefixIcon: Icon(Icons.lock, color: Colors.grey),
                              // suffixIcon: Icon(Icons.remove_red_eye_rounded, color: Colors.grey),


                              hintText: 'Password',
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                          SizedBox(height: 20),
                             Row(

                               mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[

                                Checkbox(
                                  shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(getColor),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),//Checkbox
                                //SizedBox
                                Text(
                                  'Remember Me',
                                  style: TextStyle(fontSize: 17.0,
                                      fontFamily: 'Comforta',
                                      fontWeight: FontWeight.w900,
                                    color: Colors.black

                                  ),
                                ), //Text
                                //SizedBox
                                SizedBox(width: 20),

                              ], //<Widget>[]
                            ),

                          SizedBox(height: 20),
                          ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                            //  Navigator.pushReplacementNamed(context, '/location');
                              Get.to(ChooseLocation());
                            },
                            child:  Container(
                              height: 55,
                              width: 350,
                              alignment: Alignment.center,
                              child: Text("Sigin"),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Forget Password ?',
                            style: TextStyle(fontSize: 17.0,
                                fontFamily: 'Comforta',
                                fontWeight: FontWeight.w900,
                                color: Colors.black

                            ),
                          ),
                          SizedBox(height: 20),//Text
                          //SizedBox


                        ],
                      ),

                    ),







                  ],
                ),
          ),

      ),
    );

  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(

  backgroundColor: Colors.grey[800],
  padding: EdgeInsets.symmetric(horizontal: 10),


  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),

  ),
);




