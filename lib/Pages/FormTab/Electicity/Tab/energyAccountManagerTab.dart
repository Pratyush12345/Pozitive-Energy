import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;

class EnergyAccountManager extends StatefulWidget {
  @override
  _EnergyAccountManagerState createState() => _EnergyAccountManagerState();
}

class _EnergyAccountManagerState extends State<EnergyAccountManager> {
  bool _autovalidation=false;
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController mobile=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Text("(For day to day running of the account)",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.013,color: Color.fromRGBO(31, 33, 29, 1),fontWeight: FontWeight.bold),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.005,
            ),
            Text("Name",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(name,false,_autovalidation,TextInputType.text,"Name",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),

            Text("Email Address",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfieldEmail(email,false,_autovalidation,TextInputType.emailAddress,"Email Address",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter email address';
                    }
                    return null;
                  },context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Text("Phone No.",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(phone,false,_autovalidation,TextInputType.number,"Phone No",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter phone no';
                    }
                    return null;
                  },context),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),

            Text("Mobile No.",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(mobile,false,_autovalidation,TextInputType.number,"Mobile No",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter mobile no';
                    }
                    return null;
                  },context),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.062,
                child: Center(
                  child: Text("Save And Next",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.017,
                      fontWeight: FontWeight.bold),),
                ),
                decoration: BoxDecoration(
                    color: ThemeApp().purplecolor,
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
              onTap: (){
                globals.tabController1.animateTo(5);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.028,
            ),



          ],
        ),),
    );
  }
}
