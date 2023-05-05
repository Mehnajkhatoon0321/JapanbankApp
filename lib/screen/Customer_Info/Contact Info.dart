// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:japan_bank/screen/Account/Account%20Link.dart';
import 'package:japan_bank/screen/Account/Accountlink.dart';


class mobilenumber extends StatefulWidget {
  const mobilenumber({Key? key}) : super(key: key);

  @override
  State<mobilenumber> createState() => _mobilenumberState();
}

class _mobilenumberState extends State<mobilenumber> {
  bool?isChecked=false;
  var isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  TextEditingController _phone= TextEditingController();
  final _whatsapp = TextEditingController();
  final _email = TextEditingController();


  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: BackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Padding(
                padding: const EdgeInsets.all(0),
                child: ListView(children: [
                  Column(children: [
                    SizedBox(
                      height: height / 50,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                        child: Text(
                          'Customer Info',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24),
                        ),
                      ),
                    ),
                    Form(
                        key: _key,
                        child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height / 60,
                                  ),
                                  const Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 0),
                                        child: Text(
                                          "Mobile Number",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff000000),
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 16),
                                        child:     IntlPhoneField(
                                          decoration: InputDecoration(

                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                    color:Colors.grey)),hintText :"0123456789",
                                            hintStyle: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.w400,color: Color(0xffA8A5A5),),

                                          ),

                                          initialCountryCode: 'US',
                                          onChanged: (phone) {
                                            print(phone.completeNumber);

                                          },
                                        ),
                                      )
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),child:
                                  Row(


                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [


                                      TextButton(
                                        onPressed: () {
                                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Forgotpassword()));
                                        },
                                        style: ButtonStyle(
                                          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                                  (Set<MaterialState> states) {
                                                if (states.contains(MaterialState.hovered))
                                                  return Colors.grey;
                                                return Color(0xffE41D29);
                                              }),
                                        ),
                                        child: const Text(
                                            "Whatsapp Number",
                                            textScaleFactor: 1.0,
                                            style: TextStyle( color: Color(0xff000000),fontFamily: 'inter',fontSize: 14,fontWeight: FontWeight.w400,
                                              decorationThickness: 1,
                                            ),
                                            textAlign: TextAlign.start
                                        ),
                                      ),

                                      const Expanded(child: SizedBox()),


                                      Text("Same as Mobile Number",   textScaleFactor: 1.0,
                                        style:  TextStyle( color: Color(0xff737373),fontFamily: 'inter',fontSize: 12,fontWeight: FontWeight.w400,
                                          decorationThickness: 0.0,
                                        ),),
                                       SizedBox(width: 0.0),
                                      SizedBox(
                                          height: 22.0,
                                          width: 22.0,
                                          child: Theme(
                                            data: ThemeData(
                                                unselectedWidgetColor:
                                                Color(0xff737373)),
                                            child: Checkbox(
                                              activeColor: Color(0xffE41D29),
                                              onChanged: (newBool) {
                                                setState(() {
                                                  isChecked = newBool;
                                                });
                                              },
                                              value: isChecked,
                                            ),




                                          )
                                      ),


                                    ],
                                  ) ,

                                  ),   Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 0),
                                        child:     IntlPhoneField(
                                          decoration: InputDecoration(

                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(12),
                                                borderSide: const BorderSide(
                                                    color:Colors.grey)),hintText :"0123456789",
                                            hintStyle: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.w400,color: Color(0xffA8A5A5),),

                                          ),

                                          initialCountryCode: 'US',
                                          onChanged: (phone) {
                                            print(phone.completeNumber);

                                          },
                                        ),
                                      )
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:05,bottom: 13,right: 10,left: 10),
                                    child: Text(
                                      'Email',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: _email,
                                      keyboardType: TextInputType.emailAddress,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'\s')),
                                        LengthLimitingTextInputFormatter(30),
                                      ],

                                      decoration: InputDecoration(
                                        hintText: 'Enter email address',
                                        suffixStyle: const TextStyle(
                                            fontSize: 14, color: Color(0xffA8A5A5), fontWeight: FontWeight.w400),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        RegExp regex=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                        if(value!.isEmpty){
                                          return ("Email is required.");
                                        }
                                        else if(!regex.hasMatch(value)){
                                          return ("Enter valid email address.");
                                        }
                                        return null;
                                      },
                                      /*validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid email address.';
                      }
                      return null;
                    },*/
                                    ),
                                  ),

                                ])

                        )
                    ),

                    SizedBox(height: height*0.260,),
                    SizedBox(
                      height: height * 0.060,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Account()));
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffE41D29),
                            minimumSize: Size(150, 60),

                          ),
                          child: const Text(
                            'Next',
                            textScaleFactor: 1.0,style: TextStyle(fontFamily: 'inter',fontSize: 18,fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ] )
                ] )
            )
        )
    );

  }
}




