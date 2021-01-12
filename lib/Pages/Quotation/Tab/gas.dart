import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/Model/Api/askForQuoteModel.dart';

import 'package:pozitive/Core/Model/Api/askForQuoteViewButtonModel.dart';
import 'package:pozitive/Core/Model/Api/getPartnerAddQuickLeadModel.dart';

import 'package:pozitive/Core/Services/AskForQuote.dart';
import 'package:pozitive/Core/Services/askForQuoteViewButton.dart';
import 'package:pozitive/Pages/Quatation_Individual/addQuotationIndividuslPage.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/commonWidget/appTextField.dart';
import 'package:provider/provider.dart';

// import 'package:pozitive/Util/global.dart' as globals;

import 'package:http/http.dart' as http;

class Gas extends StatefulWidget {
  @override
  _GasState createState() => _GasState();
}

class _GasState extends State<Gas> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ThemeApp themeApp = ThemeApp();

  TextEditingController mprn = TextEditingController();
  TextEditingController eac = TextEditingController();

  //FocusNode Controlers
  final _mprnnode = FocusNode();
  final _eacnode = FocusNode();

  bool _autovalidation = false;

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
              height: MediaQuery.of(context).size.height * 0.018,
            ),
            AppTextField(
              title: AppString.mPRN,
              controller: mprn,
              textInputType: TextInputType.number,
              hintText: AppString.gasMprn,
              textInputFormatter: [
                new WhitelistingTextInputFormatter(RegExp("[0-9]")),
              ],
              validator: (value) =>
                  AppConstant.stringValidator(value, AppString.gasMprn),
              focusNode: _mprnnode,
              nextFocusNode: _eacnode,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            AppTextField(
              title: AppString.aQ,
              controller: eac,
              textInputType: TextInputType.number,
              hintText: AppString.aQ,
              textInputFormatter: [
                new WhitelistingTextInputFormatter(RegExp("[0-9]")),
              ],
              validator: (value) =>
                  AppConstant.stringValidator(value, AppString.aQ),
              focusNode: _eacnode,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            InkWell(
              onTap: () async {
                AskForQuoteModel askForQuote =
                    Provider.of<AskForQuoteModel>(context, listen: false);
                AskForQuoteViewButtonModel askForQuoteViewButtonModel =
                    Provider.of<AskForQuoteViewButtonModel>(context,
                        listen: false);
                askForQuote.mPRN = mprn.text;
                askForQuote.aQ = eac.text;
                var data = await AskForQuoteApi().askForQuote(
                  AskForQuoteModel(
                    accountId: askForQuote.accountId,
                    fullMPAN: askForQuote.fullMPAN,
                    mPRN: askForQuote.mPRN,
                    quoteid: "0",
                    businessName: askForQuote.businessName,
                    postCode: askForQuote.postCode,
                    eACDay: askForQuote.eACDay,
                    eACNight: askForQuote.eACNight,
                    eACEWE: askForQuote.eACEWE,
                    isforFirstyear: askForQuote.isforFirstyear,
                    isforSecondyear: askForQuote.isforSecondyear,
                    isforThirdyear: askForQuote.isforThirdyear,
                    isforFourthyear: askForQuote.isforFourthyear,
                    requiredByDate: "01/12/2019 17:46",
                    aQ: askForQuote.aQ,
                    preferredStartDate: "01/12/2020",
                    thirdPartyMOP: askForQuote.thirdPartyMOP,
                    thirdPartyDADC: askForQuote.thirdPartyDADC,
                    singleRate: askForQuote.singleRate,
                    image64HHFile: askForQuote.image64HHFile,
                    isforFifthyear: askForQuote.isforFirstyear,
                    isforOtheryear: askForQuote.isforOtheryear,
                    isStarkDADC: askForQuote.isStarkDADC,
                    intDADCId: "0",
                    preferredEndDate: "",
                    preferredEndDate1: "",
                    preferredEndDate2: "",
                  ),
                );
                askForQuoteViewButtonModel.accountId = askForQuote.accountId;
                askForQuoteViewButtonModel.quoteId = data['Quoteid'].toString();
                askForQuoteViewButtonModel.type = "individual";
                var response = await AskForQuoteView().askForQuote(
                    AskForQuoteViewButtonModel(
                        accountId: askForQuote.accountId,
                        type: "individual",
                        quoteId: data["Quoteid"].toString()));
                print("line 112");
                print(data);
                print("line 114");
                print(response);

                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (context) => MultiProvider(
                      providers: [
                        StreamProvider<AskForQuoteModel>(
                          create: (context) => Stream.value(askForQuote),
                        ),
                        StreamProvider<GetPartnerAddQuickLeadQuoteModel>(
                            create: (context) {
                          return Stream.value(
                              GetPartnerAddQuickLeadQuoteModel.fromJson(
                                  response));
                        }),
                      ],
                      child: AddQuotationIndividualPage(),
                    ),
                    //  StreamProvider<AskForQuoteModel>(
                    //  create: (context) => Stream.value(askForQuote),
                    //  child: AddQuotationIndividualPage(),
                    //  ),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.062,
                child: Center(
                  child: Text(
                    "ASK FOR QUOTE",
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
