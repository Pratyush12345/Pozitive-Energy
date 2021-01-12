import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;

import 'package:pozitive/Core/Model/Api/AddProspectModel.dart';
import 'package:provider/provider.dart';

class BusinessDetailsTab extends StatefulWidget {
  @override
  _BusinessDetailsTabState createState() => _BusinessDetailsTabState();
}

class _BusinessDetailsTabState extends State<BusinessDetailsTab> {
  TextEditingController businessnamecontroller = TextEditingController();
  TextEditingController businessTypeController = TextEditingController();
  TextEditingController landline = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nameOnBill = TextEditingController();
  TextEditingController supplyName = TextEditingController();
  TextEditingController companyRegNo = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController customerRefId = TextEditingController();

  bool _autovalidation = false;
  List businessTypelist = ["Abc", "Edf", "Xyz"];
  int payperbill = 0;
  int microbusiness = 0;
  int propetyOwnership = 0;
  Widget businessTypeView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: businessTypelist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                businessTypelist[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  businessTypeController.text = businessTypelist[index];
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
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'Business Name',
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
              child: innertextfield(
                  businessnamecontroller,
                  false,
                  _autovalidation,
                  TextInputType.text,
                  "Business Name", (value) {
                if (value.isEmpty) {
                  return 'Please enter business name';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            RichText(
              text: TextSpan(
                text: 'Business Type',
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
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .062,
                child: dropdowntextfield(
                    businessTypeController,
                    false,
                    _autovalidation,
                    TextInputType.text,
                    "Select Business Type", (value) {
                  if (value.isEmpty) {
                    return 'Please Select Partner';
                  }
                  return null;
                }, context),
              ),
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Text(
                                "Select Business Type",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: Colors.grey.withOpacity(.2),
                              ),
                              Container(
                                child: businessTypeView(),
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
              "Landline No.",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(landline, false, _autovalidation,
                  TextInputType.number, "Landline No.", (value) {
                if (value.isEmpty) {
                  return 'Please enter Lanline No.';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Email",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfieldEmail(email, false, _autovalidation,
                  TextInputType.emailAddress, "Email Id", (value) {
                if (value.isEmpty) {
                  return 'Please enter Email';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Name On Bill",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(nameOnBill, false, _autovalidation,
                  TextInputType.text, "Name On Bill", (value) {
                if (value.isEmpty) {
                  return 'Please enter Name On Bill';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Supply Name",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(supplyName, false, _autovalidation,
                  TextInputType.text, "Supply Name", (value) {
                if (value.isEmpty) {
                  return 'Please enter Supply Name';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Company Reg. No.",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(companyRegNo, false, _autovalidation,
                  TextInputType.text, "Company Reg. No.", (value) {
                if (value.isEmpty) {
                  return 'Please enter Company Reg. No.';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Mobile No.",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(mobile, false, _autovalidation,
                  TextInputType.number, "Alternative No.", (value) {
                if (value.isEmpty) {
                  return 'Please enter Alternative No.';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Registered Company Name",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(companyName, false, _autovalidation,
                  TextInputType.text, "Registered Company Name", (value) {
                if (value.isEmpty) {
                  return 'Please enter Registered Company Name';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Paper Bill",
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
                          payperbill == 1
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
                                      payperbill = 1;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .0035,
                          ),
                          Text(
                            "Yes",
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
                        payperbill = 1;
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
                          payperbill == 2
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
                                      payperbill = 2;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .0035,
                          ),
                          Text(
                            "No",
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
                        payperbill = 2;
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
            Text(
              "Micro business",
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
                          microbusiness == 1
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
                                      microbusiness = 1;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .0035,
                          ),
                          Text(
                            "Yes",
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
                        microbusiness = 1;
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
                          microbusiness == 2
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
                                      microbusiness = 2;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .0035,
                          ),
                          Text(
                            "No",
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
                        microbusiness = 2;
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
            Text(
              "Property Ownership",
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
                          propetyOwnership == 1
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
                                      propetyOwnership = 1;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .0035,
                          ),
                          Text(
                            "Freehold",
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
                        propetyOwnership = 1;
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
                          propetyOwnership == 2
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
                                      propetyOwnership = 2;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .0035,
                          ),
                          Text(
                            "Lease",
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
                        propetyOwnership = 2;
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
            Text(
              "Customer Ref Id",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(customerRefId, false, _autovalidation,
                  TextInputType.text, "Customer Ref Id", (value) {
                if (value.isEmpty) {
                  return 'Please enter Customer Ref Id';
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
                dualFuelAddProspectModel.businessName =
                    businessnamecontroller.text;
                dualFuelAddProspectModel.businessType =
                    businessTypeController.text;
                dualFuelAddProspectModel.telNo = landline.text;
                dualFuelAddProspectModel.email = email.text;
                dualFuelAddProspectModel.strNameOfBill = nameOnBill.text;
                dualFuelAddProspectModel.strSupplyName = supplyName.text;
                dualFuelAddProspectModel.strCompanyRegNo = companyName.text;
                dualFuelAddProspectModel.alternativeNumber = mobile.text;
                dualFuelAddProspectModel.registeredCompanyName =
                    companyName.text;
                dualFuelAddProspectModel.btePaperBill = payperbill.toString();
                dualFuelAddProspectModel.btemicrobuisnes =
                    microbusiness.toString();
                dualFuelAddProspectModel.strPropertOwnerShip =
                    propetyOwnership.toString();
                dualFuelAddProspectModel.strCustomerRefNo = customerRefId.text;
                globals.tabController2.animateTo(3);
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
