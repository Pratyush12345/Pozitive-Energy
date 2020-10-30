import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;


class Gas extends StatefulWidget {
  @override
  _GasState createState() => _GasState();
}

class _GasState extends State<Gas> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ThemeApp themeApp=ThemeApp();

  TextEditingController mprn=TextEditingController();
  TextEditingController eac=TextEditingController();
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

            AppTextField(
              title: AppString.mPRN,
              controller: mprn,
              autoValidation: _autovalidation,
              textInputType: TextInputType.number,
              hintText: AppString.gasMprn,
              textInputFormatter: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
              validator: (value)=>AppConstant.stringValidator(value, AppString.gasMprn),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            AppTextField(
              title: AppString.aQ,
              controller: eac,
              autoValidation: _autovalidation,
              textInputType: TextInputType.number,
              hintText: AppString.aQ,
              textInputFormatter: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
              validator: (value)=>AppConstant.stringValidator(value, AppString.aQ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.062,
              child: Center(
                child: Text("ASK FOR QUOTE",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
                    fontWeight: FontWeight.bold),),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(155, 119, 217, 1),
                  borderRadius: BorderRadius.circular(30)
              ),
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