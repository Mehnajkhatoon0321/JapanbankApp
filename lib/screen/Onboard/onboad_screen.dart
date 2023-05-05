import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:japan_bank/screen/Langauge/languagues.dart';




class OnbordScreen extends StatefulWidget {
  @override
  _OnbordScreenState createState() => _OnbordScreenState();
}

class _OnbordScreenState extends State<OnbordScreen> {
  int state = 1;

  List<SliderModel> slides = [
    SliderModel(
        title: 'Convenient',
        description: 'Open Bank Account, Check Balance, Transfer Funds, Apply for Debit and Credit Cards.',
        image: 'assets/images/Frame.png',
        check: true,
      ),
    SliderModel(
        title: 'Scan & Pay',
        description: 'Use MARUHAN App When you Shop, Dine and Make QR Payment, It\'s Easy, Fast and Secure.',
        image: 'assets/images/Frame1.png',
        check: false,
       ),
    SliderModel(
        title: 'Do More',
        description: 'Perform Mobile Top Up, Pay Bills, Withdraw Cash without Card with Cash by Code.',
        image: 'assets/images/Frame2.png',
        check: false,
       ),
  ];


  int currentIndex = 0;
  late PageController _controller;

  int _currentPage = 0;

  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.9;
    final double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Stack(
            children: <Widget>[

              Container(
                width: double.infinity,
                height: double.infinity,

                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemCount: slides.length,
                    itemBuilder: (context, index) {

                      return Stack(children: <Widget>[
                        Column(
                          children: [

                            SizedBox(height: height/8,),
                            SizedBox(
                              width: width/1.5,
                              height: height/3,
                              child: Slider(
                                image: slides[index].getImage(),
                              ),
                            ),
                            SizedBox(height: height/10,),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  width / 15, 10, width / 15, 0),
                              child: Container(

                                height: 260,

                                alignment: Alignment.center,
                                child: Column(

                                  children: [
                                    Text(
                                        slides[index].getTitle(),
                                        textScaleFactor: 1.0,
                                        style: const TextStyle(
                                          fontSize: 32,
                                          color: Colors.black,
                                          fontFamily: 'inter',
                                          fontWeight:FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center),
                                    SizedBox(height: height/30,),
                                    Text(
                                        slides[index].description,
                                        textScaleFactor: 1.0,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight:FontWeight.w400,
                                            color: Color(0xff5A5A5A),
                                            fontFamily: 'inter'),
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),



                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0, top: 0,bottom: 25),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  languaues()),

                                        (Route<dynamic> route) => false);
                              },
                              child: Container(
                                height: 30,
                                width: 70,
                                alignment: Alignment.center,

                                child:  currentIndex==2
                                    ? const Text(
                                  'Done',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey,fontFamily: 'inter'),
                                )
                                    :const Text(
                                  'Skip',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]);
                    }),
              ),
              currentIndex==0
                  ?const SizedBox()
                  :Positioned(
                  left: 0,
                  bottom: 20,
                  child: Container(
                    height:height*0.230,
                    width:width*0.12,
                    alignment: Alignment.center,
                    child:  InkWell(
                        onTap: (){
                          _pageController.previousPage(duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
                        },
                        child:Stack(
                          children: [
                            Center(child: Image.asset('assets/images/slidepic2.png',width: 50,)),
                            Center(child: Image.asset('assets/images/arrowright.png',width: 40,))
                          ],
                        )

                    ),
                  )),
              Positioned(
                  right: 0,
                  bottom: 20,
                  child: Container(
                    height:height*0.230,
                    width:width*0.12,
                    alignment: Alignment.center,
                    child: InkWell(
                        onTap: (){

                          _pageController.nextPage(duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
                        },
                        child: Stack(
                          children: [
                            Center(child: Image.asset('assets/images/slidepic1.png',width: 50,)),
                            Center(child: Image.asset('assets/images/threearrowleft.png',width: 40,))
                          ],
                        )
                    ),
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  // color: Colors.grey,
                  margin: EdgeInsets.fromLTRB(5, 0, 0, height/4),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      slides.length,
                          (index) => buildDot(index, context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),


      ),
    );
  }

// container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 10 : 10,
      margin: EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? Colors.red
            : Colors.grey,
      ),
    );
  }
}

class Slider extends StatelessWidget {
  String image;

  Slider({required this.image});

  int get state => 1;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.5;
    return SizedBox(
      width:  300,
      // height:  ,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}

class SliderModel {
  String image;
  String title;
  String description;

  bool check;

  SliderModel({
    required this.title,
    required this.description,

    required this.image,
    required this.check,
  });

  void setImage(String getImage) {
    image = getImage;
  }

  void setCheck(bool getCheck) {
    check = getCheck;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  bool getCheck() {
    return check;
  }

  String getImage() {
    return image;
  }

  String getTitle() {
    return title;
  }

  String getDescription() {
    return description;
  }


}





