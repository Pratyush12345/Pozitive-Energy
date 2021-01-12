import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Pages/Quatation_Individual/Tab/businessDetail.dart';
import 'package:pozitive/Pages/Quatation_Individual/Tab/electricity.dart';
import 'package:pozitive/Pages/Quatation_Individual/Tab/gas.dart';
import 'package:pozitive/Pages/Quatation_Individual/Tab/priceElectricity.dart';
import 'package:pozitive/Pages/Quatation_Individual/Tab/priceElectricityGas.dart';
import 'package:pozitive/Pages/Quatation_Individual/Tab/priceGas.dart';
import 'package:pozitive/Util/global.dart' as globals;

class AddQuotationIndividualPage extends StatefulWidget {
  @override
  _AddQuotationIndividualPageState createState() =>
      _AddQuotationIndividualPageState();
}

class _AddQuotationIndividualPageState extends State<AddQuotationIndividualPage>
    with SingleTickerProviderStateMixin {
  //TabController _tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  void initState() {
    globals.tabController4 = new TabController(length: 6, vsync: this);
    globals.tabController4.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {
      globals.tabController4.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: appbar("Quotation Individual", context, _scaffoldKey, true, true),
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
                      "Business Detail",
                      style: TextStyle(
                          color: globals.tabController4.index == 0
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  child: new Tab(
                    child: Text("Electricity",
                        style: TextStyle(
                            color: globals.tabController4.index == 1
                                ? ThemeApp().purplecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  child: new Tab(
                    child: Text("Gas",
                        style: TextStyle(
                            color: globals.tabController4.index == 2
                                ? ThemeApp().purplecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  child: new Tab(
                    child: Text("Price Electricity/Gas",
                        style: TextStyle(
                            color: globals.tabController4.index == 3
                                ? ThemeApp().purplecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  child: new Tab(
                    child: Text("Price(1 Year) Electricity",
                        style: TextStyle(
                            color: globals.tabController4.index == 4
                                ? ThemeApp().purplecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  child: new Tab(
                    child: Text("Price(1 Year) Gas",
                        style: TextStyle(
                            color: globals.tabController4.index == 5
                                ? ThemeApp().purplecolor
                                : Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
              controller: globals.tabController4,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                BusinessDetail(),
                Electricity(),
                Gas(),
                PriceElectricityGas(),
                PriceElectricity(),
                PriceGas()
              ],
              controller: globals.tabController4,
            ),
          )
        ],
      ),
    );
  }
}
