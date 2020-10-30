import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Pages/dashBoradDetailsPage.dart';

class DashBoradItem extends StatelessWidget {
  String title;
  String value;
  String assetsPath;
  LinearGradient linearGradient;
  String type;
  DashBoradItem({@required this.assetsPath,@required this.title,@required this.value,@required this.linearGradient,@required this.type});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>DeshbordDetailsPage(type: type,title: title==AppString.requestQuote?AppString.requested:title,totalItem: int.parse(value),)));
      },
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width*.45,
        height:MediaQuery.of(context).size.height*.092 ,
        child: Row(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*.092,
              width:  MediaQuery.of(context).size.width*.16,
              child: Center(
                child: Image.asset(assetsPath,scale: 6,),
              ),
              decoration: BoxDecoration(
                  gradient: linearGradient),
            ),
            Container(
              width: MediaQuery.of(context).size.width*.29,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(title,style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1),fontSize: MediaQuery.of(context).size.height*.014,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.005,
                  ),
                  Text(value,style: TextStyle(color: Color.fromRGBO(48, 142, 58, 1),fontSize: MediaQuery.of(context).size.height*.02,fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
