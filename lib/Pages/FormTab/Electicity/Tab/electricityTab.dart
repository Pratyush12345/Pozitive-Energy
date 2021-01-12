import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextFieldWithOutborder.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Util/global.dart' as globals;

import 'package:pozitive/Core/Model/Api/AddProspectModel.dart';
import 'package:provider/provider.dart';

class Electicity extends StatefulWidget {
  @override
  _ElecticityState createState() => _ElecticityState();
}

class _ElecticityState extends State<Electicity> {
  bool _autovalidation = false;
  TextEditingController standingCharge = TextEditingController();
  TextEditingController dayUnitCharge = TextEditingController();
  TextEditingController nightUnitCharge = TextEditingController();
  TextEditingController eweUnitCharge = TextEditingController();
  TextEditingController capacityCharge = TextEditingController();
  TextEditingController excessCapacityCharge = TextEditingController();
  TextEditingController emrCharge = TextEditingController();
  TextEditingController energizationStatus = TextEditingController();
  TextEditingController dayEAC = TextEditingController();
  TextEditingController nightEAC = TextEditingController();
  TextEditingController eweEAC = TextEditingController();
  TextEditingController siteCapacity = TextEditingController();
  TextEditingController reactiveCharge = TextEditingController();
  TextEditingController fitCharge = TextEditingController();
  TextEditingController newConnection = TextEditingController();
  TextEditingController businessnamecontroller1 = TextEditingController();
  TextEditingController businessnamecontroller2 = TextEditingController();
  TextEditingController businessnamecontroller3 = TextEditingController();
  TextEditingController businessnamecontroller4 = TextEditingController();
  TextEditingController businessnamecontroller5 = TextEditingController();
  TextEditingController businessnamecontroller6 = TextEditingController();
  TextEditingController mpancodecontroller = TextEditingController();
  TextEditingController contractstartdatecontroller = TextEditingController();
  TextEditingController energizationcontroller = TextEditingController();

  ThemeApp themeApp = ThemeApp();

  int newConnectionSelected = 0;
  int energizationSelected = 0;
  bool rhtMeter = false;
  bool mopContract = false;
  bool da_dc_contract = false;
  int contractEndDateSelected = 0;

