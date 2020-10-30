import 'package:flutter/material.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;

class SiteAddress extends StatefulWidget {
  @override
  _SiteAddressState createState() => _SiteAddressState();
}

class _SiteAddressState extends State<SiteAddress> {

  TextEditingController address= TextEditingController();
  TextEditingController city= TextEditingController();
  TextEditingController postcode= TextEditingController();
  bool _autovalidation=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            Text("Address",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5,address,_autovalidation,TextInputType.text,"Site Address",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter Site Address';
                    }
                    return null;
                  },context),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Text("Town/City",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(city,false,_autovalidation,TextInputType.text,"Town/City",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter Town/City';
                    }
                    return null;
                  },context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Text("PostCode",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(postcode,false,_autovalidation,TextInputType.number,"PostCode",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter PostCode';
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
                  child: Text("Save And Next",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
                      fontWeight: FontWeight.bold),),
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(155, 119, 217, 1),
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
              onTap: (){
                globals.tabController5.animateTo(3);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.028,
            ),
          ],
        ),
      ),
    );
  }
}
