import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';

class DailyCommissionReport extends StatefulWidget {
  @override
  _DailyCommissionReportState createState() => _DailyCommissionReportState();
}

class _DailyCommissionReportState extends State<DailyCommissionReport> {
  var key;
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;
  TextEditingController preferreddatecontroller = TextEditingController();
  TextEditingController nextpreferreddateController = TextEditingController();
  TextEditingController requirebydatecontroller = TextEditingController();
  bool singlerate = false;
  int fuelTypeSelected = 0;
  int commissionTypeSelected = 0;

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  Future _selectDate(BuildContext context, String fromfield) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
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

  List requestedlist=[
    {
      "Postcode":"125643",
      "PozitiveCustID":"123",
      "ContractStartDate":"17/02/2020",
      "ContractEndDate":"17/02/2020",
      "Fuel":"All",
      "Mpanprnno":"159369.6158",
      "Invoiceno":"159369.6158",
      "Supplyfrom":"-",
      "Supplyto":"-",
      "Billdays":"-",
      "Billeddaykwh":"-",
      "Daycontractprice":"-",
      "Billednightkwh":"-",
      "Nightcontractprice":"-",
      "BilledEWEkwh":"-",
      "EWEcontractprice":"-",
      "BilledTotalkwh":"-",
      "SCcontractprice":"-",
      "SCtotaldays":"-",
      "Subtotal":"-",
      "Fixedamount":"-",
      "Commissionamountclaimed":"-",
      "Totalclaimed":"-",
      "business_name":"Young Mei Wong",
      "customer_name":"Young Mei Wong",
      "invoice_total":"Sales commissions"
    }
  ];
  List viewlist=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 20; i++) {
      setState(() {
        viewlist.add({
          "view":false,
          "click":false,
          "checkbox":false
        });
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Daily Commission Report", context, key, false, true),
      body: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03, right: MediaQuery.of(context).size.width * 0.03),
        child: ListView(children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.028,
          ),
          Text(
            "Total Commission",
            style: TextStyle(
              color: themeApp.purplecolor,
              fontSize: MediaQuery.of(context).size.height * .025,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: 2.0,
            color: themeApp.purplecolor,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.022,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * .45,
                height: MediaQuery.of(context).size.height * .092,
                child: Row(
                  children: <Widget>[
                    Container(
//
                      height: MediaQuery.of(context).size.height * .092,
                      width: MediaQuery.of(context).size.width * .16,
                      child: Center(
                        child: Image.asset(
                          "assets/icon/Total_KWH.png",
                          scale: 5,
                        ),
                      ),
                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color.fromRGBO(25, 126, 66, 1), Color.fromRGBO(111, 183, 25, 1)])),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .29,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Total KWH",
                            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: MediaQuery.of(context).size.height * .014, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .005,
                          ),
                          Text("6540881.11", style: TextStyle(color: Color.fromRGBO(48, 142, 58, 1), fontSize: MediaQuery.of(context).size.height * .02, fontWeight: FontWeight.bold))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * .45,
                height: MediaQuery.of(context).size.height * .092,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * .092,
                      width: MediaQuery.of(context).size.width * .16,
                      child: Center(
                        child: Image.asset(
                          "assets/icon/Total_Amount.png",
                          scale: 5,
                        ),
                      ),
                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color.fromRGBO(123, 72, 193, 1), Color.fromRGBO(147, 116, 210, 1)])),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .29,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Total Amount",
                            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: MediaQuery.of(context).size.height * .014, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .005,
                          ),
                          Text(" £ 57,045.39", style: TextStyle(color: Color.fromRGBO(48, 142, 58, 1), fontSize: MediaQuery.of(context).size.height * .02, fontWeight: FontWeight.bold))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.022,
          ),
          Text(
            "Daily Commission Report",
            style: TextStyle(
              color: themeApp.purplecolor,
              fontSize: MediaQuery.of(context).size.height * .025,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: 2.0,
            color: themeApp.purplecolor,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.022,
          ),
          Text(
            "From Date",
            style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          InkWell(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: datetextfield(requirebydatecontroller, false, _autovalidation, TextInputType.text, "Select date", (value) {
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
            "To Date",
            style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          InkWell(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: datetextfield(preferreddatecontroller, false, _autovalidation, TextInputType.text, "Select date", (value) {
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
                    "Current Month",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: themeApp.textfieldbordercolor, width: 2), borderRadius: BorderRadius.circular(3)),
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
          RichText(
            text: TextSpan(
              text: 'Fuel Type',
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
              children: <TextSpan>[
                TextSpan(text: '', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .062,
            width: MediaQuery.of(context).size.width,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
//            SizedBox(
//              width: MediaQuery.of(context).size.width*.02,
//            ),
              InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.height * .062,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      fuelTypeSelected == 1
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
                                  fuelTypeSelected = 1;
                                });
                              },
                            ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .0055,
                      ),
                      Text(
                        "Electricity",
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    fuelTypeSelected = 1;
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
                      fuelTypeSelected == 2
                          ? Icon(Icons.radio_button_checked, size: MediaQuery.of(context).size.height * .023, color: Color.fromRGBO(155, 119, 217, 1))
                          : InkWell(
                              child: Icon(Icons.radio_button_unchecked, size: MediaQuery.of(context).size.height * .023, color: Color.fromRGBO(155, 119, 217, 1)),
                              onTap: () {
                                setState(() {
                                  fuelTypeSelected = 2;
                                });
                              },
                            ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .0055,
                      ),
                      Text(
                        "Gas",
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    fuelTypeSelected = 2;
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
                      fuelTypeSelected == 3
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
                                  fuelTypeSelected = 3;
                                });
                              },
                            ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .0055,
                      ),
                      Text(
                        "All",
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    fuelTypeSelected = 3;
                  });
                },
              ),
//            SizedBox(
//              width: MediaQuery.of(context).size.width*.02,
//            ),
            ]),
            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: ThemeApp().textfieldbordercolor, width: 2), borderRadius: BorderRadius.circular(3)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .022,
          ),
          RichText(
            text: TextSpan(
              text: 'Commission Type',
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
              children: <TextSpan>[
                TextSpan(text: '', style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .062,
            width: MediaQuery.of(context).size.width,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
//            SizedBox(
//              width: MediaQuery.of(context).size.width*.02,
//            ),
              InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.height * .062,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                      commissionTypeSelected == 1
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
                                  commissionTypeSelected = 1;
                                });
                              },
                            ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .0055,
                      ),
                      Text(
                        "Partner",
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    commissionTypeSelected = 1;
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
                      commissionTypeSelected == 2
                          ? Icon(Icons.radio_button_checked, size: MediaQuery.of(context).size.height * .023, color: Color.fromRGBO(155, 119, 217, 1))
                          : InkWell(
                              child: Icon(Icons.radio_button_unchecked, size: MediaQuery.of(context).size.height * .023, color: Color.fromRGBO(155, 119, 217, 1)),
                              onTap: () {
                                setState(() {
                                  commissionTypeSelected = 2;
                                });
                              },
                            ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .0055,
                      ),
                      Text(
                        "Introducer",
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    commissionTypeSelected = 2;
                  });
                },
              ),
            ]),
            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: ThemeApp().textfieldbordercolor, width: 2), borderRadius: BorderRadius.circular(3)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width*.46,
                  height: MediaQuery.of(context).size.height*0.062,
                  child: Center(
                    child: Text("Clear",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
                        fontWeight: FontWeight.bold),),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(155, 119, 217, 1),
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
                onTap: (){
                  AppConstant.showComfirmDialogue(mainContext: context,function: (){
                    setState(() {
                      _autovalidation = false;
                       preferreddatecontroller.clear();
                     nextpreferreddateController.clear();
                     requirebydatecontroller.clear();
                       singlerate = false;
                       fuelTypeSelected = 0;
                       commissionTypeSelected = 0;
                    });

                  });

                },
              ),
              Container(
                width: MediaQuery.of(context).size.width*.46,
                height: MediaQuery.of(context).size.height*0.062,
                child: Center(
                  child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
                      fontWeight: FontWeight.bold),),
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(155, 119, 217, 1),
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
            ],
          ),

          SizedBox(
            height:MediaQuery.of(context).size.width*.07,
          ),
          Padding(
            padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*.02,right: MediaQuery.of(context).size.width*.02),
            child: Column(
              children: <Widget>[
                Container(
//                  width: MediaQuery.of(context).size.width,
                  color: Color.fromRGBO(18, 122, 69, 1),
                  child: Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.017,bottom:  MediaQuery.of(context).size.height*0.017),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width:MediaQuery.of(context).size.width*.02,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width*.31,
                            child: Text("Business Name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),)
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width*.28,
                            child: Text("Customer Name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),)
                        ),

                        Container(
                            width: MediaQuery.of(context).size.width*.26,
                            child: Text("Action",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),textAlign: TextAlign.center,)
                        ),

                      ],
                    ),
                  ),
                ),
                ListView.builder(physics: NeverScrollableScrollPhysics(),padding: EdgeInsets.all(0),shrinkWrap: true,itemCount: 20,itemBuilder: (BuildContext context,int index){
                  return Column(
                    children: <Widget>[
                      Container(
//                  width: MediaQuery.of(context).size.width,
                        color: index.isOdd?Colors.white:Color.fromRGBO(237, 243, 231, 1),
                        child: Padding(
                          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01,bottom:  MediaQuery.of(context).size.height*0.01),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width:MediaQuery.of(context).size.width*.02,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width*.31,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${requestedlist[0]["business_name"]}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),),
                                  )
                              ),
                              InkWell(
                                child: Container(
                                    width: MediaQuery.of(context).size.width*.28,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${requestedlist[0]["customer_name"]}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),),
                                    )
                                ),
                                onTap: (){
                                      setState(() {
                                        viewlist[index]["click"]=!viewlist[index]["click"];
                                      });
                                },
                              ),

                              InkWell(
                                child: Container(
                                    width: MediaQuery.of(context).size.width*.28,
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset("assets/view.png",scale: 12,),
                                        SizedBox(
                                          width:MediaQuery.of(context).size.width*.02,
                                        ),
                                        Text("View",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,color: themeApp.purplecolor),),
                                      ],
                                    )
                                ),
                                onTap: (){
                                  setState(() {
                                    viewlist[index]["click"]=!viewlist[index]["click"];
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      viewlist[index]["click"]?
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(243, 249, 237, 1),
                            border: Border.all(color: Colors.grey.withOpacity(.5))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    child: Text("Post Code",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,)),
                                    width: MediaQuery.of(context).size.width*0.36,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Postcode"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Pozitive Cust ID",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["PozitiveCustID"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Contract Start Date",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["ContractStartDate"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.36,
                                    child: Text("Contract End Date",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027)),),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["ContractEndDate"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,child: Text("Fuel",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027,fontWeight: FontWeight.bold))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Fuel"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Mpan / Mprn number",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Mpanprnno"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Invoice No.",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Invoiceno"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Supply From",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Supplyfrom"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Supply To",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Supplyto"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Bill Days",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Billdays"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Mpan / Mprn number",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Mpanprnno"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Billed DAY KWH for this period of time",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Billeddaykwh"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Day Contract Price(p/kWh)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Daycontractprice"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Billed Night KWH for this period of time",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Billednightkwh"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Night Contract Price(p/kWh)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Nightcontractprice"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Billed EWE KWH for this period of time",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["BilledEWEkwh"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("EWE Contract Price(p/kWh)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["EWEcontractprice"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Billed TOTAL KWH for this period of time",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["BilledTotalkwh"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("SC Contract Price(p/day)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["SCcontractprice"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("SC Total Days",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["SCtotaldays"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("p/kWh Sub Total(£)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Subtotal"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Fixed amount PA",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Fixedamount"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Commission for amount claimed",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Commissionamountclaimed"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: MediaQuery.of(context).size.width*0.36,
                                      child: Text("Total claimed",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*.03,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width*0.36,
                                      child: Text(requestedlist[0]["Totalclaimed"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ):
                      Container()
                    ],
                  );
                })

              ],
            ),
          ),
        ]),
      ),
    );
  }
}
