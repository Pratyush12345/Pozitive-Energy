import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;

import 'package:pozitive/Core/Model/Api/AddProspectModel.dart';
import 'package:provider/provider.dart';

class BillingAddressTab extends StatefulWidget {
  @override
  _BillingAddressTabState createState() => _BillingAddressTabState();
}

class _BillingAddressTabState extends State<BillingAddressTab> {
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postcode = TextEditingController();
  bool _autovalidation = false;

  bool sameAddress = false;

  int billingtermType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            //Text("Property Ownership",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Row(
                        children: <Widget>[
                          sameAddress
                              ? Icon(
                                  Icons.check_box,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.check_box_outline_blank,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      sameAddress = !sameAddress;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .02,
                          ),
                          Text(
                            "Same As Site Address",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        sameAddress = !sameAddress;
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: ThemeApp().textfieldbordercolor, width: 2),
                  borderRadius: BorderRadius.circular(3)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'Address 1',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, address1Controller, _autovalidation,
                  TextInputType.text, "Billing Address 1", (value) {
                if (value.isEmpty) {
                  return 'Please enter Site Address 1';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'City',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(cityController, false, _autovalidation,
                  TextInputType.text, "Billing City", (value) {
                if (value.isEmpty) {
                  return 'Please enter City';
                }
                return null;
              }, context),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Address 2",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
//              height: MediaQuery.of(context).size.height*.062,
              child: innerLongtextfield(5, address2Controller, _autovalidation,
                  TextInputType.text, "Billing Address 2", (value) {
                if (value.isEmpty) {
                  return 'Please enter Site Address 2';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),

            //Text("PostCode",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            RichText(
              text: TextSpan(
                text: 'PostCode',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * .015,
                    color: Color.fromRGBO(31, 33, 29, 1)),
                children: <TextSpan>[
                  TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(postcode, false, _autovalidation,
                  TextInputType.number, "Billing Post Code", (value) {
                if (value.isEmpty) {
                  return 'Please enter PostCode';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Billing Term Type",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Row(
                        children: <Widget>[
                          billingtermType == 1
                              ? Icon(
                                  Icons.radio_button_checked,
                                  color: Color.fromRGBO(155, 119, 217, 1),
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                )
                              : InkWell(
                                  child: Icon(
                                    Icons.radio_button_unchecked,
                                    color: Color.fromRGBO(155, 119, 217, 1),
                                    size: MediaQuery.of(context).size.height *
                                        .023,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      billingtermType = 1;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .002,
                          ),
                          Text(
                            "Monthly",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        billingtermType = 1;
                      });
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .02,
                  ),
                  InkWell(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .062,
                      child: Row(
                        children: <Widget>[
                          billingtermType == 2
                              ? Icon(Icons.radio_button_checked,
                                  size:
                                      MediaQuery.of(context).size.height * .023,
                                  color: Color.fromRGBO(155, 119, 217, 1))
                              : InkWell(
                                  child: Icon(Icons.radio_button_unchecked,
                                      size: MediaQuery.of(context).size.height *
                                          .023,
                                      color: Color.fromRGBO(155, 119, 217, 1)),
                                  onTap: () {
                                    setState(() {
                                      billingtermType = 2;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .002,
                          ),
                          Text(
                            "Quarterly",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * .02,
                                color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        billingtermType = 2;
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: ThemeApp().textfieldbordercolor, width: 2),
                  borderRadius: BorderRadius.circular(3)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
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
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.017,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                    color: ThemeApp().purplecolor,
                    borderRadius: BorderRadius.circular(30)),
              ),
              onTap: () {
                AddProspectModel dualFuelAddProspectModel =
                    Provider.of<AddProspectModel>(context, listen: false);
                dualFuelAddProspectModel.strBillAddress1 =
                    address1Controller.text;
                dualFuelAddProspectModel.strBillAddress2 =
                    address2Controller.text;
                dualFuelAddProspectModel.strBillPostCode = postcode.text;
                dualFuelAddProspectModel.strBillinTermType =
                    billingtermType.toString();
                //remaining additions
                //cityaddress
                globals.tabController2.animateTo(5);
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
