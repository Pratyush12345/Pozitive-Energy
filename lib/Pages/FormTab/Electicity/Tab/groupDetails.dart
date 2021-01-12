import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Widget/bottonfram.dart';
import 'package:pozitive/Util/global.dart' as globals;

import 'package:pozitive/Core/Model/Api/AddProspectModel.dart';
import 'package:pozitive/Core/Services/addProspectApi.dart';
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
                    AddProspectModel electricityAddProspectModel =
                        Provider.of<AddProspectModel>(context, listen: false);
                    var response = AddProspectApi()
                        .addProspectGasGenerateContract(AddProspectModel(
                      accountId: electricityAddProspectModel.accountId,
                      //electricity
                      strStandingCharge:
                          electricityAddProspectModel.strStandingCharge,
                      strDayUnit: electricityAddProspectModel.strDayUnit,
                      strNightUnit: electricityAddProspectModel.strNightUnit,
                      strEWEUnit: electricityAddProspectModel.strEWEUnit,
                      strCapacitycharges:
                          electricityAddProspectModel.strCapacitycharges,
                      strExceesCapacityCharegs:
                          electricityAddProspectModel.strExceesCapacityCharegs,
                      strEMRCFD: electricityAddProspectModel.strEMRCFD,
                      strEnergizationstatus:
                          electricityAddProspectModel.strEnergizationstatus,
                      electricityDayEAC:
                          electricityAddProspectModel.electricityDayEAC,
                      electricityNightEAC:
                          electricityAddProspectModel.electricityNightEAC,
                      electricityEveningEAC:
                          electricityAddProspectModel.electricityEveningEAC,
                      strReactiveCharges:
                          electricityAddProspectModel.strReactiveCharges,
                      strFITcharge: electricityAddProspectModel.strFITcharge,
                      strNewConnection:
                          electricityAddProspectModel.strNewConnection,
                      fullMpan: electricityAddProspectModel.fullMpan,
                      dteElecStartDate:
                          electricityAddProspectModel.dteElecStartDate,

                      //business details
                      businessName: electricityAddProspectModel.businessName,
                      businessType: electricityAddProspectModel.businessType,
                      telNo: electricityAddProspectModel.telNo,
                      email: electricityAddProspectModel.email,
                      strNameOfBill: electricityAddProspectModel.strNameOfBill,
                      strSupplyName: electricityAddProspectModel.strSupplyName,
                      strCompanyRegNo:
                          electricityAddProspectModel.strCompanyRegNo,
                      alternativeNumber:
                          electricityAddProspectModel.alternativeNumber,
                      registeredCompanyName:
                          electricityAddProspectModel.registeredCompanyName,
                      btePaperBill: electricityAddProspectModel.btePaperBill,
                      btemicrobuisnes:
                          electricityAddProspectModel.btemicrobuisnes,
                      strPropertOwnerShip:
                          electricityAddProspectModel.strPropertOwnerShip,
                      strCustomerRefNo:
                          electricityAddProspectModel.strCustomerRefNo,
                      //site address
                      strSiteAddress1:
                          electricityAddProspectModel.strSiteAddress1,
                      strSiteAddress2:
                          electricityAddProspectModel.strSiteAddress2,
                      strSitePostCode:
                          electricityAddProspectModel.strSitePostCode,
                      strSiteTown: electricityAddProspectModel.strSiteTown,
                      //billing address
                      strBillAddress1:
                          electricityAddProspectModel.strBillAddress1,
                      strBillAddress2:
                          electricityAddProspectModel.strBillAddress2,
                      strBillPostCode:
                          electricityAddProspectModel.strBillPostCode,
                      strBillinTermType:
                          electricityAddProspectModel.strBillinTermType,
                      //energyaccountmanager
                      strEAName: electricityAddProspectModel.strEAName,
                      strEAEmail: electricityAddProspectModel.strEAEmail,
                      strEAMobileNo: electricityAddProspectModel.strEAMobileNo,
                      strEAPhoneNo: electricityAddProspectModel.strEAPhoneNo,
                      //payment details
                      strBankACName: electricityAddProspectModel.strBankACName,
                      strBankACNo: electricityAddProspectModel.strBankACNo,
                      strBankSortCode:
                          electricityAddProspectModel.strBankSortCode,
                      strBankName: electricityAddProspectModel.strBankName,
                      intPaymentTermDays:
                          electricityAddProspectModel.intPaymentTermDays,

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
