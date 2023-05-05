import 'dart:io';

import 'package:date_format_field/date_format_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:japan_bank/Utils/help.dart';
import 'package:japan_bank/screen/Upload%20Selfie/Upload_Selfie.dart.dart';



class pasport extends StatefulWidget {
  const pasport({Key? key}) : super(key: key);

  @override
  State<pasport> createState() => _pasportState();
}
final GlobalKey<FormState> _key = GlobalKey();
var changeid=true;
var checkindex=false;
var isLoading = false;
bool checkid = true;

DateTime? _date;

File? _image;
final imagePicker = ImagePicker();
class _pasportState extends State<pasport> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    var size = MediaQuery
        .of(context)
        .size;


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
          backgroundColor: Colors.white,
          body: Padding(
              padding: const EdgeInsets.all(0),
              child: ListView(children: [
                Column(
              children: [
                SizedBox(height: height / 90,),
                const Align(


                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Text('Customer Info', style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 24),),
                  ),
                ),
    Form(
    key: _key,
    child: Padding(
      padding: const EdgeInsets.all(12),
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
              "ID Documents",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
              textAlign: TextAlign.start,
            ),
          )),
  //
  //  Align(
  //     alignment: Alignment.topLeft,
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(
  //           horizontal: 12, vertical: 0),
  //       child:
  //       Text("ID Documents", style: TextStyle(fontSize: 14,
  //           fontWeight: FontWeight.w400),
  //         textAlign: TextAlign.start,),
  //
  //     )
  // ),
          SizedBox(
            height: height / 45,
          ),
          Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        child: SizedBox(
                          height: 50,
                          width: 170,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: changeid
                                  ? MaterialStateProperty
                                  .all(Color(0xffE41D29))
                                  : MaterialStateProperty
                                  .all(Colors.white),
                              textStyle: checkindex
                                  ? MaterialStateProperty
                                  .all(Textbutton
                                  .choosebutton)
                                  : MaterialStateProperty
                                  .all(Textbutton
                                  .choosebutton),
                              shape: MaterialStateProperty
                                  .all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          10.0),
                                      side: BorderSide(
                                          color: Color(0xffE41D29)))),
                            ),
                            onPressed: () {
                              setState(() {
                                changeid = true;
                              });
                            },
                            child: Text("ID Card",
                                style: changeid
                                    ? TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.w600,
                                    color: Colors.white)
                                    : TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.w400,
                                    color:
                                    Colors.black)),
                          ),
                        ))),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        child: SizedBox(
                          height: 50,
                          width: 170,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: changeid
                                  ? MaterialStateProperty
                                  .all(Colors.white)
                                  : MaterialStateProperty
                                  .all(Color(0xffE41D29)),
                              textStyle: checkindex
                                  ? MaterialStateProperty
                                  .all(Textbutton
                                  .choosebutton)
                                  : MaterialStateProperty
                                  .all(Textbutton
                                  .choosebutton),
                              shape: MaterialStateProperty
                                  .all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          10.0),
                                      side: BorderSide(
                                          color: Color(0xffE41D29)))),
                            ),
                            onPressed: () {
                              setState(() {
                                changeid = false;
                              });
                            },
                            child: Text("Passport",
                                style: changeid
                                    ? const TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.w400,
                                    color: Colors.black)
                                    : const TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.w600,
                                    color:
                                    Colors.white)),
                          ),
                        ))),
              ]),



  Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 15, vertical: 16),
        child:
        Text(changeid?"ID Card Number":"Passport Number",  style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xff000000),
        ),
          textAlign: TextAlign.start,),

      )
  ),
  Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: 15, vertical: 0),
    child: TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.deny(
            RegExp(r'\s')),
        LengthLimitingTextInputFormatter(30),
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: (changeid?'Enter Card Number':"Enter Passport Number"),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xffA8A5A5),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(10),
            borderSide: const BorderSide(
                color:  Colors.grey)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return checkid ? 'Please enter valid passport number.' :'Please enter valid id card number.';
        }
        return null;
      },),
  ),

          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: 15),
                child:
                Text(changeid?"Expire Date":"Expire Date",  style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
                  textAlign: TextAlign.start,),

              )
          ),

  //         Padding(
  //   padding: const EdgeInsets.symmetric(
  //       horizontal: 15, vertical: 0),
  //   child: TextField(
  //     keyboardType: TextInputType.datetime,
  //     decoration: InputDecoration(
  //       suffixIcon: const Icon(Icons.calendar_month_outlined),
  //       border: const OutlineInputBorder(),
  //       hintText: 'DD/MM/YYYY',
  //       hintStyle: const TextStyle(fontSize: 14,
  //           fontWeight: FontWeight.w400),
  //       enabledBorder: OutlineInputBorder(
  //           borderRadius:
  //           BorderRadius.circular(11),
  //           borderSide: const BorderSide(
  //               color:  Colors.grey)),  ),
  //   ),
  // ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 12, vertical: 0),
            child:
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: DateFormatField(
                type: DateFormatType.type4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: const Color(0xff000000),
                  hintText: 'DD/MM/YYYY',
                ),
                onComplete: (date) {
                  setState(() {
                    _date = date;
                  });
                },
              ),
            ),
          ),
  SizedBox(height: height / 38,),


  const Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 15, vertical: 0),
        child:
        Text("KYC Document Upload", style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400),
          textAlign: TextAlign.start,),

      )
  ),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 15, vertical: 16),
                child: Stack(
    children: [

      Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(10.0)),
        color: Colors.white70.withOpacity(0.80),
        child: SizedBox(
          width:width,

          child: Column(
            children: [
              _image == null
                  ? GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0,
                        right: 0,
                        left: 0,
                        bottom: 10),
                    child: Image.asset('assets/images/req.png' ,),
                  ))
                  : GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0,
                        right: 20,
                        left: 20,
                        bottom: 10),
                    child: Container(
                      width: width * 0.80,
                      height: width * 0.5,
                      decoration: BoxDecoration(
                        color: Color(0xffE41D29),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(changeid?'Take Picture  of ID Card':'Take Picture of Passport',style: TextStyle(color: Colors.black),
                    textScaleFactor: 1.0, textAlign: TextAlign.start,),
              ),
            ],
          ),
        ),
      ),

    ],
  ),

            )
        ),



        ])

    )
    ),




                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 110, vertical: 5),
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: _image == null
                                ? MaterialStateProperty.all(Colors.grey)
                                : MaterialStateProperty.all(Color(0xffE41D29)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  // side: BorderSide(color: Colors.red)
                                ))),
                        onPressed: () {
                          if (_image != null) {
                            // _navigateToNextScreen(context);
                            setState(() {
                              isLoading = true;
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>  UploadSelfie()));
                          }
                        },
                        child: Text("Next",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'inter',
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      ),
                    )),
                SizedBox(height: 20,)
        ])
   ] )
    )
    ));
  }

  void _showPicker(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        // backgroundColor: Colors.black38,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(children: [
                const Text('Upload Selfie',
                    textScaleFactor: 1.0, textAlign: TextAlign.start),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Column(
                      children: [

                        InkWell(
                            onTap: () {
                              _imgFromCamera();
                              Navigator.of(context).pop();
                            },
                            child:Column(
                              children: [
                                Image.asset('assets/images/camera.png'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Camera' ,style: TextStyle(fontFamily: 'inter',fontWeight: FontWeight.w400,fontSize: 12),)


                              ],
                            )

                        ),



                      ],



                    ),SizedBox(
                      height: 20,
                    ),const VerticalDivider(thickness: 3,

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            _imgFromGallery();
                            Navigator.of(context).pop();
                          },

                          child:

                          Column(
                              children: [
                                SizedBox(
                                  height: 1,
                                ),
                                Image.asset('assets/images/gallary.png'),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(' Gallery',style: TextStyle(fontFamily: 'inter',fontWeight: FontWeight.w400,fontSize: 12))
                              ],
                            ),
                          ),


                      ],
                    )
                  ],
                ),
                // Row(
                //   children: <Widget>[
                //     InkWell(
                //       onTap: () {
                //         _imgFromCamera();
                //         Navigator.of(context).pop();
                //       },
                //       child: SizedBox(
                //         width: 60,
                //         child: Wrap(
                //           children: [
                //             SizedBox(
                //                 width: 50,
                //                 child: Image.asset('assets/images/camera.png')),
                //             const Text('Camera')
                //           ],
                //         ),
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: SizedBox(
                //           height: 50,
                //           width: 50,
                //           child: VerticalDivider(
                //             thickness: 1,
                //             color: Colors.grey,
                //           )),
                //     ),
                //     InkWell(
                //       onTap: () {
                //         _imgFromGallery();
                //         Navigator.of(context).pop();
                //       },
                //       child: Container(
                //         width: 80,
                //         child: Wrap(
                //           children: [
                //             SizedBox(
                //                 width: 50,
                //                 child: Image.asset('assets/images/gallary.png')),
                //             const Text(' Gallery')
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ]),
            ),
          );
        });
  }

  _imgFromCamera() async {
    final image = await imagePicker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  _imgFromGallery() async {
    PickedFile? image = await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }
}
