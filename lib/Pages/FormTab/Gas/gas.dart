import 'package:flutter/material.dart';
import 'package:pozitive/Pages/FormTab/Gas/Tab/businessDetailsTab.dart';
import 'package:pozitive/Pages/FormTab/Gas/Tab/gastab.dart';
import 'package:pozitive/Pages/FormTab/Gas/Tab/pymentDetails.dart';
import 'package:pozitive/Util/theme.dart';

import 'Tab/billingAddressTab.dart';
import 'Tab/energyAccountManagerTab.dart';
import 'Tab/groupDetails.dart';
import 'Tab/partnerDetails.dart';
import 'Tab/siteAddressTab.dart';
import 'package:pozitive/Util/global.dart' as globals;

class Gas extends StatefulWidget {
  @override
  _GasState createState() => _GasState();
}

class _GasState extends State<Gas> with SingleTickerProviderStateMixin {
  //TabController _tabController;

  @override
  void initState() {
    // _tabController = new TabController(length: 8, vsync: this);
    globals.tabController = new TabController(length: 8, vsync: this);
    globals.tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {
      globals.tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(228, 241, 215, 1),
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: ThemeApp().purplecolor,
              indicatorColor: ThemeApp().purplecolor,
              isScrollable: true,
              tabs: [
                new Tab(
                  child: Text(
                    "Gas",
                    style: TextStyle(
                        color: globals.tabController.index == 0
                            ? ThemeApp().purplecolor
                            : Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                new Tab(
                  child: Text("Business Details",
                      style: TextStyle(
                          color: globals.tabController.index == 1
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text("Site Address",
                      style: TextStyle(
                          color: globals.tabController.index == 2
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text("Billing Address",
                      style: TextStyle(
                          color: globals.tabController.index == 3
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text("Energy Account Manager",
                      style: TextStyle(
                          color: globals.tabController.index == 4
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text("Payment Details",
                      style: TextStyle(
                          color: globals.tabController.index == 5
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text("Partner Details",
                      style: TextStyle(
                          color: globals.tabController.index == 6
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text("Group Details",
                      style: TextStyle(
                          color: globals.tabController.index == 7
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
              ],
              controller: globals.tabController,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                GasTab(),
                BusinessDetailsTab(),
                SiteAddressTab(),
                BillingAddressTab(),
                EnergyAccountManager(),
                PaymentDetailsTab(),
                PartnerDetailsTab(),
                GroupDetailsTab()
              ],
              controller: globals.tabController,
            ),
          )
        ],
      ),
    );
  }
}
