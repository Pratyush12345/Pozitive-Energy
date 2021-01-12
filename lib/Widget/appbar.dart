import 'package:flutter/material.dart';

Widget appbar(String title, BuildContext context, key, bool enableDrawer,
    bool notficicationIcon) {
  return enableDrawer
      ? AppBar(
          leading: InkWell(
            child: Image.asset(
              "assets/menu.png",
              scale: 6,
            ),
            onTap: () {
              key.currentState.openDrawer();
            },
          ),
          title: Text(title,
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
                                  fontSize: MediaQuery.of(context).size.height *
                                      .014),
                            )),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.redAccent),
                        ))
                  ],
                ),
                onPressed: () {})
          ],
        )
      : AppBar(
          title: Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.048)),
          centerTitle: true,
          actions: <Widget>[
            notficicationIcon
                ? IconButton(
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
                                          MediaQuery.of(context).size.height *
                                              .014),
                                )),
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.redAccent),
                            ))
                      ],
                    ),
                    onPressed: () {})
                : SizedBox(
                    height: 0.0,
                    width: 0.0,
                  )
          ],
        );
}
//
//class CustomAppBar extends StatefulWidget implements PreferredSizeWidget  {
//  var key;
//  String tittle;
//  bool drawerEnable;
//  @override
//  final Size preferredSize;
//  CustomAppBar({this.key,this.drawerEnable,this.tittle}):preferredSize=Size.fromHeight(60.0);
//  @override
//  _CustomAppBarState createState() => _CustomAppBarState();
//}
//
//class _CustomAppBarState extends State<CustomAppBar> {
//
//
//  @override
//  Widget build(BuildContext context) {
//    return AppBar(
//      leading: widget.drawerEnable?InkWell(child: Image.asset("assets/menu.png",scale: 6,),
//        onTap: (){
////          widget.key.currentState.openDrawer();
//
//        },):null,
//      title: Text(widget.tittle,style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width*0.048)),
//      centerTitle: true,
//      actions: <Widget>[
//        IconButton(icon: Stack(
//          children: <Widget>[
//            Image.asset("assets/notification.png",scale: 7,),
//            Positioned(right: 0,top:-4,child: Container(
//              child: Padding(
//                padding: const EdgeInsets.all(4.0),
//                child: Center(child: Text("9",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*.014),)),
//              ),
//              decoration: BoxDecoration(
//                  shape: BoxShape.circle,
//                  color: Colors.redAccent
//              ),
//            ))
//          ],
//        ), onPressed: (){
//
//        })
//
//      ],
//    );
//  }
//}
