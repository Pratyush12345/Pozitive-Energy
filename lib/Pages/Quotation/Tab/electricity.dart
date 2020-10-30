import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextFieldWithOutborder.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:pozitive/Util/global.dart' as globals;

class Electricity extends StatefulWidget {
  @override
  _ElectricityState createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ThemeApp themeApp = ThemeApp();
  TextEditingController mpancodecontroller = TextEditingController();
  TextEditingController businessnamecontroller1 = TextEditingController();
  TextEditingController businessnamecontroller2 = TextEditingController();
  TextEditingController businessnamecontroller3 = TextEditingController();
  TextEditingController businessnamecontroller4 = TextEditingController();
  TextEditingController businessnamecontroller5 = TextEditingController();
  TextEditingController businessnamecontroller6 = TextEditingController();
  TextEditingController day = TextEditingController();
  TextEditingController night = TextEditingController();
  TextEditingController ewe = TextEditingController();
  bool _autovalidation = false;

  File _pdffile;
  String path;
  String _path;

  List mpancodelist = ["00", "01", "02","03","04","05","06","07","08"];

  Widget mpancodeview() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: mpancodelist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                mpancodelist[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  mpancodecontroller.text = mpancodelist[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03, right: MediaQuery.of(context).size.width * 0.03),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.018,
            ),
            Text(
              "MPAN",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .3,
                      child: withoutboderdropdowntextfield(mpancodecontroller, false, _autovalidation, TextInputType.text, "", (value) {
                        if (value.isEmpty) {
                          return 'Please Select Partner';
                        }
                        return null;
                      }, context),
                      decoration: BoxDecoration(border: Border(right: BorderSide(color: Color.fromRGBO(128, 189, 40, 1)))),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      showDialog(
                          context: context,
                          child: Dialog(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.03,
                                ),
                                Text(
                                  "Select MPAN",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.03),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 1,
                                  color: Colors.grey.withOpacity(.2),
                                ),
                                Container(
                                  child: mpancodeview(),
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .3,
                    child:  AppTextFieldWithOutBorder(
                      controller: businessnamecontroller1,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      textInputFormatter: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                      validator: (value)=>AppConstant.stringValidator(value, ''),
                    ),
                    decoration: BoxDecoration(border: Border(right: BorderSide(color: Color.fromRGBO(128, 189, 40, 1)))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .32,
                    child:  AppTextFieldWithOutBorder(
                      controller: businessnamecontroller2,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      textInputFormatter: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                      validator: (value)=>AppConstant.stringValidator(value, ''),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: themeApp.textfieldbordercolor, width: 2), borderRadius: BorderRadius.only(topRight: Radius.circular(5), topLeft: Radius.circular(5))),
            ),


            Container(
              height: MediaQuery.of(context).size.height * .062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .23,
                    child: AppTextFieldWithOutBorder(
                      controller: businessnamecontroller3,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      textInputFormatter: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                      validator: (value)=>AppConstant.stringValidator(value, ''),
                    ),
                    decoration: BoxDecoration(border: Border(right: BorderSide(color: themeApp.textfieldbordercolor, width: 2))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .23,
                    child: AppTextFieldWithOutBorder(
                      controller: businessnamecontroller4,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      textInputFormatter: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                      validator: (value)=>AppConstant.stringValidator(value, ''),
                    ),
                    decoration: BoxDecoration(border: Border(right: BorderSide(color: themeApp.textfieldbordercolor, width: 2))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .23,
                    child:  AppTextFieldWithOutBorder(
                      controller: businessnamecontroller5,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      textInputFormatter: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                      validator: (value)=>AppConstant.stringValidator(value, ''),
                    ),
                    decoration: BoxDecoration(border: Border(right: BorderSide(color: Color.fromRGBO(128, 189, 40, 1)))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .23,
                    child:  AppTextFieldWithOutBorder(
                      controller: businessnamecontroller6,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      textInputFormatter: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                      validator: (value)=>AppConstant.stringValidator(value, ''),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: themeApp.textfieldbordercolor, width: 2), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "EAC (KwH)",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),

            Container(
              height: MediaQuery.of(context).size.height * .062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .3,
                    child:  AppTextFieldWithOutBorder(
                      controller: day,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      hintText: AppString.day,
                      textInputFormatter: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                      validator: (value)=>AppConstant.stringValidator(value, AppString.day),
                    ),
                    decoration: BoxDecoration(border: Border(right: BorderSide(color: Color.fromRGBO(128, 189, 40, 1)))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .3,
                    child: AppTextFieldWithOutBorder(
                      controller: night,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      textInputFormatter: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                      hintText: AppString.night,
                      validator: (value)=>AppConstant.stringValidator(value, AppString.night),
                    ),
                    decoration: BoxDecoration(border: Border(right: BorderSide(color: Color.fromRGBO(128, 189, 40, 1)))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .32,
                    child: AppTextFieldWithOutBorder(
                      controller: ewe,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      textInputFormatter: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                      hintText: AppString.eWE,
                      validator: (value)=>AppConstant.stringValidator(value, AppString.eWE),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: themeApp.textfieldbordercolor, width: 2), borderRadius: BorderRadius.circular(5)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Upload HH File",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .043,
                      width: MediaQuery.of(context).size.width * .24,
                      child: Center(
                        child: Text(
                          "Choose File",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height * .017, color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: themeApp.purplecolor),
                    ),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      FilePickerResult result = await FilePicker.platform.pickFiles(
                        type: FileType.any,
                      );
                      path = result.files.first.path;
                      setState(() {
                        _path = path;
                      });
                      _pdffile = File(path);
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  _path != null
                      ? Text(_path.substring(_path.lastIndexOf("/") + 1), style: TextStyle(fontSize: MediaQuery.of(context).size.height * .017, color: Color.fromRGBO(0, 0, 0, .5)))
                      : Text(
                          "No File Chosen",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height * .017, color: Color.fromRGBO(0, 0, 0, .5)),
                        ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: themeApp.textfieldbordercolor, width: 2), borderRadius: BorderRadius.circular(3)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.062,
              child: Center(
                child: Text(
                  "DOWNLOAD SAMPLE HH FILE",
                  style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height * 0.019, fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(color: Color.fromRGBO(155, 119, 217, 1), borderRadius: BorderRadius.circular(30)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.062,
                child: Center(
                  child: Text(
                    "Save And Next",
                    style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height * 0.019, fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(color: Color.fromRGBO(155, 119, 217, 1), borderRadius: BorderRadius.circular(30)),
              ),
              onTap: (){
                globals.tabController3.animateTo(2);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.028,
            ),
          ],
        ),
      ),
    );
  }
}
