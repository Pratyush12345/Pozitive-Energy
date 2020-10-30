import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;

class PaymentDetailsTab extends StatefulWidget {
  @override
  _PaymentDetailsTabState createState() => _PaymentDetailsTabState();
}

class _PaymentDetailsTabState extends State<PaymentDetailsTab> {
  bool _autovalidation = false;
  TextEditingController accountName = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController sortCode = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController termDays = TextEditingController();
  TextEditingController banklistController = TextEditingController();

  int paymentMethodSelected = 0;

  List banklist=[
    "Bank 1","Bank 2","Bank 3"
  ];
  Widget bankView(){
    return  ListView.builder(shrinkWrap:true,itemCount: banklist.length,itemBuilder: (BuildContext context,int index){
      return Container(
        child: ListTile(
          title: Text(banklist[index],style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: (){
            setState(() {
              banklistController.text=banklist[index];
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03, right: MediaQuery.of(context).size.width * 0.03),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Payment Method",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .105,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .02,
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .016),
                        height: MediaQuery.of(context).size.height * .038,
                        child: Row(
                          children: <Widget>[
                            paymentMethodSelected == 1
                                ? Icon(
                                    Icons.radio_button_checked,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    size: MediaQuery.of(context).size.height * .023,
                                  )
                                : InkWell(
                                    child: Icon(
                                      Icons.radio_button_unchecked,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                      size: MediaQuery.of(context).size.height * .023,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        paymentMethodSelected = 1;
                                      });
                                    },
                                  ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .0015,
                            ),
                            Text(
                              "BACS",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          paymentMethodSelected = 1;
                        });
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .08,
                    ),
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .038,
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .016),
                        child: Row(
                          children: <Widget>[
                            paymentMethodSelected == 2
                                ? Icon(Icons.radio_button_checked, size: MediaQuery.of(context).size.height * .023, color: Color.fromRGBO(155, 119, 217, 1))
                                : InkWell(
                                    child: Icon(Icons.radio_button_unchecked, size: MediaQuery.of(context).size.height * .023, color: Color.fromRGBO(155, 119, 217, 1)),
                                    onTap: () {
                                      setState(() {
                                        paymentMethodSelected = 2;
                                      });
                                    },
                                  ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .0015,
                            ),
                            Text(
                              "Variable Direct Debit",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          paymentMethodSelected = 2;
                        });
                      },
                    ),

                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .02,
                    ),
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .062,
                        child: Row(
                          children: <Widget>[
                            paymentMethodSelected == 3
                                ? Icon(
                                    Icons.radio_button_checked,
                                    size: MediaQuery.of(context).size.height * .023,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                  )
                                : InkWell(
                                    child: Icon(
                                      Icons.radio_button_unchecked,
                                      size: MediaQuery.of(context).size.height * .023,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        paymentMethodSelected = 3;
                                      });
                                    },
                                  ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .0015,
                            ),
                            Text(
                              "Card",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          paymentMethodSelected = 3;
                        });
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .095,
                    ),
                    InkWell(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .062,
                        child: Row(
                          children: <Widget>[
                            paymentMethodSelected == 4
                                ? Icon(
                                    Icons.radio_button_checked,
                                    size: MediaQuery.of(context).size.height * .023,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                  )
                                : InkWell(
                                    child: Icon(
                                      Icons.radio_button_unchecked,
                                      size: MediaQuery.of(context).size.height * .023,
                                      color: Color.fromRGBO(155, 119, 217, 1),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        paymentMethodSelected = 4;
                                      });
                                    },
                                  ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .0015,
                            ),
                            Text(
                              "Fixed Direct Debit",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          paymentMethodSelected = 4;
                        });
                      },
                    ),
                  ]),
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: ThemeApp().textfieldbordercolor, width: 2), borderRadius: BorderRadius.circular(3)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Account Name",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(accountName, false, _autovalidation, TextInputType.text, "Account Name", (value) {
                if (value.isEmpty) {
                  return 'Please enter account name';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Account Number",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(accountNumber, false, _autovalidation, TextInputType.number, "Account Number", (value) {
                if (value.isEmpty) {
                  return 'Please enter account number';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Sort Code",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(sortCode, false, _autovalidation, TextInputType.number, "Sort Code", (value) {
                if (value.isEmpty) {
                  return 'Please enter sort code';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Bank Name",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.062,
                child: dropdowntextfield(banklistController,false,_autovalidation,TextInputType.text,"Select Bank",
                        (value) {
                      if (value.isEmpty) {
                        return 'Please Select Bank';
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
                      Text("Select Bank",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.03),),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.grey.withOpacity(.2),
                      ),

                      Container(
                        child:  bankView(),
                      )

                    ],
                  ),

                ));
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Payment Term Days",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(bankName, false, _autovalidation, TextInputType.number, "Payment Term Days", (value) {
                if (value.isEmpty) {
                  return 'Please enter payment term days';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.062,
                child: Center(
                  child: Text(
                    "Save And Next",
                    style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height * 0.017, fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(color: ThemeApp().purplecolor, borderRadius: BorderRadius.circular(30)),
              ),
              onTap: (){
                globals.tabController1.animateTo(6);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.028,
            ),
          ],
        ),
      ),
    );
  }
}
