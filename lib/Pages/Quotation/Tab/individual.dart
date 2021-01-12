import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/Api/askForQuoteModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/Quotation/addAndViewList.dart';
import 'package:pozitive/Widget/TextField/dropdownTextField.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:provider/provider.dart';

class Individual extends StatefulWidget {
  @override
  _IndividualState createState() => _IndividualState();
}

class _IndividualState extends State<Individual> {
  TextEditingController partnercontroller = TextEditingController();
  TextEditingController businessnamecontroller = TextEditingController();
  TextEditingController postcode = TextEditingController();
  TextEditingController requirebydatecontroller = TextEditingController();
  TextEditingController preferreddatecontroller = TextEditingController();

  //FocusNode controllers

  final _businessnamecontrollernode = FocusNode();
  final _postcodenode = FocusNode();

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy/MM/dd");
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;
  int tpm = 0, green = 0;
  int termselected = 0;
  bool oneyear = false;
  bool twoyear = false;
  bool threeYear = false;
  bool other = false;
  bool all = false;

  List partner = ["Abc", "Gdgd", "Xyz"];
  Future _selectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (fromfield == "Required") {
        setState(() {
          requirebydatecontroller.text = dateFormat.format(picked) + "  00:00";
        });
      } else {
        setState(() {
          preferreddatecontroller.text = dateFormat.format(picked);
        });
      }
    }
  }

  Widget partnerview(List partners) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: partners.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                partners[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  partnercontroller.text = partners[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (preferreddatecontroller.text == '') {
      setState(() {
        preferreddatecontroller.text = dateFormat.format(DateTime.now());
      });
    }
    if (requirebydatecontroller.text == '') {
      setState(() {
        requirebydatecontroller.text = dateFormat.format(DateTime.now());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.018,
              ),
              Text(
                "Select partner",
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
                  child: DropDownTextField(
                    controller: partnercontroller,
                    obscureText: false,
                    autoValidation: _autovalidation,
                    textInputType: TextInputType.text,
                    hintText: "Select Partner",
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Select Partner';
                      }
                      return null;
                    },
                  ),
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
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Text(
                            "Select Partner",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03),
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
                            child: partnerview(['${user.userName}']),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
              ),
              AppTextField(
                title: AppString.businessName,
                controller: businessnamecontroller,
                textInputType: TextInputType.text,
                hintText: AppString.businessName,
                textInputFormatter: [],
                validator: (value) =>
                    AppConstant.stringValidator(value, AppString.businessName),
                focusNode: _businessnamecontrollernode,
                nextFocusNode: _postcodenode,
              ),

              AppTextField(
                title: AppString.postCode,
                controller: postcode,
                textInputType: TextInputType.text,
                hintText: AppString.postCode,
                textInputFormatter: [],
                validator: (value) {
                  if (!RegExp(
                          "([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})")
                      .hasMatch(value)) {
                    print("invalid");
                    return "Please enter a valid Code";
                  }
                  return AppConstant.stringValidator(value, AppString.postCode);
                },
                focusNode: _postcodenode,
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
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
                              oneyear
                                  ? Icon(
                                      Icons.check_box,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                    )
                                  : InkWell(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                      ),
                                      onTap: () {
                                        setState(() {
                                          oneyear = !oneyear;
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
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            oneyear = !oneyear;
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
                              twoyear
                                  ? Icon(Icons.check_box,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1))
                                  : InkWell(
                                      child: Icon(Icons.check_box_outline_blank,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .023,
                                          color:
                                              Color.fromRGBO(155, 119, 217, 1)),
                                      onTap: () {
                                        setState(() {
                                          twoyear = !twoyear;
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
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            twoyear = !twoyear;
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
                              threeYear
                                  ? Icon(
                                      Icons.check_box,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                    )
                                  : InkWell(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          threeYear = !threeYear;
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
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            threeYear = !threeYear;
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
                              other
                                  ? Icon(
                                      Icons.check_box,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                    )
                                  : InkWell(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          other = !other;
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
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            other = !other;
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
                              all
                                  ? Icon(
                                      Icons.check_box,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                    )
                                  : InkWell(
                                      child: Icon(
                                        Icons.check_box_outline_blank,
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .023,
                                        color: Color.fromRGBO(155, 119, 217, 1),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          all = !all;
                                        });
                                        if (all) {
                                          setState(() {
                                            oneyear = true;
                                            twoyear = true;
                                            threeYear = true;
                                          });
                                        }
                                      },
                                    ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .02,
                              ),
                              Text(
                                "All",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .02,
                                    color: Color.fromRGBO(0, 0, 0, .8)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            all = !all;
                          });
                          if (all) {
                            setState(() {
                              oneyear = true;
                              twoyear = true;
                              threeYear = true;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: themeApp.textfieldbordercolor, width: 2),
                    borderRadius: BorderRadius.circular(3)),
              ),
//            Container(
//              height: MediaQuery.of(context).size.height*.062,
//              width: MediaQuery.of(context).size.width,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  SizedBox(
//                    width: MediaQuery.of(context).size.width*.02,
//                  ),
//                  InkWell(
//                    child: Container(
//                      height: MediaQuery.of(context).size.height*.062,
//                      child: Row(
//                        children: <Widget>[
//                          termselected==1?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
//                            onTap: (){
//                              setState(() {
//                                termselected=1;
//                              });
//                            },),
//                          SizedBox(
//                            width: MediaQuery.of(context).size.width*.02,
//                          ),
//                          Text("1 Year",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
//                        ],
//                      ),
//                    ),
//                    onTap: (){
//                      setState(() {
//                        termselected=1;
//                      });
//                    },
//                  ),
//                  SizedBox(
//                    width: MediaQuery.of(context).size.width*.02,
//                  ),
//                  InkWell(
//                    child: Container(
//                      height: MediaQuery.of(context).size.height*.062,
//                      child: Row(
//                        children: <Widget>[
//                          termselected==2?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)):InkWell(
//                            child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)),
//                            onTap: (){
//                              setState(() {
//                                termselected=2;
//                              });
//                            },
//                          ),
//                          SizedBox(
//                            width: MediaQuery.of(context).size.width*.02,
//                          ),
//                          Text("2 Year",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
//                        ],
//                      ),
//                    ),
//                    onTap: (){
//                      setState(() {
//                        termselected=2;
//                      });
//
//                    },
//                  ),
//                  SizedBox(
//                    width: MediaQuery.of(context).size.width*.02,
//                  ),
//                  InkWell(
//                    child: Container(
//                      height: MediaQuery.of(context).size.height*.062,
//                      child: Row(
//                        children: <Widget>[
//                          termselected==3?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),):InkWell(child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),),
//                            onTap: (){
//                              setState(() {
//                                termselected=3;
//                              });
//                            },),
//                          SizedBox(
//                            width: MediaQuery.of(context).size.width*.02,
//                          ),
//                          Text("3 Year",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
//                        ],
//                      ),
//                    ),
//                    onTap: (){
//                      setState(() {
//                        termselected=3;
//                      });
//
//                    },
//                  ),
//                  SizedBox(
//                    width: MediaQuery.of(context).size.width*.02,
//                  ),
//                  InkWell(
//                    child: Container(
//                      height: MediaQuery.of(context).size.height*.062,
//                      child: Row(
//                        children: <Widget>[
//                          termselected==4?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),):InkWell(
//                            child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),),
//                            onTap: (){
//                              setState(() {
//                                termselected=4;
//                              });
//                            },
//                          ),
//                          SizedBox(
//                            width: MediaQuery.of(context).size.width*.02,
//                          ),
//                          Text("Other",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
//                        ],
//                      ),
//                    ),
//                    onTap: (){
//                      setState(() {
//                        termselected=4;
//                      });
//                    },
//                  ),
//                  SizedBox(
//                    width: MediaQuery.of(context).size.width*.02,
//                  ),
//                  InkWell(child: Container(
//                    height: MediaQuery.of(context).size.height*.062,
//                    child: Row(
//                      children: <Widget>[
//                        termselected==5?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),):InkWell(
//                          child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),),
//                          onTap: (){
//                            setState(() {
//                              termselected=5;
//                            });
//                          },
//                        ),
//                        SizedBox(
//                          width: MediaQuery.of(context).size.width*.02,
//                        ),
//                        Text("All",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
//                      ],
//                    ),
//                  ),
//                    onTap: (){
//                      setState(() {
//                        termselected=5;
//                      });
//
//                    },),
//                  SizedBox(
//                    width: MediaQuery.of(context).size.width*.02,
//                  ),
//
//                ],
//              ),
//              decoration: BoxDecoration(
//                  color: Colors.white,
//                  border:Border.all(color: themeApp.textfieldbordercolor,width: 2),
//                  borderRadius: BorderRadius.circular(3)
//              ),
//            ),
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
                "Preferred by Date",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .38,
                      height: MediaQuery.of(context).size.height * 0.062,
                      child: Center(
                        child: Text(
                          "NOTES",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.018,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(155, 119, 217, 1),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: AddAndViewNote(),
                              ));
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .52,
                    height: MediaQuery.of(context).size.height * 0.062,
                    child: Center(
                      child: Text(
                        "SUPPLY POINT DETAIL",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.018,
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
                  if (_formKey.currentState.validate()) {
                    AskForQuoteModel askForQuote =
                        Provider.of<AskForQuoteModel>(context, listen: false);
                    // int tpm = 0, green = 0;
                    // int termselected = 0;

                    // List partner = ["Abc", "Gdgd", "Xyz"];
                    askForQuote.accountId =
                        Provider.of<User>(context, listen: false).accountId;
                    askForQuote.businessName = businessnamecontroller.text;
                    askForQuote.postCode = postcode.text;
                    askForQuote.requiredByDate = requirebydatecontroller.text;
                    askForQuote.preferredStartDate =
                        preferreddatecontroller.text;
                    askForQuote.isforFirstyear = oneyear.toString();
                    askForQuote.isforSecondyear = twoyear.toString();
                    askForQuote.isforThirdyear = threeYear.toString();
                    askForQuote.isforFourthyear = all.toString();
                    askForQuote.isforFifthyear = all.toString();
                    askForQuote.isforOtheryear = other.toString();

                    globals.tabController3.animateTo(1);
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.028,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
