import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;

class SiteAddressTab extends StatefulWidget {
  @override
  _SiteAddressTabState createState() => _SiteAddressTabState();
}

class _SiteAddressTabState extends State<SiteAddressTab> {



  TextEditingController address1Controller=TextEditingController();
  TextEditingController address2Controller=TextEditingController();
  TextEditingController postcode=TextEditingController();
  TextEditingController cityController=TextEditingController();
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
            height: MediaQuery.of(context).size.height*0.022,
          ),
          RichText(
            text: TextSpan(
              text: 'Address 1',
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
              children: <TextSpan>[
                TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
            child: innerLongtextfield(5,address1Controller,_autovalidation,TextInputType.text,"Site Address 1",
                    (value) {
                  if (value.isEmpty) {
                    return 'Please enter Site Address 1';
                  }
                  return null;
                },context),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.022,
          ),

          //Text("City",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
          RichText(
            text: TextSpan(
              text: 'City',
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
              children: <TextSpan>[
                TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.062,
            child: innertextfield(cityController,false,_autovalidation,TextInputType.text,"Site City",
                    (value) {
                  if (value.isEmpty) {
                    return 'Please enter City';
                  }
                  return null;
                },context),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height*0.022,
          ),
          Text("Address 2",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
            child: innerLongtextfield(5,address2Controller,_autovalidation,TextInputType.text,"Site Address 2",
                    (value) {
                  if (value.isEmpty) {
                    return 'Please enter Site Address 2';
                  }
                  return null;
                },context),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.022,
          ),

          RichText(
            text: TextSpan(
              text: 'PostCode',
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
              children: <TextSpan>[
                TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.062,
            child: innertextfield(postcode,false,_autovalidation,TextInputType.number,"Site Post Code",
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
                child: Text("Save And Next",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.017,
                    fontWeight: FontWeight.bold),),
              ),
              decoration: BoxDecoration(
                  color: ThemeApp().purplecolor,
                  borderRadius: BorderRadius.circular(30)
              ),
            ),
            onTap: (){
              globals.tabController1.animateTo(3);
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
