import 'package:flutter/material.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:intl/intl.dart';
import 'dart:ui';
import 'package:signature/signature.dart';
import 'package:pozitive/Util/global.dart' as globals;

class DirectDebitAgreement extends StatefulWidget {
  @override
  _DirectDebitAgreementState createState() => _DirectDebitAgreementState();
}

class _DirectDebitAgreementState extends State<DirectDebitAgreement> {
  bool _autovalidation = false;
  ThemeApp themeApp = ThemeApp();
  TextEditingController refNo = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController businessName = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController ownerName = TextEditingController();
  TextEditingController to = TextEditingController();
  TextEditingController bankBuildingAddressPostcode = TextEditingController();
  TextEditingController signature = TextEditingController();
  TextEditingController name1 = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController requirebydatecontroller = TextEditingController();
  TextEditingController preferreddatecontroller = TextEditingController();

  final SignatureController _controller =
      SignatureController(penStrokeWidth: 2, penColor: Colors.black);

  int ddofmonth = 0;

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
          requirebydatecontroller.text = dateFormat.format(picked);
        });
      } else {
        setState(() {
          preferreddatecontroller.text = dateFormat.format(picked);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print("Value changed"));
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
              height: MediaQuery.of(context).size.height * 0.018,
            ),
            Text(
              "Direct Debit Agreement Instruction to your Bank or Building Society to pay by Direct Debit",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .02,
                  color: Colors.redAccent),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Please pay Pozitive Energy Limited Direct Debits from the account detailed on this instruction, subject to the safeguards assured by the Direct Debit Guarantee."
              " I understand that this instuction my remain with Pozitive Energy Limited and, if so, details will be passed", //electronically to my Bank or Building Society
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .02,
                  color: Colors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Pozitive Energy Business customer reference number",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(refNo, false, _autovalidation,
                  TextInputType.number, "reference number", (value) {
                if (value.isEmpty) {
                  return 'Please enter reference number"';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Name/s of account holder(s)",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(name, false, _autovalidation,
                  TextInputType.text, "Name Account holder", (value) {
                if (value.isEmpty) {
                  return 'Please enter Name Account holder';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Business Name",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(businessName, false, _autovalidation,
                  TextInputType.text, "Business Name", (value) {
                if (value.isEmpty) {
                  return 'Please enter Business Name';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Branch Code",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            PinCodeTextField(
              appContext: context,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
//              shape: PinCodeFieldShape.box,
              animationDuration: Duration(milliseconds: 300),
//              borderRadius: BorderRadius.circular(3),
//              fieldHeight: MediaQuery.of(context).size.height * 0.062,
//              fieldWidth: MediaQuery.of(context).size.height * 0.062,
//              disabledColor: themeApp.innertextfieldbordercolor,
//              activeColor: themeApp.innertextfieldbordercolor,
//              inactiveColor: themeApp.innertextfieldbordercolor,
//              selectedColor: themeApp.innertextfieldbordercolor,
              onChanged: (value) {
//                setState(() {
//                  currentText = value;
//                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Account Number",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(accountNumber, false, _autovalidation,
                  TextInputType.number, "Account Number", (value) {
                if (value.isEmpty) {
                  return 'Please enter Account Number';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Owner Name",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(ownerName, false, _autovalidation,
                  TextInputType.text, "Owner Name", (value) {
                if (value.isEmpty) {
                  return 'Please enter Owner Name';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "To",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(
                  to, false, _autovalidation, TextInputType.text, "Owner Name",
                  (value) {
                if (value.isEmpty) {
                  return 'Please enter Owner Name';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "DD Date Every Month",
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
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Row(
                        children: <Widget>[
                          ddofmonth == 1
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
                                      ddofmonth = 1;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "7th",
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
                        ddofmonth = 1;
                      });
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Row(
                        children: <Widget>[
                          ddofmonth == 2
                              ? Icon(Icons.check_box,
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                  color: Color.fromRGBO(155, 119, 217, 1))
                              : InkWell(
                                  child: Icon(Icons.check_box_outline_blank,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1)),
                                  onTap: () {
                                    setState(() {
                                      ddofmonth = 2;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "14th",
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
                        ddofmonth = 2;
                      });
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Row(
                        children: <Widget>[
                          ddofmonth == 3
                              ? Icon(
                                  Icons.check_box,
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.check_box_outline_blank,
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      ddofmonth = 3;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "21th",
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
                        ddofmonth = 3;
                      });
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Row(
                        children: <Widget>[
                          ddofmonth == 4
                              ? Icon(
                                  Icons.check_box,
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.check_box_outline_blank,
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      ddofmonth = 4;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "28th",
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
                        ddofmonth = 4;
                      });
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
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
            Text(
              "Bank or Building  Society address & Post Code",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(
                  bankBuildingAddressPostcode,
                  false,
                  _autovalidation,
                  TextInputType.text,
                  "Bank or Building  Society address & Post Code", (value) {
                if (value.isEmpty) {
                  return 'Please enter Address';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Signature",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                //SIGNATURE CANVAS
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2.0, color: Color.fromRGBO(128, 189, 40, 1)),
                  ),
                  child: SizedBox(
                      height: 300,
                      child: Signature(
                          controller: _controller,
                          height: 300,
                          backgroundColor: Colors.white)),
                ),
                //OK AND CLEAR BUTTONS
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(18, 122, 69, 1),
                    border: Border.all(
                        width: 1.0, color: Color.fromRGBO(18, 122, 69, 1)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      //SHOW EXPORTED IMAGE IN NEW ROUTE
                      IconButton(
                        icon: const Icon(Icons.check),
                        color: Colors.white,
                        onPressed: () async {
                          if (_controller.isNotEmpty) {
                            var data = await _controller.toPngBytes();
//                            Navigator.of(context).push(
//                              MaterialPageRoute(
//                                builder: (BuildContext context) {
//                                  return Scaffold(
//                                    appBar: AppBar(),
//                                    body: Center(child: Container(color: Colors.grey[300], child: Image.memory(data))),
//                                  );
//                                },
//                              ),
//                            );
                          }
                        },
                      ),
                      //CLEAR CANVAS
                      IconButton(
                        icon: const Icon(Icons.clear),
                        color: Colors.white,
                        onPressed: () {
                          setState(() => _controller.clear());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Name",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(
                  name1, false, _autovalidation, TextInputType.text, "Name",
                  (value) {
                if (value.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Date",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .062,
                child: datetextfield(
                    requirebydatecontroller,
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
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Company Name",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(companyName, false, _autovalidation,
                  TextInputType.text, "Company Name", (value) {
                if (value.isEmpty) {
                  return 'Please enter Company Name';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Instruction to our bank or building Society to by Direct Debit",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .02,
                  color: Colors.redAccent),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "This Gurantee is offered by all Banks and Buiding Societies that accept instructions to pay Direct Debits. If there are any changes to"
              "the amount, date or frequency of your Direct Debit, Pozitive Energy Limited will notify you seven working days in advance of your account"
              " being debited or as otherwise agreed. If you request Pozitive  Energy Limited to collect a payment, confirmation of the amount and date will be "
              "given to you at the time of the request. If an error is made in the payment of your Direct Debit by Pozitive Energy Limited or your bank or Building Society"
              ", you are entitled to a full and immediate refund of the amount paid from your bank or Building Society. If you receive a refund you "
              "are not entitled to, you must pay it back when Pozitive Energy Limited asks you to. You can cancel a Direct Debit at any time by simply"
              " contacting your Bank or Building Society. Written confirmation may be required. Please also notify us.",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .02,
                  color: Colors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.062,
              child: Center(
                child: Text(
                  "Save And Generate Contract",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.017,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(155, 119, 217, 1),
                  borderRadius: BorderRadius.circular(30)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.062,
              child: Center(
                child: Text(
                  "Back To Quote",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.017,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
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
