import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:japan_bank/screen/Onboard/onboad_screen.dart';
class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();

}

class _splash_screenState extends State<splash_screen> {@override
void initState() {

  super.initState();
  Timer(Duration(seconds: 3),(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnbordScreen(),));
  });
}
@override
Widget build(BuildContext context) {
  return Scaffold(
      body:
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 120,),
          Center(  child:   Image.asset('assets/images/image.png' ,height:250 , width:250,),

          ),


          Stack(
            children: [

              Positioned(
                  bottom: -1,
                  child:  Image.asset('assets/images/logo2.png')),
              Positioned(
                  child: Image.asset('assets/images/logo1.png')),

            ],
          ),
        ],
      )

  );





}
}
