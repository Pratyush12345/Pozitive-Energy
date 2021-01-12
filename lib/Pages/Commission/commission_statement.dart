import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/Model/custom_pop_up.dart';

import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/shapePopUp.dart';

class CommissionStatement extends StatefulWidget {
  @override
  _CommissionStatementState createState() => _CommissionStatementState();
}

List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(
      title: 'Download All', assetImage: "assets/icon/download.png"),
  CustomPopupMenu(
      title: 'Download Invoice',
      assetImage: "assets/icon/download-invoice.png"),
  CustomPopupMenu(
      title: 'Commission Detail',
      assetImage: "assets/icon/commission-detail.png"),
  CustomPopupMenu(
      title: 'Commission Status',
      assetImage: "assets/icon/commission-status.png"),
  CustomPopupMenu(
      title: 'Alliance Commission',
      assetImage: "assets/icon/Alliance Commission.png"),
];

class _CommissionStatementState extends State<CommissionStatement> {
  bool partner = true;
  var key;

  List requestedlist = [
    {
      "Status": "Amber",
      "Timer": "18:15",
      "No": "l155455",
      "partner_name": "Black Sheep Utitlities",
      "Last Access": "Quotes Support",
      "Business_name": "Mr M F and Mrs H E Way ta Way Fuels",
      "Required By Date": "02/12/2019",
      "Created/Rerequested Date": "02/12/2019 08:20:16",
      "invoice_number": "PZT/2020/02/14_4064",
      "invoice_date": "14/02/2020",
      "invoice_total": "Sales commissions"
    }
  ];
  List viewlist = [];

  bool isSwitched = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 20; i++) {
      setState(() {
        viewlist.add({"view": false, "click": false, "checkbox": false});
      });
    }
  }

  void _onselect(CustomPopupMenu choice, job_id) {
    if (choice.title == "Remove Job") {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Commission Invoice Report", context, key, false, true),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width * .5,
                  height: MediaQuery.of(context).size.height * .08,
                  child: Center(
                    child: Text(
                      "Partner",
                      style: TextStyle(
                          color: partner
                              ? Color.fromRGBO(20, 121, 70, 1)
                              : Color.fromRGBO(123, 123, 123, 1),
                          fontSize: MediaQuery.of(context).size.height * .022),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: partner
                              ? BorderSide(
                                  color: Color.fromRGBO(20, 121, 70, 1),
                                  width: 2)
                              : BorderSide(color: Colors.transparent))),
                ),
                onTap: () {
                  setState(() {
                    partner = true;
                  });
                },
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width * .5,
                  height: MediaQuery.of(context).size.height * .08,
                  child: Center(
                    child: Text("Renewal",
                        style: TextStyle(
                            color: partner
                                ? Color.fromRGBO(123, 123, 123, 1)
                                : Color.fromRGBO(20, 121, 70, 1),
                            fontSize:
                                MediaQuery.of(context).size.height * .022)),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: partner
                              ? BorderSide(color: Colors.transparent)
                              : BorderSide(
                                  color: Color.fromRGBO(20, 129, 88, 1),
                                  width: 2))),
                ),
                onTap: () {
                  setState(() {
                    partner = false;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.017,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .02,
                  right: MediaQuery.of(context).size.width * .02),
              child: Column(
                children: <Widget>[
                  Container(
//                  width: MediaQuery.of(context).size.width,
                    color: Color.fromRGBO(48, 142, 58, 1),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.017,
                          bottom: MediaQuery.of(context).size.height * 0.017),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * .31,
                              child: Text(
                                "Invoice Number",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width * .28,
                              child: Text(
                                "Invoice Date",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width * .34,
                              child: Text(
                                "Invoice Total",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        shrinkWrap: true,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              Container(
//                  width: MediaQuery.of(context).size.width,
                                color: index.isOdd
                                    ? Colors.white
                                    : Color.fromRGBO(237, 243, 231, 1),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.01,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .02,
                                      ),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .31,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${requestedlist[0]["invoice_number"]}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.029),
                                            ),
                                          )),
                                      InkWell(
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .28,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "${requestedlist[0]["invoice_date"]}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.029),
                                              ),
                                            )),
                                        onTap: () {
                                          setState(() {
                                            viewlist[index]["click"] =
                                                !viewlist[index]["click"];
                                          });
                                        },
                                      ),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .34,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: <Widget>[
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .2,
                                                    child: Text(
                                                      "${requestedlist[0]["invoice_total"]}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.029),
                                                    )),
                                                Spacer(),
                                                Transform.scale(
                                                  scale: 1,
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .06,
                                                    child: PopupMenuButton<
                                                        CustomPopupMenu>(
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      color: Colors.deepPurple,
                                                      shape:
                                                          CustomRoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12)),
