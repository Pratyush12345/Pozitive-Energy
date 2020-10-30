import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/Quotation/addAndViewList.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:provider/provider.dart';

class GroupQuotationPage extends StatefulWidget {
  @override
  _GroupQuotationPageState createState() => _GroupQuotationPageState();
}

class _GroupQuotationPageState extends State<GroupQuotationPage> {


  TextEditingController partnercontroller= TextEditingController();
  TextEditingController businessnamecontroller= TextEditingController();
  TextEditingController groupnameController=TextEditingController();
  TextEditingController requirebydatecontroller=TextEditingController();
  TextEditingController preferreddatecontroller=TextEditingController();
  TextEditingController mpancodecontroller=TextEditingController();
  int tpm=0,green=0;
  bool mop=false;
  bool daDc=false;
  bool singlerate=false;
  File _pdffile;
  String path;
  String _path;
  bool _autovalidation=false;
  int termselected=0;
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  Future _selectDate(BuildContext context,String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null){

      if(fromfield=="Required"){
        setState(() {

          requirebydatecontroller.text=dateFormat.format(picked);
        });

      }else{
        setState(() {
          preferreddatecontroller.text=dateFormat.format(picked);
        });
      }

    }

  }


  Widget partnerview(List partners){
    return  ListView.builder(shrinkWrap:true,itemCount: partners.length,itemBuilder: (BuildContext context,int index){
      return Container(
        child: ListTile(
          title: Text(partners[index],style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: (){
            setState(() {
              partnercontroller.text=partners[index];
            });

            Navigator.pop(context);
          },
        ),
      );
    });
  }
  List mpancodelist=[
    "00","11","22"
  ];

  Widget mpancodeview(){
    return  ListView.builder(shrinkWrap:true,itemCount: mpancodelist.length,itemBuilder: (BuildContext context,int index){
      return Container(
        child: ListTile(
          title: Text(mpancodelist[index],style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: (){
            setState(() {
              mpancodecontroller.text=mpancodelist[index];
            });

            Navigator.pop(context);
          },
        ),
      );
    });
  }
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  ThemeApp themeApp=ThemeApp();
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: appbar(AppString.quotation,context,_scaffoldKey,true,true),
      drawer: DrawerWidget(),
      body: Padding(
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            Text(AppString.group,style: TextStyle(color:themeApp.purplecolor,fontSize: MediaQuery.of(context).size.height*.02,fontWeight: FontWeight.bold)),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.004,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Color.fromRGBO(20, 121, 70, 1),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.015,
            ),

            Text(AppString.selectPartner,style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            InkWell(
              child: SizedBox(
                height: MediaQuery.of(context).size.height*.065,
                child: dropdowntextfield(partnercontroller,false,_autovalidation,TextInputType.text,"Select Partner",
                        (value) {
                      if (value.isEmpty) {
                        return 'Please ${AppString.selectPartner}';
                      }
                      return null;
                    },context),
              ),
              onTap: (){
                FocusScope.of(context).requestFocus(FocusNode());
                showDialog(context: context,child:Dialog(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                      Text(AppString.selectPartner,style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.03),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.grey.withOpacity(.2),
                      ),

                      Container(
                        child:  partnerview(['${user.firstName} ${user.lastName}']),
                      )

                    ],
                  ),

                ));
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Text(AppString.businessBasketName,style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.065,
              child: innertextfield(businessnamecontroller,false,_autovalidation,TextInputType.text,"Name",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(AppString.pleaseNoteIndividualConracts,style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: themeApp.greenappcolor),)
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.026,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width*.41,
                  height: 2,
                  color: Color.fromRGBO(155, 155, 155, 1),
                ),
                Text(AppString.or,style: TextStyle(color: themeApp.purplecolor,fontSize: MediaQuery.of(context).size.height*.02,fontWeight: FontWeight.bold),),
                Container(
                  width: MediaQuery.of(context).size.width*.41,
                  height: 2,
                  color: Color.fromRGBO(155, 155, 155, 1),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.013,
            ),

            //////////controller          ///////////

            Text(AppString.groupName,style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.008,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.065,
              child: innertextfield(groupnameController,false,_autovalidation,TextInputType.text,AppString.groupName,
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter ${AppString.groupName}';
                    }
                    return null;
                  },context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.004,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(AppString.pleaseNoteGroupContracts,style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: themeApp.greenappcolor),)
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.005,
            ),

            Text(AppString.terms,style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.008,
            ),
            Container(
              height: MediaQuery.of(context).size.height*.065,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height*.065,
                      child: Row(
                        children: <Widget>[
                          termselected==1?Icon(Icons.check_box,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,):InkWell(child: Icon(Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                            onTap: (){
                              setState(() {
                                termselected=1;
                              });
                            },),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.02,
                          ),
                          Text("1 Year",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.017,color: Color.fromRGBO(0, 0, 0, .5)),),
                        ],
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        termselected=1;
                      });
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height*.065,
                      child: Row(
                        children: <Widget>[
                          termselected==2?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)):InkWell(
                            child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1)),
                            onTap: (){
                              setState(() {
                                termselected=2;
                              });
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.02,
                          ),
                          Text("2 Year",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.017,color: Color.fromRGBO(0, 0, 0, .5)),),
                        ],
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        termselected=2;
                      });

                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height*.065,
                      child: Row(
                        children: <Widget>[
                          termselected==3?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),):InkWell(child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),),
                            onTap: (){
                              setState(() {
                                termselected=3;
                              });
                            },),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.02,
                          ),
                          Text("3 Year",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.017,color: Color.fromRGBO(0, 0, 0, .5)),),
                        ],
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        termselected=3;
                      });

                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height*.065,
                      child: Row(
                        children: <Widget>[
                          termselected==4?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),):InkWell(
                            child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),),
                            onTap: (){
                              setState(() {
                                termselected=4;
                              });
                            },
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.02,
                          ),
                          Text(AppString.other,style: TextStyle(fontSize: MediaQuery.of(context).size.height*.017,color: Color.fromRGBO(0, 0, 0, .5)),),
                        ],
                      ),
                    ),
                    onTap: (){
                      setState(() {
                        termselected=4;
                      });
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.02,
                  ),
                  InkWell(child: Container(
                    height: MediaQuery.of(context).size.height*.065,
                    child: Row(
                      children: <Widget>[
                        termselected==5?Icon(Icons.check_box,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),):InkWell(
                          child: Icon(Icons.check_box_outline_blank,size: MediaQuery.of(context).size.height*.023,color: Color.fromRGBO(155, 119, 217, 1),),
                          onTap: (){
                            setState(() {
                              termselected=5;
                            });
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.02,
                        ),
                        Text(AppString.all,style: TextStyle(fontSize: MediaQuery.of(context).size.height*.017,color: Color.fromRGBO(0, 0, 0, .5)),),
                      ],
                    ),
                  ),
                    onTap: (){
                      setState(() {
                        termselected=5;
                      });

                    },),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.02,
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
              height: MediaQuery.of(context).size.height*0.033,
            ),

            Text(AppString.requiredByDate,style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            InkWell(
              child: SizedBox(
                height: MediaQuery.of(context).size.height*.064,
                child: datetextfield(requirebydatecontroller,false,_autovalidation,TextInputType.text,"Select date",
                        (value) {
                      if (value.isEmpty) {
                        return 'Please Select date';
                      }
                      return null;
                    },context),
              ),
              onTap: (){
                _selectDate(context,"Required");
              },
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Text(AppString.uploadGroupFile,style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height*.065,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height*.042,
                      width: MediaQuery.of(context).size.width*.24,
                      child: Center(
                        child: Text(AppString.chooseFile,style: TextStyle(fontSize: MediaQuery.of(context).size.height*.017,color: Colors.white),),
                      ),
                      decoration: BoxDecoration(
                        color: themeApp.purplecolor,
                          borderRadius: BorderRadius.circular(14),

                      ),
                    ),
                    onTap: ()async{
                      FocusScope.of(context).requestFocus(FocusNode());
                      FilePickerResult result = await FilePicker.platform.pickFiles(
                        type: FileType.any,
                      );
                      path = result.files.first.path;
                      setState(() {
                        _path=path;
                      });
                      _pdffile=File(path);

                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.02,
                  ),
                  _path!=null?Text(_path.substring(_path.lastIndexOf("/") + 1),style: TextStyle(fontSize: MediaQuery.of(context).size.height*.019,color: Color.fromRGBO(0, 0, 0, .8))):Text("No File Chosen",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.019,color: Color.fromRGBO(0, 0, 0, .6)),),


                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:Border.all(color: themeApp.textfieldbordercolor,width: 2),
                  borderRadius: BorderRadius.circular(3)
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.028,
            ),
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height*.065,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.02,
                    ),
                    InkWell(child: Icon(mop?Icons.check_box:Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                      onTap: (){
                        setState(() {
                          mop=!mop;
                        });
                      },),

                    SizedBox(
                      width: MediaQuery.of(context).size.width*.02,
                    ),
                    Text(AppString.customerThirdPartyMopContract,style: TextStyle(fontSize: MediaQuery.of(context).size.height*.019,color: Color.fromRGBO(0, 0, 0, .8)),),


                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:Border.all(color: themeApp.textfieldbordercolor,width: 2),
                    borderRadius: BorderRadius.circular(3)
                ),
              ),
              onTap: (){
              setState(() {
                mop=!mop;
              });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.024,
            ),
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height*.065,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.02,
                    ),
                    InkWell(child: Icon(daDc?Icons.check_box:Icons.check_box_outline_blank,color: Color.fromRGBO(155, 119, 217, 1),size: MediaQuery.of(context).size.height*.023,),
                      onTap: (){
                        setState(() {
                          daDc=!daDc;
                        });
                      },),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.02,
                    ),
                    Text(AppString.customerThirdPartyDADCContract,style: TextStyle(fontSize: MediaQuery.of(context).size.height*.019,color: Color.fromRGBO(0, 0, 0, .8)),),


                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:Border.all(color: themeApp.textfieldbordercolor,width: 2),
                    borderRadius: BorderRadius.circular(3)
                ),
              ),
              onTap: (){
                setState(() {
                  daDc=!daDc;
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.033,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width*.38,
                    height: MediaQuery.of(context).size.height*0.062,
                    child: Center(
                      child: Text(AppString.Cnotes,style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.017,
                          fontWeight: FontWeight.bold),),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(155, 119, 217, 1),
                        borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                  onTap: (){
                    print('click');
                    FocusScope.of(context).requestFocus(FocusNode());
                    showDialog(context: context,child:Dialog(
                      child: AddAndViewNote(),

                    ));
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.52,
                  height: MediaQuery.of(context).size.height*0.062,
                  child: Center(
                    child: Text(AppString.downloadTemplate,style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.017,
                        fontWeight: FontWeight.bold),),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(155, 119, 217, 1),
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),

              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.027,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.062,
              child: Center(
                child: Text(AppString.askForQuote,style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.017,
                    fontWeight: FontWeight.bold),),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(155, 119, 217, 1),
                  borderRadius: BorderRadius.circular(30)
              ),
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
