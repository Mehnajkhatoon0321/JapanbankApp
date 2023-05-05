// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:japan_bank/screen/Tpin/T%20pin.dart';
//
//
// class Choose_userAccount extends StatefulWidget {
//   const Choose_userAccount({Key? key}) : super(key: key);
//
//   @override
//   State<Choose_userAccount> createState() => _Choose_userAccountState();
// }
// bool?isChecked=false;
// bool?isCheck=false;
// bool?isCh=false;
//
// var isLoading = false;
// class _Choose_userAccountState extends State<Choose_userAccount> {
//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//     final double width = MediaQuery.of(context).size.width;
//     var size = MediaQuery.of(context).size;
//
//     return MediaQuery(
//         data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//         child: Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0.0,
//               leading: BackButton(
//                 color: Colors.black,
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ),
//             resizeToAvoidBottomInset: false,
//             backgroundColor: Colors.white,
//             body: Padding(
//                 padding: const EdgeInsets.all(0),
//                 child: ListView(children: [
//                   Column(children: [
//                     SizedBox(
//                       height: height / 50,
//                     ),
//                     const Align(
//                       alignment: Alignment.topLeft,
//                       child: Padding(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 24, vertical: 0),
//                         child: Text(
//                           'Confirm Account List',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w700, fontSize: 24),
//                         ),
//                       ),
//                     ),
//                     Padding(padding: EdgeInsets.all(15)),
//                     Row(
//                       children: [
//                         Align(
//                             alignment: Alignment.center,
//                             child: Padding(
//                               padding:
//                               EdgeInsets.symmetric(horizontal: 15, vertical: 0),
//                               child:   SizedBox(
//                             height: 22.0,
//                             width: 22.0,
//                             child: Theme(
//                               data: ThemeData(
//                                   unselectedWidgetColor:
//                                   Color(0xff737373)),
//                               child: Checkbox(
//                                 activeColor:Color(0xffE41D29),
//                                 onChanged: (newBool) {
//                                   setState(() {
//                                     isChecked = newBool;
//                                   });
//                                 },
//                                 value: isChecked,
//                               ),
//
//
//
//
//
//                             )
//                         ),
//                             )
//
//
//                     ),
//                         Align(
//                             alignment: Alignment.center,
//                             child: Padding(
//                                 padding:
//                                 EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                                 child:
//                                 Image.asset('assets/images/card3.png',height: 152,width: 290,)
//                             )
//                         ),
//                         Align(
//                             alignment: Alignment.center,
//                             child: Padding(
//                                 padding:
//                                 EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                                 child: IconButton(
//                                   icon: const Icon(Icons.delete),
//                                   onPressed: () {  },
//
//                                 ))
//                         )
//                       ]
//                     ),
//                     SizedBox(height: height/38,),
//                     Row(
//                         children: [
//                           Align(
//                               alignment: Alignment.center,
//                               child: Padding(
//                                 padding:
//                                 EdgeInsets.symmetric(horizontal: 15, vertical: 0),
//                                 child:   SizedBox(
//                                     height: 22.0,
//                                     width: 22.0,
//                                     child: Theme(
//                                       data: ThemeData(
//                                           unselectedWidgetColor:
//                                           Color(0xff737373)),
//                                       child: Checkbox(
//                                         activeColor: Color(0xffE41D29),
//                                         onChanged: (newBool) {
//                                           setState(() {
//                                             isCheck = newBool;
//                                           });
//                                         },
//                                         value: isCheck,
//                                       ),
//
//
//
//
//
//                                     )
//                                 ),
//                               )
//
//
//                           ),
//                           Align(
//                               alignment: Alignment.center,
//                               child: Padding(
//                                   padding:
//                                   EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                                   child:
//                                   Image.asset('assets/images/card1.png',height: 152,width: 290,)
//                               )
//                           ),
//                           Align(
//                               alignment: Alignment.center,
//                               child: Padding(
//                                   padding:
//                                   EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                                   child: IconButton(
//                                     icon: const Icon(Icons.delete),
//                                     onPressed: () {  },
//
//                                   ))
//                           )
//                         ]
//                     ),
//                     SizedBox(height: height/38,),
//                     Row(
//                         children: [
//                           Align(
//                               alignment: Alignment.center,
//                               child: Padding(
//                                 padding:
//                                 EdgeInsets.symmetric(horizontal: 15, vertical: 0),
//                                 child:   SizedBox(
//                                     height: 22.0,
//                                     width: 22.0,
//                                     child: Theme(
//                                       data: ThemeData(
//                                           unselectedWidgetColor:
//                                           Color(0xff737373)),
//                                       child: Checkbox(
//                                         activeColor: Color(0xffE41D29),
//                                         onChanged: (newBool) {
//                                           setState(() {
//                                             isCh = newBool;
//                                           });
//                                         },
//                                         value: isCh,
//                                       ),
//
//
//
//
//
//                                     )
//                                 ),
//                               )
//
//
//                           ),
//                           Align(
//                               alignment: Alignment.center,
//                               child: Padding(
//                                   padding:
//                                   EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                                   child:
//                                   Image.asset('assets/images/card2.png',height: 152,width: 290,)
//                               )
//                           ),
//                           Align(
//                               alignment: Alignment.center,
//                               child: Padding(
//                                   padding:
//                                   EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//                                   child: IconButton(
//                                     icon: const Icon(Icons.delete),
//                                     onPressed: () {  },
//
//                                   ))
//                           )
//                         ]
//                     )
//                   ]),
//                   SizedBox(height: height/10,),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child:  SizedBox(
//                       height: height * 0.060,
//                       child: Center(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=>const Tpin()));
//                           },
//                           style: ElevatedButton.styleFrom(
//                             primary: Color(0xffE41D29),
//                             minimumSize: Size(150, 60),
//                           ),
//                           child: const Text(
//                             'Next',
//                             textScaleFactor: 1.0,style: TextStyle(fontFamily: 'inter',fontSize: 18,fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ),
//                     ) ,
//                   )
//                 ]))));
//   }
// }