  List newConnectionlist = ["Connection 1", "Connection 2", "Connection 3"];
  Widget NotificationView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: newConnectionlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                newConnectionlist[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  newConnection.text = newConnectionlist[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  List energizationlist = [
    "Energization 1",
    "Energization 2",
    "Energization 3"
  ];
  Widget EnergizationView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: energizationlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                energizationlist[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  energizationcontroller.text = energizationlist[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

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

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  Future _selectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "Required") {
        setState(() {
          contractstartdatecontroller.text = dateFormat.format(picked);
        });
      } else {
        setState(() {
          contractstartdatecontroller.text = dateFormat.format(picked);
        });
      }
    }
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

//Full MPAN Textfield
            RichText(
              text: TextSpan(
                text: 'Full Mpan',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
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
                    child: AppTextFieldWithOutBorder(
                      controller: businessnamecontroller1,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      validator: (value) =>
                          AppConstant.stringValidator(value, 'value'),
                      textInputFormatter: [
                        new FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: Color.fromRGBO(128, 189, 40, 1)))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .32,
                    child: AppTextFieldWithOutBorder(
                      controller: businessnamecontroller2,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      validator: (value) =>
                          AppConstant.stringValidator(value, 'value'),
                      textInputFormatter: [
                        new FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      ],
                    ),
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
                    child: AppTextFieldWithOutBorder(
                      controller: businessnamecontroller3,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      validator: (value) =>
                          AppConstant.stringValidator(value, 'value'),
                      textInputFormatter: [
                        new FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: themeApp.textfieldbordercolor,
                                width: 2))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .23,
                    child: AppTextFieldWithOutBorder(
                      controller: businessnamecontroller4,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      validator: (value) =>
                          AppConstant.stringValidator(value, 'value'),
                      textInputFormatter: [
                        new FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: themeApp.textfieldbordercolor,
                                width: 2))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .23,
                    child: AppTextFieldWithOutBorder(
                      controller: businessnamecontroller5,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      validator: (value) =>
                          AppConstant.stringValidator(value, 'value'),
                      textInputFormatter: [
                        new FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: Color.fromRGBO(128, 189, 40, 1)))),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .23,
                    child: AppTextFieldWithOutBorder(
                      controller: businessnamecontroller6,
                      autoValidation: _autovalidation,
                      textInputType: TextInputType.number,
                      validator: (value) =>
                          AppConstant.stringValidator(value, 'value'),
                      textInputFormatter: [
                        new FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      ],
                    ),
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
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//Contract Start Date
            RichText(
              text: TextSpan(
                text: 'Contract Start Date',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .062,
                child: datetextfield(
                    contractstartdatecontroller,
                    false,
                    _autovalidation,
                    TextInputType.text,
                    "Select date", (value) {
                  if (value.isEmpty) {
                    return 'Please Select date';
                  }
                  return null;
                }, context),
              ),
              onTap: () {
                _selectDate(context, "Required");
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//Contract End Date
            RichText(
              text: TextSpan(
                text: 'Contract End Date',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .062,
                        child: Row(
                          children: <Widget>[
                            contractEndDateSelected == 1
                                ? Icon(
                                    Icons.radio_button_checked,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                  )
                                : InkWell(
                                    child: Icon(
                                      Icons.radio_button_unchecked,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        contractEndDateSelected = 1;
                                      });
                                    },
                                  ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .0015,
                            ),
                            Text(
                              "12 Month",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .02,
                                  color: Color.fromRGBO(0, 0, 0, .8)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          contractEndDateSelected = 1;
                        });
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .062,
                        child: Row(
                          children: <Widget>[
                            contractEndDateSelected == 2
                                ? Icon(Icons.radio_button_checked,
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                    color: Color.fromRGBO(155, 119, 217, 1))
                                : InkWell(
                                    child: Icon(Icons.radio_button_unchecked,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                        color:
                                            Color.fromRGBO(155, 119, 217, 1)),
                                    onTap: () {
                                      setState(() {
                                        contractEndDateSelected = 2;
                                      });
                                    },
                                  ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .0015,
                            ),
                            Text(
                              "24 Month",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .02,
                                  color: Color.fromRGBO(0, 0, 0, .8)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          contractEndDateSelected = 2;
                        });
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .062,
                        child: Row(
                          children: <Widget>[
                            contractEndDateSelected == 3
                                ? Icon(
                                    Icons.radio_button_checked,
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                  )
                                : InkWell(
                                    child: Icon(
                                      Icons.radio_button_unchecked,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        contractEndDateSelected = 3;
                                      });
                                    },
                                  ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .0015,
                            ),
                            Text(
                              "36 Month",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .02,
                                  color: Color.fromRGBO(0, 0, 0, .8)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          contractEndDateSelected = 3;
                        });
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .062,
                        child: Row(
                          children: <Widget>[
                            contractEndDateSelected == 4
                                ? Icon(
                                    Icons.radio_button_checked,
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                  )
                                : InkWell(
                                    child: Icon(
                                      Icons.radio_button_unchecked,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        contractEndDateSelected = 4;
                                      });
                                    },
                                  ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .0015,
                            ),
                            Text(
                              "Other",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .02,
                                  color: Color.fromRGBO(0, 0, 0, .8)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          contractEndDateSelected = 4;
                        });
                      },
                    ),
                  ]),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: ThemeApp().textfieldbordercolor, width: 2),
                  borderRadius: BorderRadius.circular(3)),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Standing Charge',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' \*', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                Text(
                  "(p/Day)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(standingCharge, false, _autovalidation,
                  TextInputType.number, "Standing Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter standing charge';
                }
                return null;
              }, context),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Day Unit Charge',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' \*', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                Text(
                  "(p/KWH)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(dayUnitCharge, false, _autovalidation,
                  TextInputType.number, "Day Unit Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter day unit';
                }
                return null;
              }, context),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Night Unit Charge',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' \*', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                Text(
                  "(p/KWH)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(nightUnitCharge, false, _autovalidation,
                  TextInputType.number, "Night Unit Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter night unit charge';
                }
                return null;
              }, context),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//EWE Unit Charge Textfield
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'EWE Unit Charge',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .015,
                        color: Color.fromRGBO(31, 33, 29, 1)),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' \*', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                Text(
                  "(p/KWH)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(eweUnitCharge, false, _autovalidation,
                  TextInputType.number, "EWE Unit Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter EWE unit charge';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//Capacity Charge Textfield
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Capacity Charge",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                Text(
                  "(p/KVA)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(capacityCharge, false, _autovalidation,
                  TextInputType.number, "Capacity Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter capacity charge';
                }
                return null;
              }, context),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//Excess Capacity Charge Textfield
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Excess Capacity Charge",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                Text(
                  "(p/KVA)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(
                  excessCapacityCharge,
                  false,
                  _autovalidation,
                  TextInputType.number,
                  "Excess Capacity Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter excess capacity charge';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//EMR Textfield
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "EMR Charge",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                Text(
                  "(p/KWH)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(emrCharge, false, _autovalidation,
                  TextInputType.number, "EMR Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter EMR charge';
                }
                return null;
              }, context),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//Energization Status Dropdown

            Text(
              "Energization Status",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .062,
                child: dropdowntextfield(
                    energizationcontroller,
                    false,
                    _autovalidation,
                    TextInputType.text,
                    "Select Energization Status", (value) {
                  if (value.isEmpty) {
                    return 'Please select energization status';
                  }
                  return null;
                }, context),
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
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Text(
                                "Select Energization Status",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: Colors.grey.withOpacity(.2),
                              ),
                              Container(
                                child: EnergizationView(),
                              )
                            ],
                          ),
                        ));
              },
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//Day EAC Charge Textfield
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Day EAC",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                Text(
                  "(KWH)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(dayEAC, false, _autovalidation,
                  TextInputType.number, "Day EAC Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter day EAC charge';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//Night EAC Charge Textfield
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Night EAC",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                Text(
                  "(KWH)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(nightEAC, false, _autovalidation,
                  TextInputType.number, "Night EAC Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter night EAC charge';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//EWE EAC Charge Textfield
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "EWE EAC",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                Text(
                  "(KWH)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(eweEAC, false, _autovalidation,
                  TextInputType.number, "EWE EAC Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter EWE EAC charge';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//Site Capacity Textfield
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Site Capacity",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                Text(
                  "(KVA)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(siteCapacity, false, _autovalidation,
                  TextInputType.number, "Site Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter site charge';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//Reactive Charge Textfield
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Reactive Charge",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                Text(
                  "(kVArh)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(reactiveCharge, false, _autovalidation,
                  TextInputType.number, "Reactive Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter reactive charge';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//FIT Charge Textfield
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "FIT Charge",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                Text(
                  "(p/KVA)",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .015,
                      color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(fitCharge, false, _autovalidation,
                  TextInputType.number, "FIT Charges", (value) {
                if (value.isEmpty) {
                  return 'Please enter FIT charge';
                }
                return null;
              }, context),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//New Connection Dropdown

            Text(
              "New Connection",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .062,
                child: dropdowntextfield(newConnection, false, _autovalidation,
                    TextInputType.text, "Select New Connection", (value) {
                  if (value.isEmpty) {
                    return 'Please select new connection';
                  }
                  return null;
                }, context),
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
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Text(
                                "Select New Connection",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: Colors.grey.withOpacity(.2),
                              ),
                              Container(
                                child: NotificationView(),
                              )
                            ],
                          ),
                        ));
              },
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