// class ContactInfo extends StatefulWidget {
//   const ContactInfo({Key? key}) : super(key: key);
//
//   get phone => phone;
//
//
//
//   @override
//   State<ContactInfo> createState() => _ContactInfoState();
// }
//
//
// class _ContactInfoState extends State<ContactInfo> {
//   final _formKey = GlobalKey<FormState>();
//   final myController = TextEditingController();
//   TextEditingController _phone= TextEditingController();
//   final _whatsapp = TextEditingController();
//   final _email = TextEditingController();
//   bool? isChecked = true;
//
//
//   @override
//   void dispose() {
//     myController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//     final double width = MediaQuery.of(context).size.width;
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.white,
//           leading: Container(
//             alignment: Alignment.centerLeft,
//             child: IconButton(
//               icon: const Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//                 size: 26,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//         ),
//         body: Form(
//           key: _formKey,
//           child: MediaQuery(
//             data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//             child: Padding(
//               padding: const EdgeInsets.only(left: 25, bottom: 0, right: 25, top: 5),
//               child: Container(
//                   child: ListView(
//                 children: [
//                   Container(
//
//                     alignment: Alignment.topLeft,
//                     child: const Text(
//                       "Contact Info",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 24,
//                         fontFamily: "inter",
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20,bottom: 13),
//                     child: Text(
//                       'Mobile Number',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black),
//                     ),
//                   ),
//                   IntlPhoneField(
//                     keyboardType: TextInputType.number,
//                     controller: _phone,
//                     decoration: InputDecoration(
//                       hintText: 'Mobile Number',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(),
//                       ),
//                     ),
//                     initialCountryCode: 'IN',
//                     onChanged: (phone) {
//                       print(phone.completeNumber);
//                     },
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Whatsapp Number',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.black),
//                       ),
//                       SizedBox(width: 10),
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 0),
//                             child: Text(
//                               'Same as Mobile Number',
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.grey),
//                             ),
//                           ),
//                           SizedBox( width: 25,
//                             child: Checkbox(
//                               activeColor: Colors.red,
//                               onChanged: (newBool) {
//                                 setState(() {
//                                   isChecked = newBool;
//                                 });
//                               },
//                               value: isChecked,
//                             ),
//                           ),
//                         ],
//                       ),
//
//                     ],
//                   ),
//                   IntlPhoneField(
//                     keyboardType: TextInputType.number,
//                     controller: _whatsapp,
//                     decoration: InputDecoration(
//                       hintText: 'whatsapp Number',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(),
//                       ),
//                     ),
//                     initialCountryCode: 'IN',
//                     onChanged: (phone) {
//                       print(phone.completeNumber);
//                     },
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top:05,bottom: 13),
//                     child: Text(
//                       'Email',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black),
//                     ),
//                   ),
//                   TextFormField(
//                     controller: _email,
//                     keyboardType: TextInputType.emailAddress,
//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(30),
//                     ],
//                     obscureText: false,
//                     decoration: InputDecoration(
//                       fillColor: Colors.cyan,
//                       hintText: 'Enter Email Address',
//                       suffixStyle: const TextStyle(
//                           fontSize: 14, fontWeight: FontWeight.w400),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     validator: (value) {
//                       RegExp regex=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//                       if(value!.isEmpty){
//                         return ("Email is required");
//                       }
//                       else if(!regex.hasMatch(value)){
//                         return ("Enter valid email address");
//                       }
//                       return null;
//                     },
//                     /*validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter valid email address.';
//                       }
//                       return null;
//                     },*/
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       alignment: Alignment.bottomCenter,
//                       child: SizedBox(
//                         height: 50,
//                         width: 150,
//                         child: ElevatedButton(
//                           onPressed: () {
//                              if (_formKey.currentState!.validate()) {
//                                (Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) => AccountLink())));
//                              }
//
//                              pass.phone = _phone.text;
//                              pass.whatsapp = _whatsapp.text;
//                              pass.email =  _email.text;
//
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red,
//                           ),
//                           child: const Text(
//                             'Next',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//             ),
//           ),
//         ));
//   }
//
//   void _printLatestValue() {
//     print('Second text field: ${myController.text}');
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Start listening to changes.
//     myController.addListener(_printLatestValue);
//   }
// }
