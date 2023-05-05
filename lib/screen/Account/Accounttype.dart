import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:japan_bank/Utils/help.dart';
import 'package:japan_bank/screen/Customer_Info/Customer_Info.dart';
import 'package:japan_bank/screen/login/LoginCredential.dart';
import 'package:japan_bank/screen/login/Register.dart';

class Accounttype extends StatefulWidget {
  const Accounttype({Key? key}) : super(key: key);

  @override
  State<Accounttype> createState() => _AccounttypeState();
}

class _AccounttypeState extends State<Accounttype> {
  var changeid = true;
  var checkindex = false;
  var _selected;
  var isLoading = false;
  @override
  Widget build(BuildContext context)
  {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;

  return   MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child:Scaffold(
          body: Padding(padding: EdgeInsets.all(0),
              child:  ListView(
               children: [
                 Container(
                     height: height,
                     width: width,
                     child: Column(children: [
                       SizedBox(
                         height: 80,
                       ),
                       Align(
                         alignment: Alignment.topCenter,
                         child: Image.asset(
                           'assets/images/image.png',
                           width: 140,
                           height: 140,
                         ),),
                       SizedBox(
                         height: height * 0.050,
                       ),
                       Padding(
                         padding: EdgeInsets.all(15),
                         child: Column(
                           children: const [
                             Align(
                               alignment: Alignment.topLeft,
                               child: Padding(
                                 padding:
                                 EdgeInsets.symmetric(horizontal: 8.5, vertical: 0),
                                 child: Text('Account Type',
                                     textScaleFactor: 1.0,
                                     style: TextStyle(
                                         fontSize: 30,
                                         fontWeight: FontWeight.w700,
                                         fontFamily: 'inter'),
                                     textAlign: TextAlign.start),
                               ),
                             ),


                             SizedBox(
                               height: 20,
                             ),
                           ],
                         ),
                       ),
                       Column(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                                 padding:
                                 EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                 child: SizedBox(
                                   width: width * 0.90,
                                   height: width * 0.35,
                                   child: ElevatedButton(
                                     style: ButtonStyle(
                                       backgroundColor: changeid
                                           ? MaterialStateProperty.all(Color(0xffE41D29))
                                           : MaterialStateProperty.all(Colors.white),
                                       textStyle: checkindex
                                           ? MaterialStateProperty.all(
                                           Textbutton.choosebutton)
                                           : MaterialStateProperty.all(
                                           Textbutton.choosebutton),
                                       shape: MaterialStateProperty.all<
                                           RoundedRectangleBorder>(
                                           RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(10.0),
                                               side: BorderSide(color: Color(0xffE41D29)))),
                                     ),
                                     onPressed: () {
                                       setState(() {
                                         changeid = true;
                                         Navigator.push(
                                             context,
                                             MaterialPageRoute(
                                                 builder: (context) =>
                                                 Createinfo()));
                                       });
                                     },
                                     child: Text("Mobile Banking",
                                         textScaleFactor: 1.0,
                                         style: changeid
                                             ? TextStyle(
                                             fontSize: 18,
                                             fontWeight: FontWeight.w600,
                                             color: Color(0xffFFFFFF))
                                             : TextStyle(
                                             fontSize: 18,
                                             fontWeight: FontWeight.w400,
                                             color: Color(0xff000000))),
                                   ),
                                 )),
                             SizedBox(
                               height: 40,
                             ),
                             Padding(
                                 padding:
                                 EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                                 child: SizedBox(
                                   width: width * 0.90,
                                   height: width * 0.35,
                                   child: ElevatedButton(
                                     style: ButtonStyle(
                                       backgroundColor: changeid
                                           ? MaterialStateProperty.all(Colors.white)
                                           : MaterialStateProperty.all(Color(0xffE41D29)),
                                       textStyle: checkindex
                                           ? MaterialStateProperty.all(
                                           Textbutton.choosebutton)
                                           : MaterialStateProperty.all(
                                           Textbutton.choosebutton),
                                       shape: MaterialStateProperty.all<
                                           RoundedRectangleBorder>(
                                           RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(10.0),
                                               side: BorderSide(color: Color(0xffE41D29)))),
                                     ),
                                     onPressed: () {
                                       setState(() {
                                         changeid = false;

                                         Navigator.push(
                                           context,
                                           MaterialPageRoute(
                                               builder: (context) =>   Createinfo()),
                                         );
                                       });
                                     },
                                     child: Text("Wallet",
                                         textScaleFactor: 1.0,
                                         style: changeid
                                             ? const TextStyle(
                                             fontSize: 18,
                                             fontWeight: FontWeight.w400,
                                             color: Colors.black)
                                             : const TextStyle(
                                             fontSize: 18,
                                             fontWeight: FontWeight.w600,
                                             color: Colors.white)),
                                   ),
                                 ))
                           ]),
                     ])),
               ],
              )

          ) ));
  }
}
