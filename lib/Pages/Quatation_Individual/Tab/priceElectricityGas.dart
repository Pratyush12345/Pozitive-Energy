import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/askForQuoteModel.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:provider/provider.dart';

import 'package:pozitive/Core/Model/Api/getPartnerAddQuickLeadModel.dart';

class PriceElectricityGas extends StatefulWidget {
  @override
  _PriceElectricityGasState createState() => _PriceElectricityGasState();
}

class _PriceElectricityGasState extends State<PriceElectricityGas> {
  TextEditingController commonElectricityUplift = TextEditingController();
  TextEditingController commonElectricitySCUplift = TextEditingController();
  TextEditingController commonGasUplift = TextEditingController();
  TextEditingController commonGasSCUplift = TextEditingController();
  TextEditingController commonElectricityAfUplift = TextEditingController();
  TextEditingController commonElectricityAfSCUplift = TextEditingController();
  TextEditingController commonGasAfUplift = TextEditingController();
  TextEditingController commonGasAfSCUplift = TextEditingController();
  TextEditingController partnercontroller = TextEditingController();
  bool _autovalidation = false;

  List partner = ["Abc", "Gdgd", "Xyz"];

  Widget partnerview() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: partner.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                partner[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  partnercontroller.text = partner[index];
                });

                Navigator.pop(context);
              },
            ),
          );
        });
  }

  @override
  void initState() {
    GetPartnerAddQuickLeadQuoteModel getPartnerAddQuickLeadQuoteModel =
        Provider.of<GetPartnerAddQuickLeadQuoteModel>(context, listen: false);
    commonElectricityUplift.text =
        getPartnerAddQuickLeadQuoteModel.data.electricityuplift;
    commonElectricitySCUplift.text =
        getPartnerAddQuickLeadQuoteModel.data.electricityStandingChargeuplift;
    commonElectricityAfUplift.text =
        getPartnerAddQuickLeadQuoteModel.data.electricityupliftAffiliate;
    commonElectricityAfSCUplift.text = getPartnerAddQuickLeadQuoteModel
        .data.electricityupliftAffiliateStandingChargeuplift;
    commonGasUplift.text = getPartnerAddQuickLeadQuoteModel.data.gasuplift;
    commonGasSCUplift.text =
        getPartnerAddQuickLeadQuoteModel.data.gasStandingCharge;
    commonGasAfUplift.text =
        getPartnerAddQuickLeadQuoteModel.data.gasupliftAffiliate;
    commonGasAfSCUplift.text =
        getPartnerAddQuickLeadQuoteModel.data.gasupliftAffiliateStandingCharge;
    super.initState();
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
            Text(
              "Common Uplift(Electricity)",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * .062,
                  width: MediaQuery.of(context).size.width * .46,
                  child: innertextfield(commonElectricityUplift, false,
                      _autovalidation, TextInputType.text, "Uplift", (value) {
                    if (value.isEmpty) {
                      return 'Please enter Uplift';
                    }
                    return null;
                  }, context),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .062,
                  width: MediaQuery.of(context).size.width * .46,
                  child: innertextfield(
                      commonElectricitySCUplift,
                      false,
                      _autovalidation,
                      TextInputType.text,
                      "SC Uplift", (value) {
                    if (value.isEmpty) {
                      return 'Please enter Uplift';
                    }
                    return null;
                  }, context),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Common Uplift(Gas)",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * .062,
                  width: MediaQuery.of(context).size.width * .46,
                  child: innertextfield(commonGasUplift, false, _autovalidation,
                      TextInputType.text, "Uplift", (value) {
                    if (value.isEmpty) {
                      return 'Please enter Uplift';
                    }
                    return null;
                  }, context),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .062,
                  width: MediaQuery.of(context).size.width * .46,
                  child: innertextfield(
                      commonGasSCUplift,
                      false,
                      _autovalidation,
                      TextInputType.text,
                      "SC Uplift", (value) {
                    if (value.isEmpty) {
                      return 'Please enter Uplift';
                    }
                    return null;
                  }, context),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Common Uplift(Electricity)(Affiliate)",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * .062,
                  width: MediaQuery.of(context).size.width * .46,
                  child: innertextfield(commonElectricityAfUplift, false,
                      _autovalidation, TextInputType.text, "Uplift", (value) {
                    if (value.isEmpty) {
                      return 'Please enter Uplift';
                    }
                    return null;
                  }, context),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .062,
                  width: MediaQuery.of(context).size.width * .46,
                  child: innertextfield(
                      commonElectricityAfSCUplift,
                      false,
                      _autovalidation,
                      TextInputType.text,
                      "SC Uplift", (value) {
                    if (value.isEmpty) {
                      return 'Please enter Uplift';
                    }
                    return null;
                  }, context),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Common Uplift(Gas)(Affiliate)",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * .062,
                  width: MediaQuery.of(context).size.width * .46,
                  child: innertextfield(commonGasAfUplift, false,
                      _autovalidation, TextInputType.text, "Uplift", (value) {
                    if (value.isEmpty) {
                      return 'Please enter Uplift';
                    }
                    return null;
                  }, context),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .062,
                  width: MediaQuery.of(context).size.width * .46,
                  child: innertextfield(
                      commonGasAfSCUplift,
                      false,
                      _autovalidation,
                      TextInputType.text,
                      "SC Uplift", (value) {
                    if (value.isEmpty) {
                      return 'Please enter Uplift';
                    }
                    return null;
                  }, context),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Affiliate",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .062,
                child: dropdowntextfield(
                    partnercontroller,
                    false,
                    _autovalidation,
                    TextInputType.text,
                    "Select Affiliate", (value) {
                  if (value.isEmpty) {
                    return 'Please Select Affiliate';
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
                                "Select Affiliate",
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
                                child: partnerview(),
                              )
                            ],
                          ),
                        ));
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .46,
                  height: MediaQuery.of(context).size.height * 0.062,
                  child: Center(
                    child: Text(
                      "Export Tender Price",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.017,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(155, 119, 217, 1),
                      borderRadius: BorderRadius.circular(30)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .46,
                  height: MediaQuery.of(context).size.height * 0.062,
                  child: Center(
                    child: Text(
                      "Email Tender Price",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.017,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(155, 119, 217, 1),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ],
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
                        fontSize: MediaQuery.of(context).size.height * 0.019,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(155, 119, 217, 1),
                    borderRadius: BorderRadius.circular(30)),
              ),
              onTap: () {
                globals.tabController4.animateTo(4);
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
