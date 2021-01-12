import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Pages/Contract_Customer_Details/Tab/directDebitAgreement.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Pages/Contract_Customer_Details/Tab/billingAddress.dart';
import 'package:pozitive/Pages/Contract_Customer_Details/Tab/businessDetail.dart';
import 'package:pozitive/Pages/Contract_Customer_Details/Tab/electricity.dart';
import 'package:pozitive/Pages/Contract_Customer_Details/Tab/energyAccountManager.dart';
import 'package:pozitive/Pages/Contract_Customer_Details/Tab/gas.dart';
import 'package:pozitive/Pages/Contract_Customer_Details/Tab/siteAddress.dart';
import 'package:pozitive/Pages/Contract_Customer_Details/Tab/uniqueRefNo.dart';
import 'package:pozitive/Util/global.dart' as globals;

class ContractCustomerDetails extends StatefulWidget {
  @override
  _ContractCustomerDetailsState createState() =>
      _ContractCustomerDetailsState();
}

class _ContractCustomerDetailsState extends State<ContractCustomerDetails>
    with SingleTickerProviderStateMixin {
  //TabController _tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  void initState() {
    globals.tabController5 = new TabController(length: 8, vsync: this);
    globals.tabController5.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {
      globals.tabController5.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: appbar(
          "Contract Customer Details", context, _scaffoldKey, true, true),
      drawer: DrawerWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(228, 241, 215, 1),
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: ThemeApp().purplecolor,
              indicatorColor: ThemeApp().purplecolor,
              isScrollable: true,
              // isScrollable: true,
              tabs: [
                Container(
                  child: new Tab(
                    child: Text(
                      "Unique ref no.",
                      style: TextStyle(
                          color: globals.tabController5.index == 0
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  child: new Tab(
                    child: Text("Business Detail",
                        style: TextStyle(
                            color: globals.tabController5.index == 1
                                ? ThemeApp().purplecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  child: new Tab(
                    child: Text("Site Address",
                        style: TextStyle(
                            color: globals.tabController5.index == 2
                                ? ThemeApp().purplecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  child: new Tab(
                    child: Text("Billing Address",
                        style: TextStyle(
                            color: globals.tabController5.index == 3
                                ? ThemeApp().purplecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  child: new Tab(
                    child: Text("Energy Account Manager",
                        style: TextStyle(
                            color: globals.tabController5.index == 4
                                ? ThemeApp().purplecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  child: new Tab(
                    child: Text("Electricity",
                        style: TextStyle(
                            color: globals.tabController5.index == 5
                                ? ThemeApp().purplecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  child: new Tab(
                    child: Text("Gas",
                        style: TextStyle(
                            color: globals.tabController5.index == 6
                                ? ThemeApp().purplecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  child: new Tab(
                    child: Text("Direct Debit Agreement",
                        style: TextStyle(
                            color: globals.tabController5.index == 7
                                ? ThemeApp().purplecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
              controller: globals.tabController5,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                UniqueRefNo(),
                BusinessDetail(),
                SiteAddress(),
                BillingAddress(),
                EnergyAccountManager(),
                Electricity(),
                Gas(),
                DirectDebitAgreement()
              ],
              controller: globals.tabController5,
            ),
          )
        ],
      ),
    );
  }
}
