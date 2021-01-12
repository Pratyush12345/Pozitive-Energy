import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/askForQuoteModel.dart';
import 'package:pozitive/Core/Model/Api/getPartnerAddQuickLeadModel.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Util/global.dart' as globals;
import 'package:provider/provider.dart';

class PriceElectricity extends StatefulWidget {
  @override
  _PriceElectricityState createState() => _PriceElectricityState();
}

class _PriceElectricityState extends State<PriceElectricity> {
  ThemeApp themeApp = ThemeApp();
  bool _autovalidation = false;

  TextEditingController dayBaseRate = TextEditingController();
  TextEditingController nightBaseRate = TextEditingController();
  TextEditingController eweBaseRate = TextEditingController();
  TextEditingController scBaseRate = TextEditingController();

  TextEditingController dayRequiredBaseRate = TextEditingController();
  TextEditingController nightRequiredBaseRate = TextEditingController();
  TextEditingController eweRequiredBaseRate = TextEditingController();
  TextEditingController scRequiredBaseRate = TextEditingController();

  TextEditingController dayFinalBaseRate = TextEditingController();
  TextEditingController nightFinalBaseRate = TextEditingController();
  TextEditingController eweFinalBaseRate = TextEditingController();
  TextEditingController scFinalBaseRate = TextEditingController();

  TextEditingController dayAffiliateBaseRate = TextEditingController();
  TextEditingController nightAffiliateBaseRate = TextEditingController();
  TextEditingController eweAffiliateBaseRate = TextEditingController();
  TextEditingController scAffiliateBaseRate = TextEditingController();

  TextEditingController supplyCapacity = TextEditingController();
  TextEditingController emrCFD = TextEditingController();
  TextEditingController excessCapacityCharges = TextEditingController();
  TextEditingController reactiveCharge = TextEditingController();

  @override
  void initState() {
    GetPartnerAddQuickLeadQuoteModel getPartnerAddQuickLeadQuoteModel =
        Provider.of<GetPartnerAddQuickLeadQuoteModel>(context, listen: false);
    dayBaseRate.text = getPartnerAddQuickLeadQuoteModel.data.baserateDayUnit1;
    nightBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.baserateNightUnit1;
    eweBaseRate.text = getPartnerAddQuickLeadQuoteModel.data.baserateEWEUnit1;
    scBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.baserateStandingCharge1;
    dayRequiredBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.requiredUpliftEle1Y;
    nightRequiredBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.requiredUpliftEleNight1Y;
    eweRequiredBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.requiredUpliftEle1Y;
    scRequiredBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.requiredUpliftEleSC1Y;
    dayFinalBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.finalDayUnit1F;
    nightFinalBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.finalNightUnit1F;
    eweFinalBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.finalEWEUnit1F;
    scFinalBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.finalStandingCharge1F;
    dayAffiliateBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.affiliateUpliftEle1Y;
    nightAffiliateBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.affiliateUpliftEleNight1Y;
    eweAffiliateBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.affiliateUpliftEleEWE1Y;
    scAffiliateBaseRate.text =
        getPartnerAddQuickLeadQuoteModel.data.affiliateUpliftEleSC1Y;
    supplyCapacity.text =
        getPartnerAddQuickLeadQuoteModel.data.supplyCapacityPerKVA1;
    emrCFD.text = getPartnerAddQuickLeadQuoteModel.data.eMRCFD1;
    excessCapacityCharges.text =
        getPartnerAddQuickLeadQuoteModel.data.exceesCapacityCharegs1;
    reactiveCharge.text =
        getPartnerAddQuickLeadQuoteModel.data.reactiveCharegs1;
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
                        "Day",
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
                        child: innertextfield(dayBaseRate, false,
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
                        "Night",
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
                        child: innertextfield(nightBaseRate, false,
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
                        "EWE",
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
                        child: innertextfield(eweBaseRate, false,
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
                        "SC",
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
                        child: innertextfield(scBaseRate, false,
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
                        "Day",
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
                        child: innertextfield(dayRequiredBaseRate, false,
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
                        "Night",
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
                        child: innertextfield(nightRequiredBaseRate, false,
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
                        "EWE",
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
                        child: innertextfield(eweRequiredBaseRate, false,
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
                        "SC",
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
                        child: innertextfield(scRequiredBaseRate, false,
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
                        "Day",
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
                        child: innertextfield(dayFinalBaseRate, false,
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
                        "Night",
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
                        child: innertextfield(nightFinalBaseRate, false,
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
                        "EWE",
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
                        child: innertextfield(eweFinalBaseRate, false,
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
                        "SC",
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
                        child: innertextfield(scFinalBaseRate, false,
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
            Text("Affiliate Uplist",
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
                        "Day",
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
                        child: innertextfield(dayAffiliateBaseRate, false,
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
                        "Night",
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
                        child: innertextfield(nightAffiliateBaseRate, false,
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
                        "EWE",
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
                        child: innertextfield(eweAffiliateBaseRate, false,
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
                        "SC",
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
                        child: innertextfield(scAffiliateBaseRate, false,
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
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Supply Capacity(kVA):",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .015,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(supplyCapacity, false, _autovalidation,
                  TextInputType.number, "", (value) {
                if (value.isEmpty) {
                  return 'Please enter Postcode';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "EMR CFD(p/Unit):",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .015,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(
                  emrCFD, false, _autovalidation, TextInputType.number, "",
                  (value) {
                if (value.isEmpty) {
                  return 'Please enter Postcode';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Excess capacity charges pence per kVA:",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .015,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(excessCapacityCharges, false,
                  _autovalidation, TextInputType.number, "", (value) {
                if (value.isEmpty) {
                  return 'Please enter Postcode';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Text(
              "Reactive Charge pence per kVArh:",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .015,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(reactiveCharge, false, _autovalidation,
                  TextInputType.number, "", (value) {
                if (value.isEmpty) {
                  return 'Please enter Postcode';
                }
                return null;
              }, context),
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
            Container(
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
                    color: Color.fromRGBO(155, 119, 217, 1),
                    borderRadius: BorderRadius.circular(30)),
              ),
              onTap: () {
                globals.tabController4.animateTo(5);
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
