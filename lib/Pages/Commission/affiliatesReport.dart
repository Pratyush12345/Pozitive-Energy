import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/customswitch.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Widget/toastMessage.dart';

class AffiliatesReport extends StatefulWidget {
  @override
  _AffiliatesReportState createState() => _AffiliatesReportState();
}

class _AffiliatesReportState extends State<AffiliatesReport> {

  var key;
  bool isSwitched = false;
  bool _autovalidation = false;
  TextEditingController partnercontroller= TextEditingController();
  ThemeApp themeApp=ThemeApp();
  List requestedlist=[
    {
      "Name":"CO Alliance Managing Agents Ltd",
      "Description":"Affiliate Commissions",
      "ComExcVAT":"27.8500",
      "VAT":"5.5700",
      "ComIncVAT":"33.4200",
      "InvoiceTotal":"33.4200",
      "Business_name":"Mr M F and Mrs H E Way ta Way Fuels",
      "Required By Date":"02/12/2019",
      "Created/Rerequested Date":"02/12/2019 08:20:16",
      "invoice_number":"PZT/2020/02/14_4064",
      "invoice_date":"14/02/2020",
      "invoice_total":"Sales commissions"
    }
  ];
  List viewlist=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 20; i++) {
      setState(() {
        viewlist.add({
          "view":false,
          "click":false,
          "checkbox":false
        });
      });

    }
  }
  List partner=[
    "Abc","Gdgd","Xyz"
  ];

  Widget partnerview(){
    return  ListView.builder(shrinkWrap:true,itemCount: partner.length,itemBuilder: (BuildContext context,int index){
      return Container(
        child: ListTile(
          title: Text(partner[index],style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: (){
            setState(() {
              partnercontroller.text=partner[index];
            });

            Navigator.pop(context);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Affiliates Report",context,key,false,true),
      body: Column(

        children: <Widget>[

          Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.02,right: MediaQuery.of(context).size.width*.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height:MediaQuery.of(context).size.width*.05,
              ),
              Text("Select Affiliate",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
              SizedBox(
                height: MediaQuery.of(context).size.width*0.01,
              ),
              InkWell(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*.062,
                  child: dropdowntextfield(partnercontroller,false,_autovalidation,TextInputType.text,"Select Affiliate",
                          (value) {
                        if (value.isEmpty) {
                          return 'Please Select Affiliate';
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
                        Text("Select Affiliate",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.03),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Colors.grey.withOpacity(.2),
                        ),

                        Container(
                          child:  partnerview(),
                        )

                      ],
                    ),

                  ));
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width*0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width*.46,
                      height: MediaQuery.of(context).size.height*0.062,
                      child: Center(
                        child: Text("Clear",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
                            fontWeight: FontWeight.bold),),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(155, 119, 217, 1),
                          borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                    onTap: (){
                      AppConstant.showComfirmDialogue(mainContext: context,function: (){
                        partnercontroller.text = '';
                      });

                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*.46,
                    height: MediaQuery.of(context).size.height*0.062,
                    child: Center(
                      child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
                          fontWeight: FontWeight.bold),),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(155, 119, 217, 1),
                        borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ],
              ),
            ],
          ),
          ),

          SizedBox(
            height:MediaQuery.of(context).size.width*.07,
          ),

          Expanded(
            child: Padding(
              padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*.02,right: MediaQuery.of(context).size.width*.02),
              child: Column(
                children: <Widget>[
                  Container(
//                  width: MediaQuery.of(context).size.width,
                    color: Color.fromRGBO(18, 122, 69, 1),
                    child: Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.017,bottom:  MediaQuery.of(context).size.height*0.017),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width:MediaQuery.of(context).size.width*.02,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width*.31,
                              child: Text("Invoice Number",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),)
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width*.28,
                              child: Text("Invoice Date",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),)
                          ),

                          Container(
                              width: MediaQuery.of(context).size.width*.30,
                              child: Text("Action   ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),textAlign: TextAlign.center,)
                          ),

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(padding: EdgeInsets.all(0),shrinkWrap: true,itemCount: 20,itemBuilder: (BuildContext context,int index){
                      return Column(
                        children: <Widget>[
                          Container(
//                  width: MediaQuery.of(context).size.width,
                            color: index.isOdd?Colors.white:Color.fromRGBO(237, 243, 231, 1),
                            child: Padding(
                              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01,bottom:  MediaQuery.of(context).size.height*0.01),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width:MediaQuery.of(context).size.width*.02,
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width*.31,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("${requestedlist[0]["invoice_number"]}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),),
                                      )
                                  ),
                                  InkWell(
                                    child: Container(
                                        width: MediaQuery.of(context).size.width*.28,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${requestedlist[0]["invoice_date"]}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),),
                                        )
                                    ),
                                    onTap: (){
//                                      setState(() {
//                                        viewlist[index]["click"]=!viewlist[index]["click"];
//                                      });
                                    },
                                  ),

                                  InkWell(
                                    child: Container(
                                        width: MediaQuery.of(context).size.width*.32,
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset("assets/view.png",scale: 12,),
                                            SizedBox(
                                              width:MediaQuery.of(context).size.width*.02,
                                            ),
                                            Text("View Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,color: themeApp.purplecolor),),
                                          ],
                                        )
                                    ),
                                    onTap: (){
                                      setState(() {
                                        viewlist[index]["click"]=!viewlist[index]["click"];
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          viewlist[index]["click"]?
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(243, 249, 237, 1),
                                border: Border.all(color: Colors.grey.withOpacity(.5))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        child: Text("Name",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,)),
                                        width: MediaQuery.of(context).size.width*0.46,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.03,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width*0.46,
                                          child: Text(requestedlist[0]["Name"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width*0.46,
                                          child: Text("Description",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.03,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width*0.46,
                                          child: Text(requestedlist[0]["Description"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width*0.46,
                                          child: Text("Commission Excl. VAT(£)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.03,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width*0.46,
                                          child: Text(requestedlist[0]["ComExcVAT"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.46,
                                        child: Text("VAT(£)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027)),),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.03,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width*0.46,
                                          child: Text(requestedlist[0]["VAT"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width*0.46,child: Text("Commission Inc. VAT(£)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027,fontWeight: FontWeight.bold))),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.03,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width*0.46,
                                          child: Text(requestedlist[0]["ComIncVAT"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(width: MediaQuery.of(context).size.width*0.46,
                                          child: Text("Invoice Total(£)",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*.03,
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context).size.width*0.46,
                                          child: Text(requestedlist[0]["InvoiceTotal"],style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ):
                          Container()
                        ],
                      );
                    }),
                  )

                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