//                                              onSelected: _select,
                                                      itemBuilder: (BuildContext
                                                          context) {
                                                        return choices.map(
                                                            (CustomPopupMenu
                                                                choice) {
                                                          return PopupMenuItem<
                                                              CustomPopupMenu>(
                                                            value: choice,
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Image.asset(
                                                                  choice
                                                                      .assetImage,
                                                                  scale: 8,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      .02,
                                                                ),
                                                                Text(
                                                                  choice.title,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                )
                                                              ],
                                                            ),
                                                          );
                                                        }).toList();
                                                      },
                                                    ),
                                                  ),
                                                ),
//                                            Transform.scale(
//                                              scale: 1,
//                                              child: SizedBox(
//                                                width: MediaQuery.of(context).size.width*.06,
//                                                child: PopupMenuButton<CustomPopupMenu>(
//                                                  color: Colors.deepPurple,
//
//                                                  shape: CustomRoundedRectangleBorder(
//                                                    borderRadius: BorderRadius.circular(12),
//                                                    borderWidth: 1
//                                                  ),
//                                                  elevation: 3.2,
//                                                  initialValue: choices[0],
//                                                  onCanceled: () {
//                                                    print('You have not chossed anything');
//                                                  },
//                                                  tooltip: 'This is tooltip',
//                                                  onSelected: (CustomPopupMenu choice){
//                                                    _onselect(choice,"");
//
//
//                                                  },
//                                                  itemBuilder: (BuildContext context) {
//                                                    return choices.map((CustomPopupMenu choice) {
//                                                      return PopupMenuItem<CustomPopupMenu>(
//                                                        value: choice,
//                                                        child: Row(
//                                                          children: <Widget>[
//                                                            Image.asset(choice.assetImage,scale: 8,),
//                                                            SizedBox(
//                                                              width: MediaQuery.of(context).size.width*.02,
//                                                            ),
//                                                            Text(choice.title,style: TextStyle(
//                                                              color: Colors.white
//                                                            ),)
//                                                          ],
//                                                        ),
//                                                      );
//                                                    }).toList();
//                                                  },
//                                                ),
//                                              ),
//                                            )
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              viewlist[index]["click"]
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(243, 249, 237, 1),
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(.5))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                  child: Text("Status",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.027,
                                                      )),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.46,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .03,
                                                ),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text(
                                                        requestedlist[0]
                                                            ["Status"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027)))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text("Timer",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027))),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .03,
                                                ),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text(
                                                        requestedlist[0]
                                                            ["Timer"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027)))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text("No",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027))),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .03,
                                                ),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text(
                                                        requestedlist[0]["No"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027)))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.46,
                                                  child: Text("Partner Name",
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.027)),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .03,
                                                ),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text(
                                                        requestedlist[0]
                                                            ["partner_name"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027)))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text("Last Access",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .03,
                                                ),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text(
                                                        requestedlist[0]
                                                            ["Last Access"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027)))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text("Business Name",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027))),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .03,
                                                ),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text(
                                                        requestedlist[0]
                                                            ["Business_name"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027)))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text(
                                                        "Required By Date",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .03,
                                                ),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text(
                                                        requestedlist[0][
                                                            "Required By Date"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027)))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text(
                                                        "Created/Rerequested Date",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .03,
                                                ),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.46,
                                                    child: Text(
                                                        requestedlist[0][
                                                            "Created/Rerequested Date"],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.027)))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container()
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
