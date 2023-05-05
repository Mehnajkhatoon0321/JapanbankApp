import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:japan_bank/screen/Account/Choose_userAccount.dart';
import 'package:japan_bank/screen/Account/Conform%20Account.dart';
import 'package:japan_bank/screen/Tpin/Alternative%20Option.dart';


class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {

  final GlobalKey<FormState> _key = GlobalKey();
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
        body: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Scaffold(
                body: Padding(
              padding: EdgeInsets.all(0),
              child: ListView(
                children: [
              Image.asset('assets/images/man.png',height: 300,width: 300,),


              Padding(padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Text('Account Link',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.start),
                      ),
                    ),
SizedBox(height: 20,),
                Form(
                  key: _key,
                  child:
                  Column(
                    children: [
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                            child: Text(
                              "Input Code",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000000),
                              ),
                              textAlign: TextAlign.start,
                            ),
                          )
                      ),

                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                        child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r'\s')),
                      LengthLimitingTextInputFormatter(10),
                    ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.grey),
                              ),

                              hintText: "Enter Code",        hintStyle: TextStyle(fontSize: 14,
                            fontWeight: FontWeight.w400,color: Color(0xffA8A5A5),)
                          ),validator: (value) {
                          if(value!.isEmpty) {
                            return 'Please Enter Code';
                          }
                          return null;
                        },

                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>   ConformAccount()));
                              });
                            }

                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffE41D29),
                            minimumSize: Size(150, 50),
                          ),
                          child: const Text('Next'),
                        ),
                      ),
                    ],
                  )
                ),

                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 25),
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                (Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AlternativeOption())));
                              },
                            child: Text(
                              "Alternate option to generate code",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffE41D29)),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        )),
                    ) ],
                ),
              )
                ],
              ),
            ))));
  }
}
