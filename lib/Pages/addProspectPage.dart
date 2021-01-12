import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Pages/FormTab/Electicity/electicity.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:provider/provider.dart';

import 'package:pozitive/Core/Model/Api/AddProspectModel.dart';
import 'FormTab/DualFuel/dualfuel.dart';
import 'FormTab/Gas/gas.dart';
// import 'package:pozitive/Util/global.dart' as globals;

class AddProspectPage extends StatefulWidget {
  @override
  _AddProspectPageState createState() => _AddProspectPageState();
}

class _AddProspectPageState extends State<AddProspectPage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TabController _tabController;
  final List<Tab> tabs = <Tab>[
    new Tab(
      icon: Row(
        children: <Widget>[
          Image.asset(
            'assets/icon/gas.png',
            scale: 10,
          ),
          SizedBox(
            width: 8,
          ),
          Text("Gas")
        ],
      ),
    ),
    new Tab(
      icon: Row(
        children: <Widget>[
          Image.asset(
            'assets/icon/Electricity.png',
            scale: 10,
          ),
          SizedBox(
            width: 8,
          ),
          Text("Electricity")
        ],
      ),
    ),
    new Tab(
      icon: Row(
        children: <Widget>[
          Image.asset(
            'assets/icon/dual-fuel.png',
            scale: 10,
          ),
          SizedBox(
            width: 8,
          ),
          Text("Dual Fuel")
        ],
      ),
    ),
  ];

  // void _handleTabSelection() {
  //   setState(() {});
  // }

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset(
            "assets/menu.png",
            scale: 6,
          ),
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Text("Add Prospect",
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.048)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/notification.png",
                    scale: 7,
                  ),
                  Positioned(
                      right: 0,
                      top: -4,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                              child: Text(
                            "9",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * .014),
                          )),
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.redAccent),
                      ))
                ],
              ),
              onPressed: () {})
        ],
        bottom: TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: new BubbleTabIndicator(
            indicatorHeight: 35.0,
            indicatorColor: Color.fromRGBO(21, 165, 93, 1),
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
          ),
          tabs: tabs,
          controller: _tabController,
        ),
      ),
      drawer: DrawerWidget(),
      body: MultiProvider(
        providers: [
          StreamProvider<AddProspectModel>(
            create: (ctx) => Stream.value(AddProspectModel()),
          ),
        ],
        child: TabBarView(
          children: [
            Gas(),
            ElecticityTab(),
            DualFuelTabe(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
