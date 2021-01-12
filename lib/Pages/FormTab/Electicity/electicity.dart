import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Pages/FormTab/Electicity/Tab/businessDetailsTab.dart';
import 'package:pozitive/Pages/FormTab/Electicity/Tab/pymentDetails.dart';
import 'package:pozitive/Pages/FormTab/Electicity/Tab/billingAddressTab.dart';
import 'package:pozitive/Pages/FormTab/Electicity/Tab/energyAccountManagerTab.dart';
import 'package:pozitive/Pages/FormTab/Electicity/Tab/groupDetails.dart';
import 'package:pozitive/Pages/FormTab/Electicity/Tab/partnerDetails.dart';
import 'package:pozitive/Pages/FormTab/Electicity/Tab/siteAddressTab.dart';
import 'package:pozitive/Pages/FormTab/Electicity/Tab/electricityTab.dart';
import 'package:pozitive/Util/global.dart' as globals;

class ElecticityTab extends StatefulWidget {
  @override
  _ElecticityTabState createState() => _ElecticityTabState();
}

class _ElecticityTabState extends State<ElecticityTab>
    with SingleTickerProviderStateMixin {
  // TabController _tabController;

  @override
  void initState() {
    // _tabController = new TabController(length: 8, vsync: this);

    globals.tabController1 = new TabController(length: 8, vsync: this);
    globals.tabController1.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {
      globals.tabController1.index;
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
                    "Electricity",
                    style: TextStyle(
                        color: globals.tabController1.index == 0
                            ? ThemeApp().purplecolor
                            : Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                new Tab(
                  child: Text("Business Details",
                      style: TextStyle(
                          color: globals.tabController1.index == 1
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text("Site Address",
                      style: TextStyle(
                          color: globals.tabController1.index == 2
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text("Billing Address",
                      style: TextStyle(
                          color: globals.tabController1.index == 3
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text("Energy Account Manager",
                      style: TextStyle(
                          color: globals.tabController1.index == 4
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text("Payment Details",
                      style: TextStyle(
                          color: globals.tabController1.index == 5
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text("Partner Details",
                      style: TextStyle(
                          color: globals.tabController1.index == 6
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                new Tab(
                  child: Text("Group Details",
                      style: TextStyle(
                          color: globals.tabController1.index == 7
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
              ],
              controller: globals.tabController1,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Electicity(),
                BusinessDetailsTab(),
                SiteAddressTab(),
                BillingAddressTab(),
                EnergyAccountManager(),
                PaymentDetailsTab(),
                PartnerDetailsTab(),
                GroupDetailsTab()
              ],
              controller: globals.tabController1,
            ),
          )
        ],
      ),
    );
  }
}
