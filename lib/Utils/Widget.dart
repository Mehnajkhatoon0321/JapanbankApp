import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class MahiWidget{
  MahiWidget._();
  static Movebutton(context)=> Center(
    child: Stack(
      children: [
        Image.asset('assets/images/next1.png' ,width: 150.0,),
        Positioned( bottom: 10,left: 50,right: 50,
            child: Text(
              'Next',style: TextStyle(
              fontWeight: FontWeight.w700,fontSize: 14,color: Colors.white
            ),textAlign: TextAlign.center,
            ))
      ],
    ),
    
  );
}




