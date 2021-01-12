import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/askForQuoteModel.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:provider/provider.dart';

class BusinessDetail extends StatefulWidget {
  @override
  _BusinessDetailState createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {
  TextEditingController businessnamecontroller = TextEditingController();
  TextEditingController postCode = TextEditingController();
  TextEditingController requirebydatecontroller = TextEditingController();
  TextEditingController preferreddatecontroller = TextEditingController();
  TextEditingController nextpreferreddateController = TextEditingController();

  //focusnode controller
  final businessnamecontrollernode = FocusNode();
  final postcodenode = FocusNode();

  bool _initial = true;
  bool _autovalidation = false;
  int termselected = 0;
  int tpm = 0, green = 0;
  bool singlerate = false;
  ThemeApp themeApp = ThemeApp();

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
      } else if (fromfield == "Preferred") {
        setState(() {
          preferreddatecontroller.text = dateFormat.format(picked);
        });
      } else {
        setState(() {
          nextpreferreddateController.text = dateFormat.format(picked);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_initial) {
      AskForQuoteModel askForQuoteModel =
          Provider.of<AskForQuoteModel>(context, listen: false);
      businessnamecontroller.text = askForQuoteModel.businessName;
      postCode.text = askForQuoteModel.postCode;
      requirebydatecontroller.text = askForQuoteModel.requiredByDate;
      preferreddatecontroller.text = askForQuoteModel.preferredStartDate;
      termselected = [
            askForQuoteModel.isforFirstyear,
            askForQuoteModel.isforSecondyear,
            askForQuoteModel.isforThirdyear,
            askForQuoteModel.isforFourthyear,
            askForQuoteModel.isforFifthyear
          ].lastIndexOf("true") +
          1;
    }
    _initial = false;
    super.didChangeDependencies();
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
              child: innertextfield(businessnamecontroller, false,
                  _autovalidation, TextInputType.text, "Name", (value) {
                if (value.isEmpty) {
                  return 'Please enter Name';
                }
                return null;
              }, context, businessnamecontrollernode, postcodenode),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

            //////////controller          ///////////

            Text(
              "PostCode",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(postCode, false, _autovalidation,
                  TextInputType.number, "Postcode", (value) {
                if (value.isEmpty) {
                  return 'Please enter Postcode';
                }
                return null;
              }, context, postcodenode),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

            Text(
              "Terms",
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Row(
                        children: <Widget>[
                          termselected == 1
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
                                      termselected = 1;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "1 Year",
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
                        termselected = 1;
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
                          termselected == 2
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
                                      termselected = 2;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "2 Year",
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
                        termselected = 2;
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
                          termselected == 3
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
                                      termselected = 3;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "3 Year",
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
                        termselected = 3;
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
                          termselected == 4
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
                                      termselected = 4;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "Other",
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
                        termselected = 4;
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
                          termselected == 5
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
                                      termselected = 5;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "All",
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
                        termselected = 5;
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
              height: MediaQuery.of(context).size.height * 0.022,
            ),

            Text(
              "Required by Date",
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
              height: MediaQuery.of(context).size.height * 0.022,
            ),

            Text(
              "Preferred Start Date",
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
                    preferreddatecontroller,
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
                _selectDate(context, "Preferred");
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

            Text(
              "Next Preferred Start Date",
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
                    preferreddatecontroller,
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
                _selectDate(context, "Next Preferred");
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .062,
                    width: MediaQuery.of(context).size.width * .45,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        tpm == 1
                            ? Icon(
                                Icons.check_box,
                                color: Color.fromRGBO(155, 119, 217, 1),
                                size: MediaQuery.of(context).size.height * .023,
                              )
                            : InkWell(
                                child: Icon(
                                  Icons.check_box_outline_blank,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                ),
                                onTap: () {
                                  setState(() {
                                    tpm = 1;
                                  });
                                },
                              ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        Text(
                          "Third party MOP?",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .02,
                              color: Color.fromRGBO(0, 0, 0, .8)),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: themeApp.textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  onTap: () {
                    setState(() {
                      tpm = 1;
                    });
                  },
                ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .062,
                    width: MediaQuery.of(context).size.width * .45,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        tpm == 2
                            ? Icon(
                                Icons.check_box,
                                color: Color.fromRGBO(155, 119, 217, 1),
                                size: MediaQuery.of(context).size.height * .023,
                              )
                            : InkWell(
                                child: Icon(
                                  Icons.check_box_outline_blank,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                ),
                                onTap: () {
                                  setState(() {
                                    tpm = 2;
                                  });
                                },
                              ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        Text(
                          "Third Party DA/DC?",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .02,
                              color: Color.fromRGBO(0, 0, 0, .8)),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: themeApp.textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  onTap: () {
                    setState(() {
                      tpm = 2;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .062,
                    width: MediaQuery.of(context).size.width * .45,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        green == 1
                            ? Icon(
                                Icons.check_box,
                                color: Color.fromRGBO(155, 119, 217, 1),
                                size: MediaQuery.of(context).size.height * .023,
                              )
                            : InkWell(
                                child: Icon(
                                  Icons.check_box_outline_blank,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                ),
                                onTap: () {
                                  setState(() {
                                    green = 1;
                                  });
                                },
                              ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        Text(
                          "Green",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .02,
                              color: Color.fromRGBO(0, 0, 0, .8)),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: themeApp.textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  onTap: () {
                    setState(() {
                      green = 1;
                    });
                  },
                ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .062,
                    width: MediaQuery.of(context).size.width * .45,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        green == 2
                            ? Icon(
                                Icons.check_box,
                                color: Color.fromRGBO(155, 119, 217, 1),
                                size: MediaQuery.of(context).size.height * .023,
                              )
                            : InkWell(
                                child: Icon(
                                  Icons.check_box_outline_blank,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                ),
                                onTap: () {
                                  setState(() {
                                    green = 2;
                                  });
                                },
                              ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        Text(
                          "Non Green",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .02,
                              color: Color.fromRGBO(0, 0, 0, .8)),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: themeApp.textfieldbordercolor, width: 2),
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  onTap: () {
                    setState(() {
                      green = 2;
                    });
                  },
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height * .062,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .02,
                    ),
                    singlerate
                        ? Icon(
                            Icons.check_box,
                            color: Color.fromRGBO(155, 119, 217, 1),
                            size: MediaQuery.of(context).size.height * .023,
                          )
                        : InkWell(
                            child: Icon(
                              Icons.check_box_outline_blank,
                              color: Color.fromRGBO(155, 119, 217, 1),
                              size: MediaQuery.of(context).size.height * .023,
                            ),
                            onTap: () {
                              setState(() {
                                singlerate = true;
                              });
                            },
                          ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .02,
                    ),
                    Text(
                      "Single Rate?",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .02,
                          color: Color.fromRGBO(0, 0, 0, .8)),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: themeApp.textfieldbordercolor, width: 2),
                    borderRadius: BorderRadius.circular(3)),
              ),
              onTap: () {
                setState(() {
                  singlerate = !singlerate;
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .38,
                  height: MediaQuery.of(context).size.height * 0.062,
                  child: Center(
                    child: Text(
                      "NOTES",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(155, 119, 217, 1),
                      borderRadius: BorderRadius.circular(30)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .52,
                  height: MediaQuery.of(context).size.height * 0.062,
                  child: Center(
                    child: Text(
                      "SUPPLY POINT DETAILS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(155, 119, 217, 1),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ],
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
                globals.tabController4.animateTo(1);
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
