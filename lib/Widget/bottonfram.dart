import 'package:flutter/material.dart';
Widget buttonframe(BuildContext context,String title){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height*0.063,
    child: Center(
      child: Text(title,style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.026,
          fontWeight: FontWeight.bold),),
    ),
    decoration: BoxDecoration(
        color: Color.fromRGBO(155, 119, 217, 1),
        borderRadius: BorderRadius.circular(30)
    ),
  );
}
Widget buttonframewithresize(BuildContext context,String title,double resizeWidth){
  return Container(
    width: MediaQuery.of(context).size.width * resizeWidth,
    height: MediaQuery.of(context).size.height*0.063,

    child: Center(
      child: Text(title,style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.026,
          fontWeight: FontWeight.bold),),
    ),
    decoration: BoxDecoration(
        color: Color.fromRGBO(155, 119, 217, 1),
        borderRadius: BorderRadius.circular(30)
    ),
  );
}
Widget buttonframewithresizechangefont(BuildContext context,String title,double resizeWidth){
  return Container(
    width: MediaQuery.of(context).size.width * resizeWidth,
    height: MediaQuery.of(context).size.height*0.063,

    child: Center(
      child: Text(title,style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height * 0.017, fontWeight: FontWeight.bold),),
    ),
    decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30)
    ),
  );
}