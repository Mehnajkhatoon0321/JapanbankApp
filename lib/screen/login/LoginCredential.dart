import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:japan_bank/screen/Account/Accounttype.dart';
import 'package:japan_bank/screen/Customer_Info/Customer_Info.dart';

class LoginCredential extends StatefulWidget {
  const LoginCredential({Key? key}) : super(key: key);

  @override
  State<LoginCredential> createState() => _LoginCredentialState();
}

class _LoginCredentialState extends State<LoginCredential> {

  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController username=TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  var isLoading = false;
  final bool _hasBeenPressed = false;
  var isRemarkEnabled = true;

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
                  Column(children: [
                    SizedBox(
                      height: height * 0.060,
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          'assets/images/image.png',
                          width: 140,
                          height: 140,
                        )),
                    SizedBox(
                      height: height * 0.060,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Text('Login Credential',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.start),
                      ),
                    ),



                    SizedBox(
                      height: height * 0.010,
                    ),

                    Form(
                      key: _key,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Create User Name",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000),fontFamily: 'inter'),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 10,
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


                                controller: emailController,
                                enabled: isRemarkEnabled,
                                keyboardType: TextInputType.name,

                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    prefixIcon: Wrap(
                                    alignment: WrapAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 10),
                                        child: Container(
                                            decoration: const BoxDecoration(
                                              // color: Colors.cyan,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/box.png')),
                                            ),
                                            // color: Colors.cyan,
                                            height: 40,
                                            width: 40,
                                            child: const Icon(
                                              Icons.perm_identity,
                                              color: Colors.white,
                                              size: 20,
                                            )),
                                      ),
                                      const Padding(
                                        padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                        child: SizedBox(
                                            height: 40,
                                            child: VerticalDivider(
                                              thickness: 2,
                                              color: Colors.grey,
                                            )),
                                      )
                                    ],
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.grey)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.grey)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.red)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.grey)),
                                  hintText: "Enter User Name",        hintStyle: TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.w400,color: Color(0xffA8A5A5),)
                                ),
                                validator: (CurrentValue){
                                  var nonNullValue=CurrentValue??'';
                                  if(nonNullValue.isEmpty){
                                    return ("Please enter user name.");
                                  }

                                  return null;
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     return 'Please Enter User Name';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            const Text("Create Password",
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000),fontFamily: 'inter'),
                                textAlign: TextAlign.start),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              // height: Dimensions.dp60_0,
                              width: size.width,
                              child: TextFormField(

                                obscureText: true,
                                  controller: _pass,
                                enabled: isRemarkEnabled,
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                  LengthLimitingTextInputFormatter(30),
                                ],
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    prefixIcon: Wrap(
                                      alignment: WrapAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 10),
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                // color: Colors.cyan,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/box.png')),
                                              ),
                                              height: 40,
                                              width: 40,
                                              child: const Icon(
                                                Icons.lock,
                                                color: Colors.white,
                                                size: 20,
                                              )),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: SizedBox(
                                              height: 40,
                                              child: VerticalDivider(
                                                thickness: 2,
                                                color: Colors.grey,
                                              )),
                                        )
                                      ],
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Colors.grey)),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Colors.grey)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Colors.grey)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                        const BorderSide(color: Colors.grey)),
                                    hintText: "Enter Password"         ,hintStyle: const TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.w400,color: Color(0xffA8A5A5),)),
                                validator: (PassCurrentValue){
                                  RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                  var passNonNullValue=PassCurrentValue??"";
                                  if(passNonNullValue.isEmpty){
                                    return ("Password is required.");
                                  }
                                  else if(passNonNullValue.length<6){
                                    return ("Password must be more than 5 characters.");
                                  }
                                  else if(!regex.hasMatch(passNonNullValue)){
                                    return ("Password should contain upper,lower,digit and Special character.");
                                  }
                                  return null;
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                  // validator: (val){
                                  //   if(val!.isEmpty)
                                  //     return 'Please Enter Password';
                                  //   return null;
                                  // }



                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     return 'Please Enter Password';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Confirm Password",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000),fontFamily: 'inter'),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              // height: Dimensions.dp60_0,
                              width: size.width,
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                obscureText: true,
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'\s')),
                                  LengthLimitingTextInputFormatter(30),
                                ],
                                controller: _confirmPass,
                                enabled: isRemarkEnabled,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                  prefixIcon: Wrap(

                                    alignment: WrapAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 10),
                                        child: Container(
                                            decoration: const BoxDecoration(
                                              // color: Colors.cyan,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/box.png')),
                                            ),
                                            // color: Colors.cyan,
                                            height: 40,
                                            width: 40,
                                            child: const Icon(
                                              Icons.lock,
                                              color: Colors.white,
                                              size: 20,
                                            )),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: SizedBox(
                                            height: 40,
                                            child: VerticalDivider(
                                              thickness: 2,
                                              color: Colors.grey,
                                            )),
                                      )
                                    ],
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.grey)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.grey)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.grey)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                      const BorderSide(color: Colors.grey)),
                                  hintText: "Re-enter Password",        hintStyle: const TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.w400,color: Color(0xffA8A5A5),)
                                ),
                                validator: (PassCurrentValue){
                                  RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                  var passNonNullValue=PassCurrentValue??"";
                                  if(passNonNullValue.isEmpty){
                                    return ("Please re-enter password.");
                                  }
                                  if(passNonNullValue!=_pass.text){
                                    return ("Password must be same.");
                                  }

                                  return null;
                                },

                                  // validator: (val){
                                  //   if(val!.isEmpty)
                                  //     return 'Please Re-enter Password';
                                  //   if(val != _pass.text)
                                  //     return 'Not Match';
                                  //   return null;
                                  // }

                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
SizedBox(height: 100,),


Align(
  alignment: Alignment.bottomCenter,
  child:  SizedBox(
    height: height * 0.060,
    child: Center(
      child: ElevatedButton(
        onPressed: () {
          if (_key.currentState!.validate()) {
            setState(() {
              isLoading = true;
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const  Accounttype()));
            });
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xffE41D29),
          minimumSize: Size(150, 60),
        ),
        child: const Text(
          'Next',
          textScaleFactor: 1.0,style: TextStyle(fontFamily: 'inter',fontSize: 18,fontWeight: FontWeight.w600),
        ),
      ),
    ),
  ) ,
)




                  ]),
                ] ),
          ) ,

        )
    );
  }
}