//RHT Meter Checkbox

            Container(
              height: MediaQuery.of(context).size.height * .062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Row(
                        children: <Widget>[
                          rhtMeter
                              ? Icon(
                                  Icons.check_box,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      rhtMeter = !rhtMeter;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "RHT Meter",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        rhtMeter = !rhtMeter;
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: ThemeApp().textfieldbordercolor, width: 2),
                  borderRadius: BorderRadius.circular(3)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
//MOP Contract Checkbox

            Container(
              height: MediaQuery.of(context).size.height * .062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Row(
                        children: <Widget>[
                          mopContract
                              ? Icon(
                                  Icons.check_box,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      mopContract = !mopContract;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "Customer Third Party MOP Contract",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        mopContract = !mopContract;
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: ThemeApp().textfieldbordercolor, width: 2),
                  borderRadius: BorderRadius.circular(3)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
//DA/DC Contract Checkbox

            Container(
              height: MediaQuery.of(context).size.height * .062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Row(
                        children: <Widget>[
                          da_dc_contract
                              ? Icon(
                                  Icons.check_box,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      da_dc_contract = !da_dc_contract;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "Customer Third Party DA/DC Contract",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        da_dc_contract = !da_dc_contract;
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: ThemeApp().textfieldbordercolor, width: 2),
                  borderRadius: BorderRadius.circular(3)),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

//Save And Next Button
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.062,
                child: Center(
                  child: Text(
                    "Save And Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.017,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                    color: ThemeApp().purplecolor,
                    borderRadius: BorderRadius.circular(30)),
              ),
              onTap: () {
                AddProspectModel electricityAddProspectModel =
                    Provider.of<AddProspectModel>(context, listen: false);
                electricityAddProspectModel.accountId =
                    Provider.of<User>(context, listen: false).accountId;
                electricityAddProspectModel.strStandingCharge =
                    standingCharge.text;
                electricityAddProspectModel.strDayUnit = dayUnitCharge.text;
                electricityAddProspectModel.strNightUnit = nightUnitCharge.text;
                electricityAddProspectModel.strEWEUnit = eweUnitCharge.text;
                electricityAddProspectModel.strCapacitycharges =
                    capacityCharge.text;
                electricityAddProspectModel.strExceesCapacityCharegs =
                    excessCapacityCharge.text;
                electricityAddProspectModel.strEMRCFD = emrCharge.text;
                electricityAddProspectModel.strEnergizationstatus =
                    energizationStatus.text;
                electricityAddProspectModel.electricityDayEAC = dayEAC.text;
                electricityAddProspectModel.electricityNightEAC = nightEAC.text;
                electricityAddProspectModel.electricityEveningEAC = eweEAC.text;

                electricityAddProspectModel.strReactiveCharges =
                    reactiveCharge.text;
                electricityAddProspectModel.strFITcharge = fitCharge.text;
                electricityAddProspectModel.strNewConnection =
                    newConnection.text;
                electricityAddProspectModel.fullMpan = mpancodecontroller.text +
                    businessnamecontroller1.text +
                    businessnamecontroller2.text +
                    businessnamecontroller3.text +
                    businessnamecontroller4.text +
                    businessnamecontroller5.text +
                    businessnamecontroller6.text;
                electricityAddProspectModel.dteElecStartDate =
                    contractstartdatecontroller.text;

                //remaining additions
                //site capacity
                globals.tabController1.animateTo(1);
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
