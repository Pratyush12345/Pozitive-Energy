import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/askForQuoteModel.dart';

import 'package:pozitive/Core/Model/Api/askForQuoteViewButtonModel.dart';
import 'package:pozitive/Core/Model/Api/getPartnerAddQuickLeadModel.dart';

import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Pages/Quotation/Tab/individual.dart';
import 'package:pozitive/Pages/Quotation/Tab/electricity.dart';
import 'package:pozitive/Pages/Quotation/Tab/gas.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:provider/provider.dart';

class QuotationPage extends StatefulWidget {
  @override
  _QuotationPageState createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage>
    with SingleTickerProviderStateMixin {
  //TabController _tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  void initState() {
    globals.tabController3 = new TabController(length: 3, vsync: this);
    globals.tabController3.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {
      globals.tabController3.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tabWidth = width / 3;

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: appbar("Quotation", context, _scaffoldKey, true, true),
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
              // isScrollable: true,
              tabs: [
                Container(
                  child: new Tab(
                    child: Text(
                      "Individual",
                      style: TextStyle(
                          color: globals.tabController3.index == 0
                              ? ThemeApp().purplecolor
                              : Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  width: tabWidth,
                ),
                Container(
                    child: new Tab(
                      child: Text("Electricity",
                          style: TextStyle(
                              color: globals.tabController3.index == 1
                                  ? ThemeApp().purplecolor
                                  : Colors.grey,
                              fontWeight: FontWeight.bold)),
                    ),
                    width: tabWidth),
                Container(
                    child: new Tab(
                      child: Text("Gas",
                          style: TextStyle(
                              color: globals.tabController3.index == 2
                                  ? ThemeApp().purplecolor
                                  : Colors.grey,
                              fontWeight: FontWeight.bold)),
                    ),
                    width: tabWidth),
              ],
              controller: globals.tabController3,
            ),
          ),
          Expanded(
            child: MultiProvider(
              providers: [
                StreamProvider<AskForQuoteModel>(
                  create: (context) => Stream.value(AskForQuoteModel()),
                ),
                StreamProvider<AskForQuoteViewButtonModel>(
                  create: (context) =>
                      Stream.value(AskForQuoteViewButtonModel()),
                ),
              ],
              child: TabBarView(
                children: [Individual(), Electricity(), Gas()],
                controller: globals.tabController3,
              ),
            ),
          )
        ],
      ),
    );
  }
}
