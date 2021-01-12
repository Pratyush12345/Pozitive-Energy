import 'package:flutter/material.dart';
import 'package:pozitive/Pages/Commission/commission_statement.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Pages/Commission/affiliatesReport.dart';
import 'package:pozitive/Pages/Commission/dailyCommissionReport.dart';

class CommissionPage extends StatefulWidget {
  @override
  _CommissionPageState createState() => _CommissionPageState();
}

class _CommissionPageState extends State<CommissionPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appbar("Commission", context, _scaffoldKey, true, true),
      drawer: DrawerWidget(),
      body: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
            top: MediaQuery.of(context).size.height * .02),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Container(
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
                              "assets/icon/commission_statment.png",
                              scale: 5,
                            ),
                          ),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                Color.fromRGBO(25, 126, 66, 1),
                                Color.fromRGBO(111, 183, 25, 1)
                              ])),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .29,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .25,
                                  child: Text(
                                    "Commission Statement",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .014,
                                        fontWeight: FontWeight.bold),
                                  )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .005,
                              ),
//                            Text("20",style: TextStyle(color: Color.fromRGBO(48, 142, 58, 1),fontSize: MediaQuery.of(context).size.height*.02,fontWeight: FontWeight.bold))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => CommissionStatement()));
                  },
                ),
                InkWell(
                  child: Container(
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
                              "assets/icon/daily-commission.png",
                              scale: 5,
                            ),
                          ),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                Color.fromRGBO(131, 194, 38, 1),
                                Color.fromRGBO(210, 225, 64, 1)
                              ])),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .29,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .23,
                                  child: Text(
                                    "Daily Commmission",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .014,
                                        fontWeight: FontWeight.bold),
                                  )),
//                            SizedBox(
//                              height: MediaQuery.of(context).size.height*.005,
//                            ),
//                            Text("300",style: TextStyle(color: Color.fromRGBO(48, 142, 58, 1),fontSize: MediaQuery.of(context).size.height*.02))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => DailyCommissionReport()));
                  },
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.023,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Container(
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
                              "assets/icon/Affiliates.png",
                              scale: 5,
                            ),
                          ),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                Color.fromRGBO(123, 72, 193, 1),
                                Color.fromRGBO(147, 116, 210, 1)
                              ])),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .29,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .23,
                                  child: Text(
                                    "Affiliates",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .014,
                                        fontWeight: FontWeight.bold),
                                  )),
//                            SizedBox(
//                              height: MediaQuery.of(context).size.height*.005,
//                            ),
//                            Text("115",style: TextStyle(color: Color.fromRGBO(48, 142, 58, 1),fontSize: MediaQuery.of(context).size.height*.02,fontWeight: FontWeight.bold))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => AffiliatesReport()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
