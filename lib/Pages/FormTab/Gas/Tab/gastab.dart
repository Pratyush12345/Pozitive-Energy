import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;

class GasTab extends StatefulWidget {
  @override
  _GasTabState createState() => _GasTabState();
}

class _GasTabState extends State<GasTab> {
  bool _autovalidation = false;
  var mprnController = MaskedTextController(mask: '0000000000');
  TextEditingController contractStartDateController = TextEditingController();
  TextEditingController standingCharge = TextEditingController();
  TextEditingController unitCharge = TextEditingController();
  TextEditingController aq = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  Future _selectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "Contract Start Date") {
        setState(() {
          contractStartDateController.text = dateFormat.format(picked);
        });
      } else if (fromfield == "Preferred") {
//        setState(() {
//          preferreddatecontroller.text=dateFormat.format(picked);
//        });
      } else {
//        setState(() {
//          nextpreferreddateController.text=dateFormat.format(picked);
//        });
      }
    }
  }

  int contractEndDateSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03, right: MediaQuery.of(context).size.width * 0.03),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            AppTextField(
              mandatory: true,
              title: AppString.mPRN,
              controller: mprnController,
              autoValidation: _autovalidation,
              hintText: AppString.mPRN,
              validator: (value)=>AppConstant.stringValidator(value, AppString.mPRN),
              textInputType: TextInputType.number,
              textInputFormatter: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],

            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'Contract Start Date',
                style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
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
                child: datetextfield(contractStartDateController, false, _autovalidation, TextInputType.text, "Select date", (value) {
                  if (value.isEmpty) {
                    return 'Please Select date';
                  }
                  return null;
                }, context),
              ),
              onTap: () {
                _selectDate(context, "Contract Start Date");
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'Contract End Date',
                style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
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
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
//            SizedBox(
//              width: MediaQuery.of(context).size.width*.02,
//            ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .062,
                    child: Row(
                      children: <Widget>[
                        contractEndDateSelected == 1
                            ? Icon(
                                Icons.radio_button_checked,
                                color: Color.fromRGBO(155, 119, 217, 1),
                                size: MediaQuery.of(context).size.height * .023,
                              )
                            : InkWell(
                                child: Icon(
                                  Icons.radio_button_unchecked,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size: MediaQuery.of(context).size.height * .023,
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
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
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
//            SizedBox(
//              width: MediaQuery.of(context).size.width*.02,
//            ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .062,
                    child: Row(
                      children: <Widget>[
                        contractEndDateSelected == 2
                            ? Icon(Icons.radio_button_checked, size: MediaQuery.of(context).size.height * .023, color: Color.fromRGBO(155, 119, 217, 1))
                            : InkWell(
                                child: Icon(Icons.radio_button_unchecked, size: MediaQuery.of(context).size.height * .023, color: Color.fromRGBO(155, 119, 217, 1)),
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
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
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
//            SizedBox(
//              width: MediaQuery.of(context).size.width*.02,
//            ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .062,
                    child: Row(
                      children: <Widget>[
                        contractEndDateSelected == 3
                            ? Icon(
                                Icons.radio_button_checked,
                                size: MediaQuery.of(context).size.height * .023,
                                color: Color.fromRGBO(155, 119, 217, 1),
                              )
                            : InkWell(
                                child: Icon(
                                  Icons.radio_button_unchecked,
                                  size: MediaQuery.of(context).size.height * .023,
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
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
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
//            SizedBox(
//              width: MediaQuery.of(context).size.width*.02,
//            ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .062,
                    child: Row(
                      children: <Widget>[
                        contractEndDateSelected == 4
                            ? Icon(
                                Icons.radio_button_checked,
                                size: MediaQuery.of(context).size.height * .023,
                                color: Color.fromRGBO(155, 119, 217, 1),
                              )
                            : InkWell(
                                child: Icon(
                                  Icons.radio_button_unchecked,
                                  size: MediaQuery.of(context).size.height * .023,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                ),
                                onTap: () {
                                  _selectDate(context, 'fromfield');
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
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    _selectDate(context, 'fromfield');
                    setState(() {
                      contractEndDateSelected = 4;
                    });
                  },
                ),
              ]),
              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: ThemeApp().textfieldbordercolor, width: 2), borderRadius: BorderRadius.circular(3)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .022,
            ),
            RichText(
              text: TextSpan(
                text: 'Standing Charge',
                style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(standingCharge, false, _autovalidation, TextInputType.number, "Standing Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter Standing Charge';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .022,
            ),
            Text(
              "Unit Charge",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(unitCharge, false, _autovalidation, TextInputType.number, "Unit Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter Unit Charge';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .022,
            ),
            Text(
              "AQ",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(aq, false, _autovalidation, TextInputType.number, "AQ Charge", (value) {
                if (value.isEmpty) {
                  return 'Please enter AQ Charge';
                }
                return null;
              }, context),
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
                    style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height * 0.017, fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(color: Color.fromRGBO(155, 119, 217, 1), borderRadius: BorderRadius.circular(30)),
              ),
              onTap: (){
                globals.tabController.animateTo(1);
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
