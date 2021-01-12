import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/MyConnectivity.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Core/Model/Api/profileIdModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/AuthService.dart';
import 'package:pozitive/Core/ViewModel/dashBoardViewModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Pages/group_quotation_page.dart';
import 'package:pozitive/Pages/Quotation/quotation_page.dart';
import 'package:pozitive/Widget/DashBorad/deshBoradItem.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/homePage';
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AutService().user,
      initialData: User(),
      child: HomePageView(),
    );
  }
}

class HomePageView extends StatefulWidget {
  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
      print(_source.keys.toList()[0]);
      if (_source.keys.toList()[0] == ConnectivityResult.none) {
        AppConstant.showFialureDialogue('No internet contection', context);
      }
    });
  }

  bool individual = true;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    SizeConfig.init(context);
    print('homePage=${user.accountId}');
    return user.accountId != null
        ? BaseView<DashBoardViewModel>(
            onModelReady: (model) =>
                model.getDashBoardDetails(ProfileId(accountId: user.accountId)),
            builder: (context, model, child) {
              if (model.state == ViewState.BUSY) {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Scaffold(
                  key: _scaffoldKey,
                  appBar: appbar(AppString.requestDashBoard, context,
                      _scaffoldKey, true, true),
                  drawer: DrawerWidget(),
//      backgroundColor: Color.fromRGBO(228, 241, 215, 1),
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
                                  AppString.indvidual,
                                  style: TextStyle(
                                      color: individual
                                          ? Color.fromRGBO(20, 121, 70, 1)
                                          : Color.fromRGBO(123, 123, 123, 1),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .022),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom: individual
                                          ? BorderSide(
                                              color: Color.fromRGBO(
                                                  20, 121, 70, 1),
                                              width: 2)
                                          : BorderSide(
                                              color: Colors.transparent))),
                            ),
                            onTap: () {
                              setState(() {
                                individual = true;
                              });
                            },
                          ),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .5,
                              height: MediaQuery.of(context).size.height * .08,
                              child: Center(
                                child: Text(AppString.groupBasket,
                                    style: TextStyle(
                                        color: individual
                                            ? Color.fromRGBO(123, 123, 123, 1)
                                            : Color.fromRGBO(20, 121, 70, 1),
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .022)),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom: individual
                                          ? BorderSide(
                                              color: Colors.transparent)
                                          : BorderSide(
                                              color: Color.fromRGBO(
                                                  20, 129, 88, 1),
                                              width: 2))),
                            ),
                            onTap: () {
                              setState(() {
                                individual = false;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.023,
                      ),
                      individual
                          ? Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.03,
                                    right: MediaQuery.of(context).size.width *
                                        0.03),
                                child: ListView(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        DashBoradItem(
                                          title: AppString.underProcess,
                                          assetsPath:
                                              'assets/Under-Process.png',
                                          value: model
                                              .dashBoardModel.upderProcessCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(25, 126, 66, 1),
                                                Color.fromRGBO(111, 183, 25, 1)
                                              ]),
                                          type: AppString.indvidual,
                                        ),
                                        DashBoradItem(
                                          title: AppString.requestQuote,
                                          assetsPath:
                                              'assets/Requested-Quote.png',
                                          value: model.dashBoardModel
                                              .requestedQuoteCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(131, 194, 38, 1),
                                                Color.fromRGBO(210, 225, 64, 1)
                                              ]),
                                          type: AppString.indvidual,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.023,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        DashBoradItem(
                                          title: AppString.quoted,
                                          assetsPath: 'assets/Quoted.png',
                                          value: model
                                              .dashBoardModel.quotedCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(123, 72, 193, 1),
                                                Color.fromRGBO(147, 116, 210, 1)
                                              ]),
                                          type: AppString.indvidual,
                                        ),
                                        DashBoradItem(
                                          title: AppString.requestedRequote,
                                          assetsPath:
                                              'assets/Requested-Requote.png',
                                          value: model.dashBoardModel
                                              .requestedQuoteCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(28, 129, 64, 1),
                                                Color.fromRGBO(112, 185, 34, 1)
                                              ]),
                                          type: AppString.indvidual,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.023,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        DashBoradItem(
                                          title: AppString.requoted,
                                          assetsPath: 'assets/Requoted.png',
                                          value: model.dashBoardModel
                                              .requestedReQuoteCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(126, 191, 35, 1),
                                                Color.fromRGBO(209, 223, 65, 1)
                                              ]),
                                          type: AppString.indvidual,
                                        ),
                                        DashBoradItem(
                                          title: AppString.accepted,
                                          assetsPath: 'assets/Accepted.png',
                                          value: model
                                              .dashBoardModel.acceptedCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(122, 68, 191, 1),
                                                Color.fromRGBO(146, 112, 207, 1)
                                              ]),
                                          type: AppString.indvidual,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.023,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        DashBoradItem(
                                          title: AppString
                                              .contractSendButNotReceived,
                                          assetsPath:
                                              'assets/Contract-sent-but-not.png',
                                          value: model.dashBoardModel
                                              .contractSendNotReceivedCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(122, 68, 191, 1),
                                                Color.fromRGBO(146, 112, 207, 1)
                                              ]),
                                          type: AppString.indvidual,
                                        ),
                                        Spacer()
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .04,
                                    ),
                                    InkWell(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.063,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .02,
                                            ),
                                            Text(
                                              AppString.aDDQUOT,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.0182,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    QuotationPage()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.03,
                                    right: MediaQuery.of(context).size.width *
                                        0.03),
                                child: ListView(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        DashBoradItem(
                                          title: AppString.underProcess,
                                          assetsPath:
                                              'assets/Under-Process.png',
                                          value: model.dashBoardModel
                                              .upderProcessGroupCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(25, 126, 66, 1),
                                                Color.fromRGBO(111, 183, 25, 1)
                                              ]),
                                          type: AppString.group,
                                        ),
                                        DashBoradItem(
                                          title: AppString.requestQuote,
                                          assetsPath:
                                              'assets/Requested-Quote.png',
                                          value: model
                                              .dashBoardModel.requotedGroupCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(131, 194, 38, 1),
                                                Color.fromRGBO(210, 225, 64, 1)
                                              ]),
                                          type: AppString.group,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.023,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        DashBoradItem(
                                          title: AppString.quoted,
                                          assetsPath: 'assets/Quoted.png',
                                          value: model
                                              .dashBoardModel.quotedGroupCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(123, 72, 193, 1),
                                                Color.fromRGBO(147, 116, 210, 1)
                                              ]),
                                          type: AppString.group,
                                        ),
                                        DashBoradItem(
                                          title: AppString.requestedRequote,
                                          assetsPath:
                                              'assets/Requested-Requote.png',
                                          value: model.dashBoardModel
                                              .requestedReQuoteGroupCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(28, 129, 64, 1),
                                                Color.fromRGBO(112, 185, 34, 1)
                                              ]),
                                          type: AppString.group,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.023,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        DashBoradItem(
                                          title: AppString.requoted,
                                          assetsPath: 'assets/Requoted.png',
                                          value: model
                                              .dashBoardModel.requotedGroupCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(126, 191, 35, 1),
                                                Color.fromRGBO(209, 223, 65, 1)
                                              ]),
                                          type: AppString.group,
                                        ),
                                        DashBoradItem(
                                          title: AppString.accepted,
                                          assetsPath: 'assets/Accepted.png',
                                          value: model
                                              .dashBoardModel.acceptedGroupCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(122, 68, 191, 1),
                                                Color.fromRGBO(146, 112, 207, 1)
                                              ]),
                                          type: AppString.group,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.023,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        DashBoradItem(
                                          title: AppString
                                              .contractSendButNotReceived,
                                          assetsPath:
                                              'assets/Contract-sent-but-not.png',
                                          value: model.dashBoardModel
                                              .contractSendNotReceivedGroupCount
                                              .toString(),
                                          linearGradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Color.fromRGBO(122, 68, 191, 1),
                                                Color.fromRGBO(146, 112, 207, 1)
                                              ]),
                                          type: AppString.group,
                                        ),
                                        Spacer()
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .04,
                                    ),
                                    InkWell(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.063,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .02,
                                            ),
                                            Text(
                                              "ADD QUOTE",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.0182,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                155, 119, 217, 1),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    GroupQuotationPage()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                    ],
                  ),
                );
              }
            },
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
