import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;

class UniqueRefNo extends StatefulWidget {
  @override
  _UniqueRefNoState createState() => _UniqueRefNoState();
}

class _UniqueRefNoState extends State<UniqueRefNo> {

  ThemeApp themeApp=ThemeApp();
  TextEditingController uniqueRefNo= TextEditingController();
  bool _autovalidation=false;
  int contactMode=0;
  int companySelected=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            Text("Unique ref no.",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: themeApp.purplecolor),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(uniqueRefNo,false,_autovalidation,TextInputType.number,"Unique ref no.",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter unique ref no';
                    }
                    return null;
                  },context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            Center(child: Text("Electricity and gas supply contract customer details",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Colors.redAccent),)),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),

            Text("We'd like to keep in touch so we can tell you about other products and services",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height*.062,
              width: MediaQuery.of(context).size.width,
              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height*.062,
                      child: Row(
                        children: <Widget>[
                          contactMode==1?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                            onTap: (){
                              setState(() {
                                contactMode=1;
                              });
                            },),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.02,
                          ),
                          Text("Letter",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                        ],
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        contactMode=1;
                      });
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height*.062,
                      child: Row(
                        children: <Widget>[
                          contactMode==2?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)):InkWell(
                            child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)),
                            onTap: (){
                              setState(() {
                                contactMode=2;
                              });
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.02,
                          ),
                          Text("E-mail",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                        ],
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        contactMode=2;
                      });

                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height*.062,
                      child: Row(
                        children: <Widget>[
                          contactMode==3?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),):InkWell(child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),),
                            onTap: (){
                              setState(() {
                                contactMode=3;
                              });
                            },),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.02,
                          ),
                          Text("Phone",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                        ],
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        contactMode=3;
                      });

                    },
                  ),


                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:Border.all(color: themeApp.textfieldbordercolor,width: 2),
                  borderRadius: BorderRadius.circular(3)
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),

            Text("Company Types",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Container(
//              height: MediaQuery.of(context).size.height*.062,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*.002,bottom: MediaQuery.of(context).size.height*.002 ),
                child: Column(
                  children: <Widget>[
                    Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height*.062,
                            width: MediaQuery.of(context).size.width*.55,
                            child: Row(
                              children: <Widget>[
                                companySelected==1?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                  onTap: (){
                                    setState(() {
                                      companySelected=1;
                                    });
                                  },),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.02,
                                ),
                                Text("Ltd",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              companySelected=1;
                            });
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height*.062,
                            child: Row(
                              children: <Widget>[
                                companySelected==2?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)):InkWell(
                                  child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)),
                                  onTap: (){
                                    setState(() {
                                      companySelected=2;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.02,
                                ),
                                Text("PLC",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              companySelected=2;
                            });

                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),


                      ],
                    ),
                    Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height*.062,
                            width: MediaQuery.of(context).size.width*.55,
                            child: Row(
                              children: <Widget>[
                                companySelected==3?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                  onTap: (){
                                    setState(() {
                                      companySelected=3;
                                    });
                                  },),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.02,
                                ),
                                Text("Charity",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              companySelected=3;
                            });
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height*.062,
                            child: Row(
                              children: <Widget>[
                                companySelected==4?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)):InkWell(
                                  child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)),
                                  onTap: (){
                                    setState(() {
                                      companySelected=4;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.02,
                                ),
                                Text("Public sector",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              companySelected=4;
                            });

                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),


                      ],
                    ),
                    Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height*.062,
                            width: MediaQuery.of(context).size.width*.55,
                            child: Row(
                              children: <Widget>[
                                companySelected==5?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                  onTap: (){
                                    setState(() {
                                      companySelected=5;
                                    });
                                  },),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.02,
                                ),
                                Text("Sole Properietor",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              companySelected=5;
                            });
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height*.062,
                            child: Row(
                              children: <Widget>[
                                companySelected==6?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)):InkWell(
                                  child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)),
                                  onTap: (){
                                    setState(() {
                                      companySelected=6;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.02,
                                ),
                                Text("Partnership",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              companySelected=6;
                            });

                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),


                      ],
                    ),
                    Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height*.062,
                            width: MediaQuery.of(context).size.width*.55,
                            child: Row(
                              children: <Widget>[
                                companySelected==7?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                  onTap: (){
                                    setState(() {
                                      companySelected=7;
                                    });
                                  },),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.02,
                                ),
                                Text("Limited liability partnership",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              companySelected=7;
                            });
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height*.062,
                            child: Row(
                              children: <Widget>[
                                companySelected==8?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)):InkWell(
                                  child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)),
                                  onTap: (){
                                    setState(() {
                                      companySelected=8;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.02,
                                ),
                                Text("LLC",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              companySelected=8;
                            });

                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),


                      ],
                    ),
                    Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height*.062,
                            width: MediaQuery.of(context).size.width*.55,
                            child: Row(
                              children: <Widget>[
                                companySelected==9?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                                  onTap: (){
                                    setState(() {
                                      companySelected=9;
                                    });
                                  },),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.02,
                                ),
                                Text("MicroBusiness",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.02,color: Color.fromRGBO(0, 0, 0, .8)),),
                              ],
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              companySelected=9;
                            });
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:Border.all(color: themeApp.textfieldbordercolor,width: 2),
                  borderRadius: BorderRadius.circular(3)
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.062,
                child: Center(
                  child: Text("Save And Next",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
                      fontWeight: FontWeight.bold),),
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(155, 119, 217, 1),
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
              onTap: (){
                globals.tabController5.animateTo(1);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.028,
            ),
          ],
        ),
      ),
    );
  }
}
