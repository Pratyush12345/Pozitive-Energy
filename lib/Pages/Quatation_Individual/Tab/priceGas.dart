import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/generateContractIndivisualModel.dart';
import 'package:pozitive/Core/Services/GenerateContractIndivisual.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Util/global.dart' as globals;

import 'package:pozitive/Core/Model/Api/getPartnerAddQuickLeadModel.dart';
import 'package:provider/provider.dart';

class PriceGas extends StatefulWidget {
  @override
  _PriceGasState createState() => _PriceGasState();
}

class _PriceGasState extends State<PriceGas> {
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;

  TextEditingController standingChargeBaseRate = TextEditingController();
  TextEditingController unitChargeBaseRate = TextEditingController();
  TextEditingController requiredStandingChargeBaseRate =
      TextEditingController();
  TextEditingController requiredUnitChargeBaseRate = TextEditingController();
  TextEditingController finalStandingChargeBaseRate = TextEditingController();
  TextEditingController finalUnitChargeBaseRate = TextEditingController();
  TextEditingController affiliateStandingChargeBaseRate =
      TextEditingController();
  TextEditingController affiliateUnitChargeBaseRate = TextEditingController();

  @override
  void initState() {
    GetPartnerAddQuickLeadQuoteModel getPartnerAddQuickLeadQuoteModel =
        Provider.of<GetPartnerAddQuickLeadQuoteModel>(context, listen: false);
    standingChargeBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.baserateSatandingChargeGas1;
    unitChargeBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.baserateUnitPriceGas1;
    requiredStandingChargeBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.requiredUpliftGasSC1Y;
    requiredUnitChargeBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.requiredUpliftGas1Y;
    affiliateStandingChargeBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.affiliateUpliftGasSC1Y;
    affiliateUnitChargeBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.affiliateUpliftGas1Y;
    finalStandingChargeBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.finalSatandingChargeGas1F;
    finalUnitChargeBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.finalUnitPriceGas1F;
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
            Container(
              height: MediaQuery.of(context).size.height * 0.062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04),
                    child: Text(
                      "Contract",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * .02,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: themeApp.greenappcolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      topRight: Radius.circular(3))),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .47,
                    height: MediaQuery.of(context).size.height * .062,
                    child: Center(
                      child: Text("Start Date : 16/09/2019",
                          style: TextStyle(
                              color: themeApp.greenappcolor,
                              fontSize:
                                  MediaQuery.of(context).size.height * .02,
                              fontWeight: FontWeight.bold)),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              color: themeApp.greenappcolor, width: 2),
                          bottom: BorderSide(
                              color: themeApp.greenappcolor, width: 2),
                          left: BorderSide(
                              color: themeApp.greenappcolor, width: 2)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .47,
                    height: MediaQuery.of(context).size.height * .062,
                    child: Center(
                      child: Text(
                        "Start Date : 16/09/2019",
                        style: TextStyle(
                            color: themeApp.greenappcolor,
                            fontSize: MediaQuery.of(context).size.height * .02,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        right:
                            BorderSide(color: themeApp.greenappcolor, width: 2),
                        bottom:
                            BorderSide(color: themeApp.greenappcolor, width: 2),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.028,
            ),
            Text("Base Rate",
                style: TextStyle(
                    color: themeApp.greenappcolor,
                    fontSize: MediaQuery.of(context).size.height * .02,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.004,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              color: themeApp.greenappcolor,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .46,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Standing Charge",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .46,
                        height: MediaQuery.of(context).size.height * .062,
                        child: innertextfield(standingChargeBaseRate, false,
                            _autovalidation, TextInputType.number, "", (value) {
                          if (value.isEmpty) {
                            return 'Please enter Postcode';
                          }
                          return null;
                        }, context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .46,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Unit Charge",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .46,
                        height: MediaQuery.of(context).size.height * .062,
                        child: innertextfield(unitChargeBaseRate, false,
                            _autovalidation, TextInputType.number, "", (value) {
                          if (value.isEmpty) {
                            return 'Please enter Postcode';
                          }
                          return null;
                        }, context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.028,
            ),
            Text("Required Uplift",
                style: TextStyle(
                    color: themeApp.greenappcolor,
                    fontSize: MediaQuery.of(context).size.height * .02,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.004,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              color: themeApp.greenappcolor,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .46,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Standing Charge",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .46,
                        height: MediaQuery.of(context).size.height * .062,
                        child: innertextfield(
                            requiredStandingChargeBaseRate,
                            false,
                            _autovalidation,
                            TextInputType.number,
                            "", (value) {
                          if (value.isEmpty) {
                            return 'Please enter Postcode';
                          }
                          return null;
                        }, context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .46,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Unit Charge",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .46,
                        height: MediaQuery.of(context).size.height * .062,
                        child: innertextfield(requiredUnitChargeBaseRate, false,
                            _autovalidation, TextInputType.number, "", (value) {
                          if (value.isEmpty) {
                            return 'Please enter Postcode';
                          }
                          return null;
                        }, context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.028,
            ),
            Text("Final Price",
                style: TextStyle(
                    color: themeApp.greenappcolor,
                    fontSize: MediaQuery.of(context).size.height * .02,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.004,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              color: themeApp.greenappcolor,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .46,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Standing Charge",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .46,
                        height: MediaQuery.of(context).size.height * .062,
                        child: innertextfield(
                            finalStandingChargeBaseRate,
                            false,
                            _autovalidation,
                            TextInputType.number,
                            "", (value) {
                          if (value.isEmpty) {
                            return 'Please enter Postcode';
                          }
                          return null;
                        }, context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .46,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Unit Charge",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .46,
                        height: MediaQuery.of(context).size.height * .062,
                        child: innertextfield(finalUnitChargeBaseRate, false,
                            _autovalidation, TextInputType.number, "", (value) {
                          if (value.isEmpty) {
                            return 'Please enter Postcode';
                          }
                          return null;
                        }, context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.028,
            ),
            Text("Affiliate Uplift",
                style: TextStyle(
                    color: themeApp.greenappcolor,
                    fontSize: MediaQuery.of(context).size.height * .02,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.004,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              color: themeApp.greenappcolor,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .46,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Standing Charge",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .46,
                        height: MediaQuery.of(context).size.height * .062,
                        child: innertextfield(
                            affiliateStandingChargeBaseRate,
                            false,
                            _autovalidation,
                            TextInputType.number,
                            "", (value) {
                          if (value.isEmpty) {
                            return 'Please enter Postcode';
                          }
                          return null;
                        }, context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .46,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Unit Charge",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .015,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .46,
                        height: MediaQuery.of(context).size.height * .062,
                        child: innertextfield(
                            affiliateUnitChargeBaseRate,
                            false,
                            _autovalidation,
                            TextInputType.number,
                            "", (value) {
                          if (value.isEmpty) {
                            return 'Please enter Postcode';
                          }
                          return null;
                        }, context),
                      ),
                    ],
                  ),
                ),
              ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .46,
                  height: MediaQuery.of(context).size.height * 0.062,
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.017,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .46,
                  height: MediaQuery.of(context).size.height * 0.062,
                  child: Center(
                    child: Text(
                      "Valid",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.017,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            InkWell(
              onTap: () async {
                GetPartnerAddQuickLeadQuoteModel
                    getPartnerAddQuickLeadQuoteModel =
                    Provider.of<GetPartnerAddQuickLeadQuoteModel>(context,
                        listen: false);
                var data = await GenerateContractIndivisual()
                    .generateContractIndivisual(
                        GenerateContractIndivisualModel.fromJson({
                  "AccountId": getPartnerAddQuickLeadQuoteModel.data.accountId,
                  "Quoteid": getPartnerAddQuickLeadQuoteModel.data.quoteid,
                  "NextPreferredStartDate": getPartnerAddQuickLeadQuoteModel
                      .data.nextPreferredStartDate,
                  "intsubuserID":
                      getPartnerAddQuickLeadQuoteModel.data.intsubuserID,
                  "TermType": getPartnerAddQuickLeadQuoteModel.data.termType,
                  "IntCompanyId":
                      getPartnerAddQuickLeadQuoteModel.data.intCompanyId,
                  "RequiredUpliftEle1Y":
                      getPartnerAddQuickLeadQuoteModel.data.requiredUpliftEle1Y,
                  "RequiredUpliftEleNight1Y": getPartnerAddQuickLeadQuoteModel
                      .data.requiredUpliftEleNight1Y,
                  "RequiredUpliftEleEWE1Y": getPartnerAddQuickLeadQuoteModel
                      .data.requiredUpliftEleEWE1Y,
                  "RequiredUpliftEleSC1Y": getPartnerAddQuickLeadQuoteModel
                      .data.requiredUpliftEleSC1Y,
                  "AffiliateUpliftEle1Y": getPartnerAddQuickLeadQuoteModel
                      .data.affiliateUpliftEle1Y,
                  "AffiliateUpliftEleNight1Y": getPartnerAddQuickLeadQuoteModel
                      .data.affiliateUpliftEleNight1Y,
                  "AffiliateUpliftEleEWE1Y": getPartnerAddQuickLeadQuoteModel
                      .data.affiliateUpliftEleEWE1Y,
                  "AffiliateUpliftEleSC1Y": getPartnerAddQuickLeadQuoteModel
                      .data.affiliateUpliftEleSC1Y,
                  "BaserateDayUnit1":
                      getPartnerAddQuickLeadQuoteModel.data.baserateDayUnit1,
                  "BaserateNightUnit1":
                      getPartnerAddQuickLeadQuoteModel.data.baserateNightUnit1,
                  "RequiredUpliftGasSC1Y": getPartnerAddQuickLeadQuoteModel
                      .data.requiredUpliftGasSC1Y,
                  "AffiliateUpliftGas1Y": getPartnerAddQuickLeadQuoteModel
                      .data.affiliateUpliftGas1Y,
                  "AffiliateUpliftGasSC1Y": getPartnerAddQuickLeadQuoteModel
                      .data.affiliateUpliftGasSC1Y
                }));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.062,
                child: Center(
                  child: Text(
                    "Generate Contract",
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.062,
              child: Center(
                child: Text(
                  "Ask for Requote",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.017,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
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
