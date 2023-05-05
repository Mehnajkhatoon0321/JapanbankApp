import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:japan_bank/screen/Customer_Info/Contact%20Info.dart';


class UploadSelfie extends StatefulWidget {
  @override
  State<UploadSelfie> createState() => _UploadSelfieState();
}

var checkindex = true;
var _currentindex = 0;

class _UploadSelfieState extends State<UploadSelfie> {
  final GlobalKey<FormState> _key = GlobalKey();

  var isLoading = false;
  File? _image;
  final imagePicker = ImagePicker();
  String? userImage = '';
  var isRemarkEnabled = true;
  var selfiImgBase64 = '';
  var selfiImg = '';

  @override
  void initState() {
    super.initState();
  }

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


        body:
        ListView(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: Text(
                  'Customer Info',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 24),
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [



                SizedBox(
                  height: height,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.max,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.white70.withOpacity(0.80),
                          child: SizedBox(
                            width: width,
                            child: Column(
                              children: [
                                _image == null
                                    ? GestureDetector(
                                    onTap: () {
                                      _showPicker(context);
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0,
                                            right: 20,
                                            left: 20,
                                            bottom: 10),
                                        child: CircleAvatar(
                                          radius: width * 0.25,
                                          backgroundColor: Colors.red.shade800,
                                          // backgroundImage: AssetImage('images/profile.png',),
                                          child: Image.asset(
                                              'assets/images/profile.png'),
                                        )))
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
                                      child: CircleAvatar(
                                          radius: width * 0.25,
                                          backgroundColor: Color(0xffE41D29),
                                          backgroundImage: FileImage(
                                            _image!,
                                          ))),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20.0),
                                  child: Text('Selfie',
                                      textScaleFactor: 1.0,
                                      textAlign: TextAlign.start),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: height*0.385,),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 110, vertical: 10),
                            child: SizedBox(
                              height: height * 0.060,
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
                                        builder: (context) => mobilenumber()));
                                  }
                                },
                                child: Text(
                                'Next',
                                textScaleFactor: 1.0,style: TextStyle(fontFamily: 'inter',fontSize: 18,fontWeight: FontWeight.w400),
                              ),
                              ),
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
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
          return
            SafeArea(
            child:
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(children: [
                const Text('Upload Selfie',
                    textScaleFactor: 1.0, textAlign: TextAlign.start),
                const SizedBox(
                  height: 50,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,
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
                    Image.asset('assets/images/camera.png',height: 55,width: 55,),
                    SizedBox(
                      height: 2,
                    ),
                    Text('Camera' ,style: TextStyle(fontFamily: 'inter',fontWeight: FontWeight.w400,fontSize: 12),)


                  ],
                )

            ),



              ],



            ),


                 ],
                ),
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

        final bytes = _image?.readAsBytesSync();
        selfiImgBase64 = base64Encode(bytes!);
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
