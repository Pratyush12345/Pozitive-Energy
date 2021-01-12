import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/askForQuoteModel.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/theme.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:provider/provider.dart';

class Electricity extends StatefulWidget {
  @override
  _ElectricityState createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> {
  TextEditingController mpancodecontroller = TextEditingController();
  TextEditingController businessnamecontroller1 = TextEditingController();
  TextEditingController businessnamecontroller2 = TextEditingController();
  TextEditingController businessnamecontroller3 = TextEditingController();
  TextEditingController businessnamecontroller4 = TextEditingController();
  TextEditingController businessnamecontroller5 = TextEditingController();
  TextEditingController businessnamecontroller6 = TextEditingController();
  TextEditingController dayEAC = TextEditingController();
  TextEditingController nightEAC = TextEditingController();
  TextEditingController eweEAC = TextEditingController();
  bool _autovalidation = false;
  ThemeApp themeApp = ThemeApp();

  File _pdffile;
  String path;
  String _path;

  List mpancodelist = ["00", "11", "22"];

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
  void initState() {
    AskForQuoteModel askForQuoteModel =
        Provider.of<AskForQuoteModel>(context, listen: false);
    if (askForQuoteModel.fullMPAN.length == 21) {
      mpancodecontroller.text = askForQuoteModel.fullMPAN.substring(0, 2);
      businessnamecontroller1.text = askForQuoteModel.fullMPAN.substring(2, 5);
      businessnamecontroller2.text = askForQuoteModel.fullMPAN.substring(5, 8);
      businessnamecontroller3.text = askForQuoteModel.fullMPAN.substring(8, 10);
      businessnamecontroller4.text =
          askForQuoteModel.fullMPAN.substring(10, 14);
      businessnamecontroller5.text =
          askForQuoteModel.fullMPAN.substring(14, 18);
      businessnamecontroller6.text =
          askForQuoteModel.fullMPAN.substring(18, 21);
    }
    dayEAC.text = askForQuoteModel.eACDay;
    nightEAC.text = askForQuoteModel.eACNight;
    eweEAC.text = askForQuoteModel.eACEWE;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "MPAN",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
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
                      child: withoutboderdropdowntextfield(
                          mpancodecontroller,
                          false,
                          _autovalidation,
                          TextInputType.text,
                          "", (value) {
                        if (value.isEmpty) {
                          return 'Please Select Partner';
                        }
                        return null;
                      }, context),
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Color.fromRGBO(128, 189, 40, 1)))),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    Text(
                                      "Select MPAN",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
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
                    child: withoutborderinnertextfield(
                        businessnamecontroller1,
                        false,
                        _autovalidation,
                        TextInputType.number,
                        "", (value) {
                      if (value.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    }, context),
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: Color.fromRGBO(128, 189, 40, 1)))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .32,
                    child: withoutborderinnertextfield(
                        businessnamecontroller2,
                        false,
                        _autovalidation,
                        TextInputType.number,
                        "", (value) {
                      if (value.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    }, context),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: themeApp.textfieldbordercolor, width: 2),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5))),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .23,
                    child: withoutborderinnertextfield(
                        businessnamecontroller3,
                        false,
                        _autovalidation,
                        TextInputType.number,
                        "", (value) {
                      if (value.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    }, context),
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: themeApp.textfieldbordercolor,
                                width: 2))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .23,
                    child: withoutborderinnertextfield(
                        businessnamecontroller4,
                        false,
                        _autovalidation,
                        TextInputType.number,
                        "", (value) {
                      if (value.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    }, context),
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: themeApp.textfieldbordercolor,
                                width: 2))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .23,
                    child: withoutborderinnertextfield(
                        businessnamecontroller5,
                        false,
                        _autovalidation,
                        TextInputType.number,
                        "", (value) {
                      if (value.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    }, context),
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: Color.fromRGBO(128, 189, 40, 1)))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .23,
                    child: withoutborderinnertextfield(
                        businessnamecontroller6,
                        false,
                        _autovalidation,
                        TextInputType.number,
                        "", (value) {
                      if (value.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    }, context),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: themeApp.textfieldbordercolor, width: 2),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "EAC (KwH)",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: themeApp.purplecolor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Day",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                        height: MediaQuery.of(context).size.height * .062,
                        child: innertextfield(dayEAC, false, _autovalidation,
                            TextInputType.number, "", (value) {
                          if (value.isEmpty) {
                            return 'Please enter Postcode';
                          }
                          return null;
                        }, context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Night",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                        height: MediaQuery.of(context).size.height * .062,
                        child: innertextfield(nightEAC, false, _autovalidation,
                            TextInputType.number, "", (value) {
                          if (value.isEmpty) {
                            return 'Please enter Postcode';
                          }
                          return null;
                        }, context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "EWE",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                        height: MediaQuery.of(context).size.height * .062,
                        child: innertextfield(eweEAC, true, _autovalidation,
                            TextInputType.number, "", (value) {
                          if (value.isEmpty) {
                            return 'Please enter Postcode';
                          }
                          return null;
                        }, context),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Upload HH File",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
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
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .017,
                              color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: themeApp.purplecolor),
                    ),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      FilePickerResult result =
                          await FilePicker.platform.pickFiles(
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
                      ? Text(_path.substring(_path.lastIndexOf("/") + 1),
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .017,
                              color: Color.fromRGBO(0, 0, 0, .5)))
                      : Text(
                          "No File Chosen",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .017,
                              color: Color.fromRGBO(0, 0, 0, .5)),
                        ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: themeApp.textfieldbordercolor, width: 2),
                  borderRadius: BorderRadius.circular(3)),
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
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.019,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(155, 119, 217, 1),
                    borderRadius: BorderRadius.circular(30)),
              ),
              onTap: () {
                globals.tabController4.animateTo(2);
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
