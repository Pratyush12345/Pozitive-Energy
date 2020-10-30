import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/global.dart' as globals;

class PartnerDetailsTab extends StatefulWidget {
  @override
  _PartnerDetailsTabState createState() => _PartnerDetailsTabState();
}

class _PartnerDetailsTabState extends State<PartnerDetailsTab> {
  bool _autovalidation = false;
  TextEditingController partnerName = TextEditingController();
  TextEditingController electricitySCFixedCommision = TextEditingController();
  TextEditingController electricityDayFixedCommision = TextEditingController();
  TextEditingController electricityNightFixedCommision = TextEditingController();
  TextEditingController electricityEWEFixedCommision = TextEditingController();
  TextEditingController emailForNotification = TextEditingController();
  TextEditingController gasFixedCommision = TextEditingController();
  TextEditingController gasSCFixedCommision = TextEditingController();

  int emailForNotificationSelected = 0;

  bool commissionType = false;

  List notificationlist = ["Notification 1", "Notification 2", "Notification 3"];
  Widget NotificationView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: notificationlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: ListTile(
              title: Text(
                notificationlist[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  emailForNotification.text = notificationlist[index];
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
              "Partner Name",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(partnerName, false, _autovalidation, TextInputType.text, "Partner Name", (value) {
                if (value.isEmpty) {
                  return 'Please enter partner name';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Text(
              "Additional Email for Notifications",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .062,
                child: dropdowntextfield(emailForNotification, false, _autovalidation, TextInputType.text, "Select", (value) {
                  if (value.isEmpty) {
                    return 'Please select notifications';
                  }
                  return null;
                }, context),
              ),
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                showDialog(
                    context: context,
                    child: Dialog(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Text(
                            "Select Notifications",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.03),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
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
            Text(
              "Commission Type",
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
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
                          commissionType
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
                                      commissionType = !commissionType;
                                    });
                                  },
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .005,
                          ),
                          Text(
                            "Fixed Uplift",
                            style: TextStyle(fontSize: MediaQuery.of(context).size.height * .02, color: Color.fromRGBO(0, 0, 0, .8)),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        commissionType = !commissionType;
                      });
                    },
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: ThemeApp().textfieldbordercolor, width: 2), borderRadius: BorderRadius.circular(3)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Electricity Day Fixed Commission(Uplift per Unit)',
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
                    children: <TextSpan>[
                      TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                Text(
                  "(p/KWH)",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(electricityDayFixedCommision, false, _autovalidation, TextInputType.number, "Electricity Day Fixed Commission", (value) {
                if (value.isEmpty) {
                  return 'Please enter electricity day fixed commission';
                }
                return null;
              }, context),
            ),


            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Electricity Night Fixed Commission(Uplift per Unit)',
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
                    children: <TextSpan>[
                      TextSpan(text: '', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                Text(
                  "(p/KWH)",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(electricityNightFixedCommision, false, _autovalidation, TextInputType.number, "Electricity Night Fixed Commission", (value) {
                if (value.isEmpty) {
                  return 'Please enter electricity night fixed commission';
                }
                return null;
              }, context),
            ),


            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Electricity EWE Fixed Commission(Uplift per Unit)',
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
                    children: <TextSpan>[
                      TextSpan(text: '', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                Text(
                  "(p/KWH)",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(electricityEWEFixedCommision, false, _autovalidation, TextInputType.number, "Electricity EWE Fixed Commission", (value) {
                if (value.isEmpty) {
                  return 'Please enter electricity EWE fixed commission';
                }
                return null;
              }, context),
            ),


            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Electricity SC Fixed Commission(Uplift per Day)",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                Text(
                  "(p/Day)",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(electricitySCFixedCommision, false, _autovalidation, TextInputType.number, "SC Fixed Commission", (value) {
                if (value.isEmpty) {
                  return 'Please enter SC fixed commission';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Gas Fixed Commission(Uplift per Unit)',
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
                    children: <TextSpan>[
                      TextSpan(text: ' \*', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
                Text(
                  "(p/KWH)",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(gasFixedCommision, false, _autovalidation, TextInputType.number, "Gas Fixed Commission", (value) {
                if (value.isEmpty) {
                  return 'Please enter gas fixed commission';
                }
                return null;
              }, context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Gas SC Fixed Commission(Uplift per Day)",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
                ),
                Text(
                  "(p/Day)",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height * .015, color: Color.fromRGBO(31, 33, 29, 1)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .062,
              child: innertextfield(gasSCFixedCommision, false, _autovalidation, TextInputType.number, "SC Fixed Commission", (value) {
                if (value.isEmpty) {
                  return 'Please enter SC fixed commission';
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
                globals.tabController2.animateTo(8);
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
