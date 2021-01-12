import 'package:flutter/material.dart';
import 'package:pozitive/Core/Services/addProspectApi.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Widget/bottonfram.dart';
import 'package:pozitive/Util/global.dart' as globals;

import 'package:pozitive/Core/Model/Api/AddProspectModel.dart';
import 'package:provider/provider.dart';

class GroupDetailsTab extends StatefulWidget {
  @override
  _GroupDetailsTabState createState() => _GroupDetailsTabState();
}

class _GroupDetailsTabState extends State<GroupDetailsTab> {
  bool _autovalidation = false;

  int groupNameSelected = 0;

  TextEditingController groupName = TextEditingController();

  List groupNameList = ["Group 1", "Group 2", "Group 3"];
  Widget NotificationView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: groupNameList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                groupNameList[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  groupName.text = groupNameList[index];
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
            Text(
              "Group Name",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .062,
                child: dropdowntextfield(groupName, false, _autovalidation,
                    TextInputType.text, "Select", (value) {
                  if (value.isEmpty) {
                    return 'Please select group name';
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
                                "Select Group Name",
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
                                child: NotificationView(),
                              )
                            ],
                          ),
                        ));
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  child: buttonframewithresizechangefont(
                      context, "Save And Add Another", 0.45),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                ),
                InkWell(
                  child: buttonframewithresizechangefont(
                      context, "Save And View", 0.45),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    AddProspectModel dualFuelAddProspectModel =
                        Provider.of<AddProspectModel>(context, listen: false);
                    var response = AddProspectApi()
                        .addProspectGasGenerateContract(AddProspectModel(
                      accountId: dualFuelAddProspectModel.accountId,
                      //gas
                      fullMprn: dualFuelAddProspectModel.fullMprn,
                      strUnitPriceGas: dualFuelAddProspectModel.strUnitPriceGas,
                      strStandingChargeGas:
                          dualFuelAddProspectModel.strStandingChargeGas,
                      //electricity
                      strStandingCharge:
                          dualFuelAddProspectModel.strStandingCharge,
                      strDayUnit: dualFuelAddProspectModel.strDayUnit,
                      strNightUnit: dualFuelAddProspectModel.strNightUnit,
                      strEWEUnit: dualFuelAddProspectModel.strEWEUnit,
                      strCapacitycharges:
                          dualFuelAddProspectModel.strCapacitycharges,
                      strExceesCapacityCharegs:
                          dualFuelAddProspectModel.strExceesCapacityCharegs,
                      strEMRCFD: dualFuelAddProspectModel.strEMRCFD,
                      strEnergizationstatus:
                          dualFuelAddProspectModel.strEnergizationstatus,
                      electricityDayEAC:
                          dualFuelAddProspectModel.electricityDayEAC,
                      electricityNightEAC:
                          dualFuelAddProspectModel.electricityNightEAC,
                      electricityEveningEAC:
                          dualFuelAddProspectModel.electricityEveningEAC,
                      strReactiveCharges:
                          dualFuelAddProspectModel.strReactiveCharges,
                      strFITcharge: dualFuelAddProspectModel.strFITcharge,
                      strNewConnection:
                          dualFuelAddProspectModel.strNewConnection,
                      fullMpan: dualFuelAddProspectModel.fullMpan,
                      dteElecStartDate:
                          dualFuelAddProspectModel.dteElecStartDate,

                      //business details
                      businessName: dualFuelAddProspectModel.businessName,
                      businessType: dualFuelAddProspectModel.businessType,
                      telNo: dualFuelAddProspectModel.telNo,
                      email: dualFuelAddProspectModel.email,
                      strNameOfBill: dualFuelAddProspectModel.strNameOfBill,
                      strSupplyName: dualFuelAddProspectModel.strSupplyName,
                      strCompanyRegNo: dualFuelAddProspectModel.strCompanyRegNo,
                      alternativeNumber:
                          dualFuelAddProspectModel.alternativeNumber,
                      registeredCompanyName:
                          dualFuelAddProspectModel.registeredCompanyName,
                      btePaperBill: dualFuelAddProspectModel.btePaperBill,
                      btemicrobuisnes: dualFuelAddProspectModel.btemicrobuisnes,
                      strPropertOwnerShip:
                          dualFuelAddProspectModel.strPropertOwnerShip,
                      strCustomerRefNo:
                          dualFuelAddProspectModel.strCustomerRefNo,
                      //site address
                      strSiteAddress1: dualFuelAddProspectModel.strSiteAddress1,
                      strSiteAddress2: dualFuelAddProspectModel.strSiteAddress2,
                      strSitePostCode: dualFuelAddProspectModel.strSitePostCode,
                      strSiteTown: dualFuelAddProspectModel.strSiteTown,
                      //billing address
                      strBillAddress1: dualFuelAddProspectModel.strBillAddress1,
                      strBillAddress2: dualFuelAddProspectModel.strBillAddress2,
                      strBillPostCode: dualFuelAddProspectModel.strBillPostCode,
                      strBillinTermType:
                          dualFuelAddProspectModel.strBillinTermType,
                      //energyaccountmanager
                      strEAName: dualFuelAddProspectModel.strEAName,
                      strEAEmail: dualFuelAddProspectModel.strEAEmail,
                      strEAMobileNo: dualFuelAddProspectModel.strEAMobileNo,
                      strEAPhoneNo: dualFuelAddProspectModel.strEAPhoneNo,
                      //payment details
                      strBankACName: dualFuelAddProspectModel.strBankACName,
                      strBankACNo: dualFuelAddProspectModel.strBankACNo,
                      strBankSortCode: dualFuelAddProspectModel.strBankSortCode,
                      strBankName: dualFuelAddProspectModel.strBankName,
                      intPaymentTermDays:
                          dualFuelAddProspectModel.intPaymentTermDays,

                      //partner details

                      //group details
                      //remaining groupname
                    ));
                  },
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
                  "Save And Generate Contract",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.017,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(30)),
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
