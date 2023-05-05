import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:japan_bank/Utils/Widget.dart';
import 'package:japan_bank/screen/Home/Choose_user.dart';

class languaues extends StatefulWidget {
  const languaues({Key? key}) : super(key: key);

  @override
  State<languaues> createState() => _languauesState();
}
List imaglist=[
  CircleAvatar(
    backgroundColor: Colors.red,
    backgroundImage: AssetImage('assets/images/lao.png'),
  ),
  CircleAvatar(
    backgroundColor: Colors.red,
    backgroundImage: AssetImage('assets/images/english.png'),
  ),
  CircleAvatar(
    backgroundColor: Colors.red,
    backgroundImage: AssetImage('assets/images/jap.png'),
  ),
  CircleAvatar(
    backgroundColor: Colors.red,
    backgroundImage: AssetImage('assets/images/chi.png'),
  )

];
List country=['Laos','English','Japanese','Chinese'

];
var checkindex=true;
var checkindexInt=0;

class _languauesState extends State<languaues> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height ;
    final double width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body:MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
    child: Column(
    children: [
      Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(right: 0,top: 30),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Choose_user()));
            },
            child: Container(
              height: 30,
              width: 70,
              alignment: Alignment.center,
              child: Text('Skip',style: TextStyle(fontWeight:FontWeight.w400,fontSize: 17,color: Color(0xff757575)),),
            ),
          ),

        ),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          height: 100,
          width: 100,
          child: Padding(padding: EdgeInsets.all(15),
          child: Image.asset('assets/images/gicon.png'),),
        ),

      ),
      SizedBox(height: 10,

      ),
      const Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
          child: Text('Choose Your Preferred Language',
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Color(0xff000000)
            ),textAlign: TextAlign.start,
            ),
        ),

      ),

      const Align(
        alignment: Alignment.topLeft,
        child:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Text('Please select your language', maxLines: 1,

            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400, color: Color(0xff757575),
            ),textAlign: TextAlign.start,
          ),
        ),

      ),
      Container(
        height: height/1.8,
        child: ListView.builder(  itemCount: imaglist.length, itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              setState(() {
                print(index);


                checkindexInt=index;
              });
            },
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    child: imaglist[index],
                  ),
                  trailing:checkindexInt==index?Image.asset('assets/images/sahi.png',height: 20,):const SizedBox(),
                  title: Text(country[index],
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontWeight:FontWeight.w500,fontSize: 16
                  ),
                  textAlign: TextAlign.start,),
                ),
                ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  thickness: 1,
                  color: Color(0xffE4E4E4),
                ),)
              ],
            ),
          );
        },
        ),

      ),
      Expanded(child: SizedBox()),
      Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: width/2,
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Choose_user()));
            },child:MahiWidget.Movebutton(context,),
          ),
        ),
      ),
    ],
      )
    ));
  }
}
