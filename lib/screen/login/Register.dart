import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:japan_bank/screen/Account/Accounttype.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();

bool?isChecked=false;
  var isLoading = false;
  bool isCheckedRememberMe = false;
  var isRemarkEnabled= true;

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return  MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child:Scaffold(
            body: Padding(padding: EdgeInsets.all(0),
                child: ListView(
                    children:  [

                      SizedBox(height: height*0.060,),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset('assets/images/image.png',width: 140,height: 140,)),
                      SizedBox(height: height*0.040,),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                          child: Text(
                              'Welcome',
                              textScaleFactor: 1.0,
                              style:TextStyle(fontSize:30, fontWeight: FontWeight.w700,

                              ),
                              textAlign: TextAlign.start),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                          child: Text(
                              'Enter detail to continue',
                              textScaleFactor: 1.0,
                              style:TextStyle(fontSize:18, fontWeight: FontWeight.w400, color: Color(0xff757575),),
                              textAlign: TextAlign.start),
                        ),
                      ),


                Padding(padding: EdgeInsets.all(0),
                    child:

                      Form(
                        key: _key,
                        child:
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height:10,
                              ),
                              const Text(
                                "User Name",
                                textScaleFactor: 1.0,
                                style: TextStyle(fontSize:14, fontWeight: FontWeight.w400,fontFamily: 'inter', color: Color(0xff000000),),
                                textAlign: TextAlign.start,
                              ),



                              const SizedBox(
                                height:  10,
                              ),

                              SizedBox(

                                width: size.width,
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'\s')),
                                    LengthLimitingTextInputFormatter(30),
                                  ],
                                  controller: username,
                                  enabled: isRemarkEnabled,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(

                                    prefixIcon: Wrap(
                                      alignment: WrapAlignment.center,

                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0,top: 10),
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                // color: Colors.cyan,
                                                image: DecorationImage(image: AssetImage('assets/images/box.png')),

                                              ),

                                              height: 40,
                                              width: 40,
                                              child: const Icon(Icons.perm_identity,color: Colors.white,size: 20,)),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10.0),
                                          child: SizedBox(
                                              height: 40,
                                              child: VerticalDivider(thickness: 2,color: Colors.grey,)),
                                        )
                                      ],
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color:Colors.grey)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color:Color(0xffE41D29))),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color:Colors.grey)),
                                    hintText :"Enter User Name",
                                    hintStyle: TextStyle(fontSize: 14,
                                        fontWeight: FontWeight.w400,color: Color(0xffA8A5A5),),



                                  ),
                                  validator: (CurrentValue){
                                    var nonNullValue=CurrentValue??'';
                                    if(nonNullValue.isEmpty){
                                      return ("Please Enter User Name");
                                    }

                                    return null;
                                  },
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  // validator: (value) {
                                  //   if(value!.isEmpty) {
                                  //     return 'Please Enter User Name';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ),


                              SizedBox(
                                // height: Dimensions.dp60_0,
                                width: size.width,
                                child: const SizedBox(
                                  height:  10,
                                ),

                              ),
                              const SizedBox(
                                height:10,
                              ),
                              const Text(
                                  "Password",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(fontSize:14, fontWeight: FontWeight.w400,fontFamily: 'inter', color: Color(0xff000000),),
                                  textAlign: TextAlign.start
                              ),
                              const SizedBox(
                                height:  10,
                              ),
                              SizedBox(
                                // height: Dimensions.dp60_0,
                                width: size.width,
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'\s')),
                                    LengthLimitingTextInputFormatter(30),
                                  ],
                                  obscureText: true,
                                  controller: passwordController,
                                  enabled: isRemarkEnabled,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    prefixIcon: Wrap(
                                      alignment: WrapAlignment.center,

                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0,top: 10),
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                // color: Colors.cyan,
                                                image: DecorationImage(image: AssetImage('assets/images/box.png')),

                                              ),
                                              // color: Colors.cyan,
                                              height: 40,
                                              width: 40,
                                              child: const Icon(Icons.lock,color: Colors.white,size: 20,)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                          child: SizedBox(
                                              height: 40,
                                              child: VerticalDivider(thickness: 2,color: Colors.grey,)),
                                        )
                                      ],
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color:  Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color:  Colors.grey)),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color:  Colors.grey)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey)),
                                    hintText: "Enter Password",        hintStyle: TextStyle(fontSize: 14,

                                    fontWeight: FontWeight.w400,color: Color(0xffA8A5A5),)),
                                  // validator: (value) {
                                  //   if(value!.isEmpty) {
                                  //     return 'Please Enter Password';
                                  //   }
                                  //   return null;
                                  // },
                                  validator: (PassCurrentValue){
                                    RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                    var passNonNullValue=PassCurrentValue??"";
                                    if(passNonNullValue.isEmpty){
                                      return ("Password is required");
                                    }
                                    else if(passNonNullValue.length<6){
                                      return ("Password Must be more than 5 characters");
                                    }
                                    else if(!regex.hasMatch(passNonNullValue)){
                                      return ("Password should contain upper,lower,digit and Special character ");
                                    }
                                    return null;
                                  },
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                ),
                              ),

                              Row(


                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                                  SizedBox(width: 5.0),
                                  Text("Remember Me",   textScaleFactor: 1.0,
                                    style:  TextStyle( color: Color(0xff737373),fontFamily: 'inter',fontSize: 16,fontWeight: FontWeight.w400,
                                      decorationThickness: 0.0,
                                    ),),


                                  const Expanded(child: SizedBox()),
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
                                        "  Forgot Password?",
                                        textScaleFactor: 1.0,
                                        style: TextStyle( color: Color(0xff737373),fontFamily: 'inter',fontSize: 16,fontWeight: FontWeight.w400,
                                          decorationThickness: 1,
                                        ),
                                        textAlign: TextAlign.end
                                    ),
                                  ),
                                ],
                              ) ,

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Accounttype()));
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
                                        " Register Now",
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 1,
                                        ),
                                        textAlign: TextAlign.center
                                    ),
                                  ),
                                ],
                              )  ,

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {

                                    },
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.hovered)) {
                                              return Colors.grey;
                                            }
                                            return Color(0xffE41D29);
                                          }),
                                    ),
                                    child: Image.asset('assets/images/finger.png',width: width*0.15,),

                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: SizedBox(
                                        height: 35,

                                        child: VerticalDivider(thickness: 1,color: Colors.grey,)),
                                  ),


                                  TextButton(
                                    onPressed: () {

                                    },
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                            if (states.contains(MaterialState.hovered))
                                              return Colors.grey;
                                            return Color(0xffE41D29);
                                          }),
                                    ),
                                    child: Image.asset('assets/images/face.png',width: width*0.15,),
                                  ),



                                ],
                              ),

                            ],
                          ),
                        ),
                      )
                      ,),

                      SizedBox(
                        height: height * 0.060,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Accounttype()));
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffE41D29),
                              minimumSize: Size(150, 60),
                            ),
                            child: const Text(
                              'Submit',
                              textScaleFactor: 1.0,style: TextStyle(fontFamily: 'inter',fontSize: 18,fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ])
            )
        )
    );
  }
}
