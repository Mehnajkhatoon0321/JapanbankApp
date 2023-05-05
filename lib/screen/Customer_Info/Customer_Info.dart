
import 'package:date_format_field/date_format_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:japan_bank/Utils/help.dart';
import 'package:japan_bank/screen/Customer_Info/IDcard.dart';


class Createinfo extends StatefulWidget {
  const Createinfo({Key? key}) : super(key: key);

  @override
  State<Createinfo> createState() => _CreateinfoState();
}

class _CreateinfoState extends State<Createinfo> {
  var changeid = true;
  var checkindex = false;
  var _selected;
  bool checkid = false;




  DateTime? _date;


  var isLoading = false;

  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateInputController = TextEditingController();
  List<Map> _myJson = [
    {"id": '1', "image": "assets/images/chi.png", "name": "Chinese"},
    {"id": '2', "image": "assets/images/jap.png", "name": "Japanese"},
    {"id": '3', "image": "assets/images/english.png", "name": "English"},
    {"id": '4', "image": "assets/images/chi.png", "name": "Chinese"},
    {"id": '5', "image": "assets/images/jap.png", "name": "Japanese"},
    {"id": '6', "image": "assets/images/english.png", "name": "English"},
    {"id": '7', "image": "assets/images/chi.png", "name": "Chinese"},
    {"id": '8', "image": "assets/images/jap.png", "name": "Japanese"},
    {"id": '9', "image": "assets/images/english.png", "name": "English"},
    {"id": '10', "image": "assets/images/chi.png", "name": "Chinese"},
    {"id": '11', "image": "assets/images/jap.png", "name": "Japanese"},
    {"id": '12', "image": "assets/images/english.png", "name": "English"},
  ];
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
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
                                      "First Name",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff000000),
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 16),
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'\s')),
                                    LengthLimitingTextInputFormatter(30),
                                  ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter First Name',
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffA8A5A5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.grey)),
                                    ),
                   validator: (value) {
                        RegExp regex = RegExp(r'^[a-z A-Z]+$');
                        if(value!.isEmpty){
                          return ("Enter your first name.");
                        }
                        else if(value.length<3){
                          return ("Name must be more than 2 characters.");
                        }
                        else if(!regex.hasMatch(value)){
                          return ("Name should not contain digit and special character .");
                        }
                        return null;
                      },
                                  autovalidateMode: AutovalidateMode.onUserInteraction,


                                ),
                              ),
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 0),
                                    child: Text(
                                      "Last Name",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.start,
                                    ),
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 16),
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'\s')),
                                    LengthLimitingTextInputFormatter(30),
                                  ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Enter Last Name',
                                      hintStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffA8A5A5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.grey)),
                                    ),
                                    validator: (value) {
                        RegExp regex = RegExp(r'^[a-z A-Z]+$');
                        if(value!.isEmpty){
                          return ("Enter your last name");
                        }
                        else if(value.length<3){
                          return ("Name must be more than 2 characters");
                        }
                        else if(!regex.hasMatch(value)){
                          return ("Name should not contain digit and special character ");
                        }
                        return null;
                      },
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                    // validator: (value) => value!.isEmpty
                                    //     ? ' Please enter your last name.'
                                    //     : (nameRegExp.hasMatch(value!)
                                    //     ? null
                                    //     : 'Enter a valid last name.')
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 0),
                                    child: Text(
                                      "Gender",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.start,
                                    ),
                                  )),
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
                                                child: Text("Male",
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
                                                child: Text("Female",
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
                              SizedBox(
                                height: height / 38,
                              ),
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 0),
                                    child: Text(
                                      "Date Of Birth",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.start,
                                    ),
                                  )),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 5),
                                child:
                                Padding(
                                  padding: const EdgeInsets.only(top: 13),
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
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    child: Text(
                                      "Nationality",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.start,
                                    ),
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 16),
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: true,
                                              child: DropdownButton<String>(
                                                isDense: true,
                                                hint:
                                                Text("Select  Nationality"),
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xffA8A5A5),
                                                ),
                                                value: _selected,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _selected = newValue!;
                                                  });

                                                  print(_selected);
                                                },
                                                items: _myJson.map((Map map) {
                                                  return new DropdownMenuItem<
                                                      String>(
                                                    value: map["id"].toString(),
// value: _mySelection,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Image.asset(
                                                          map["image"],
                                                          width: 28,
                                                        ),
                                                        Container(
                                                            margin:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                            child: Text(
                                                                map["name"])),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: height * 0.040,
                              ),
                              SizedBox(
                                height: height * 0.059,
                                child: Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const pasport()));
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xffE41D29),
                                      minimumSize: Size(150, 50),
                                    ),
                                    child: const Text('Next'),
                                  ),
                                ),
                              ),
                            ])),
                  ),
                ]),
              ])),
        ));
  }
}





// class CustomerInfo extends StatefulWidget {
//   const CustomerInfo({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<CustomerInfo> createState() => _CustomerInfoState();
// }
//
// class _CustomerInfoState extends State<CustomerInfo> {
//   final _formKey = GlobalKey<FormState>();
//   final firstname = TextEditingController();
//   final lastname = TextEditingController();
//   final gender = TextEditingController();
//   final _Nationality = TextEditingController();
//
//   bool checkid = false;
//
//
//
//   DateTime? _date;
//
//   Country? _selectedCountry;
//
//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//     final double width = MediaQuery.of(context).size.width;
//     var size = MediaQuery.of(context).size;
//     return Form(
//         key: _formKey,
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             elevation: 0,
//             backgroundColor: Colors.white,
//             leading: Container(
//               alignment: Alignment.centerLeft,
//               child: IconButton(
//                 icon: const Icon(
//                   Icons.arrow_back,
//                   color: Colors.black,
//                   size: 26,
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//           ),
//           body: MediaQuery(
//             data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(25, 8, 26, 0),
//               child: ListView(
//                 children: [
//                   const Text(
//                     "Customer Info",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 24,
//                       fontFamily: "inter",
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 31),
//                     child: Text(
//                       "First Name",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                         fontFamily: "inter",
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 13),
//                     child: TextFormField(
//                       maxLength: 20,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       controller: firstname,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         fillColor: const Color(0xffB9B9B9),
//                         hintText: 'Enter First Name',
//                       ),
//                       validator: (value) {
//                         RegExp regex = RegExp(r'^[a-z A-Z]+$');
//                         if(value!.isEmpty){
//                           return ("Enter your first name");
//                         }
//                         else if(value.length<3){
//                           return ("Name must be more than 2 characters");
//                         }
//                         else if(!regex.hasMatch(value)){
//                           return ("Name should not contain digit and special character ");
//                         }
//                         return null;
//                       },
//                     /*  validator: (value) => value!.isEmpty
//                           ? 'Enter Your Name'
//                           :RegExp regex= RegExp('!@#<>?":_``~;[]\|=-+)(*&^%1234567890')
//                           ? 'Enter a Valid Name'
//                           : null,*/
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 05),
//                     child: Text(
//                       "Last Name",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                         fontFamily: "inter",
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 13),
//                     child: TextFormField(
//                       maxLength: 20,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       controller: lastname,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         fillColor: const Color(0xffB9B9B9),
//                         hintText: 'Enter Last Name',
//                       ),
//                       validator: (value) {
//                         RegExp regex = RegExp(r'^[a-z A-Z]+$');
//                         if(value!.isEmpty){
//                           return ("Enter your first name");
//                         }
//                         else if(value.length<3){
//                           return ("Name must be more than 2 characters");
//                         }
//                         else if(!regex.hasMatch(value)){
//                           return ("Name should not contain digit and special character ");
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 13 ,bottom: 13),
//                     child: Text(
//                       "Gender",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                         fontFamily: "inter",
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         height: height * 0.07,
//                         width: width * 0.40,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               checkid = false;
//                             });
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor:
//                                 checkid ? Colors.white : Colors.red,
//                             side:
//                             const BorderSide(width: 1, color: Colors.grey),
//                           ),
//                           child: Text(checkid ? 'Male' : 'Male',
//                               style: TextStyle(
//                                   color: checkid ? Colors.grey : Colors.white)),
//                         ),
//                       ),
// // SizedBox(
// //   width: width * 0.04,
// // ),
//                       SizedBox(
//                         height: height * 0.07,
//                         width: width * 0.40,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               checkid = true;
//                             });
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor:
//                                 checkid ? Colors.red : Colors.white,
//                             side:
//                                 const BorderSide(width: 1, color: Colors.grey),
//                           ),
//                           child: Text(
//                             'Female',
//                             style: TextStyle(
//                               color: checkid ? Colors.white : Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 20),
//                     child: Text(
//                       "Date Of Birth",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                         fontFamily: "inter",
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 13),
//                     child: DateFormatField(
//                       type: DateFormatType.type4,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         fillColor: const Color(0xff000000),
//                         hintText: 'DD/MM/YYYY',
//                       ),
//                       onComplete: (date) {
//                         setState(() {
//                           _date = date;
//                         });
//                       },
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 20),
//                     child: Text(
//                       "Nationality",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14,
//                         fontFamily: "inter",
//                       ),
//                     ),
//                   ),
//                   /*  Container(
//                     margin: const EdgeInsets.fromLTRB(25, 13, 26, 0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.black38,
//                         ),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(10)),
//                       ),
//
//                     ),*/
//                   Padding(
//                     padding: const EdgeInsets.only(top: 13),
//                     child: TextField(
//                       showCursor: false,
//                       controller: _Nationality,
//                       decoration: InputDecoration(
//                         /*contentPadding: const EdgeInsets.symmetric(
//                             vertical: 15.0, horizontal: 15),*/
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Colors.grey,
//                             width: 1,
//                           ),
//                         ),
//                         prefixIcon: TextButton(
//                           onPressed: () {
//                             showCountryPicker(
//                               context: context,
//                               onSelect: (value) {
//                                 setState(
//                                   () {
//                                     _selectedCountry = value;
//                                   },
//                                 );
//                               },
//                             );
//                           },
//                           child: Text(
//                             "${_selectedCountry?.flagEmoji}  ${_selectedCountry?.displayNameNoCountryCode}",
//                           ),
//                         ),
//                         suffixIcon: IconButton(
//                           onPressed: (){
//                             showCountryPicker(
//                               context: context,
//                               onSelect: (value) {
//                                 setState(
//                                       () {
//                                     _selectedCountry = value;
//                                   },
//                                 );
//                               },
//                             );
//                           },
//                           icon: const Icon(Icons.arrow_drop_down_outlined),
//                         ),
//
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.03,
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
//                             if (_formKey.currentState!.validate()) {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => const CustomerInfo2()));
//                             }
//                             pass.Firstname = firstname.text;
//                             pass.lastname = lastname.text;
//                             pass.dateofbirth = _date.toString();
//                             pass.Nationality = _Nationality.text;
//                           },
//                           style: ElevatedButton.styleFrom(
//                             bFfirst
//                             ackgroundColor: Colors.red,
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
//               ),
//             ),
//           ),
//         ));
//   }
// }
