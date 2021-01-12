import 'package:pozitive/Core/Model/sendable.dart';

class AskForQuoteModel extends Sendable {
  String accountId;
  String fullMPAN;
  String mPRN;
  String quoteid;
  String businessName;
  String postCode;
  String eACDay;
  String eACNight;
  String eACEWE;
  String isforFirstyear;
  String isforSecondyear;
  String isforThirdyear;
  String isforFourthyear;
  String requiredByDate;
  String aQ;
  String preferredStartDate;
  String thirdPartyMOP;
  String thirdPartyDADC;
  String singleRate;
  String image64HHFile;
  String isforFifthyear;
  String isforOtheryear;
  String isStarkDADC;
  String intDADCId;
  String preferredEndDate;
  String preferredEndDate1;
  String preferredEndDate2;

  AskForQuoteModel(
      {this.accountId = "",
      this.fullMPAN = "",
      this.mPRN = "",
      this.quoteid = "0",
      this.businessName = "",
      this.postCode = "",
      this.eACDay = "0",
      this.eACNight = "0",
      this.eACEWE = "0",
      this.isforFirstyear = "",
      this.isforSecondyear = "",
      this.isforThirdyear = "",
      this.isforFourthyear = "",
      this.requiredByDate = "",
      this.aQ = "0",
      this.preferredStartDate = "",
      this.thirdPartyMOP = "false",
      this.thirdPartyDADC = "false",
      this.singleRate = "false",
      this.image64HHFile = "",
      this.isforFifthyear = "false",
      this.isforOtheryear = "false",
      this.isStarkDADC = "false",
      this.intDADCId = "0",
      this.preferredEndDate = "",
      this.preferredEndDate1 = "",
      this.preferredEndDate2 = ""});

  AskForQuoteModel.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    fullMPAN = json['FullMPAN'];
    mPRN = json['MPRN'];
    quoteid = json['Quoteid'];
    businessName = json['BusinessName'];
    postCode = json['PostCode'];
    eACDay = json['EACDay'];
    eACNight = json['EACNight'];
    eACEWE = json['EACEWE'];
    isforFirstyear = json['IsforFirstyear'];
    isforSecondyear = json['IsforSecondyear'];
    isforThirdyear = json['IsforThirdyear'];
    isforFourthyear = json['IsforFourthyear'];
    requiredByDate = json['RequiredByDate'];
    aQ = json['AQ'];
    preferredStartDate = json['PreferredStartDate'];
    thirdPartyMOP = json['ThirdPartyMOP'];
    thirdPartyDADC = json['ThirdPartyDADC'];
    singleRate = json['SingleRate'];
    image64HHFile = json['Image64HHFile'];
    isforFifthyear = json['IsforFifthyear'];
    isforOtheryear = json['IsforOtheryear'];
    isStarkDADC = json['IsStarkDADC'];
    intDADCId = json['intDADCId'];
    preferredEndDate = json['PreferredEndDate'];
    preferredEndDate1 = json['PreferredEndDate1'];
    preferredEndDate2 = json['PreferredEndDate2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['FullMPAN'] = this.fullMPAN;
    data['MPRN'] = this.mPRN;
    data['Quoteid'] = this.quoteid;
    data['BusinessName'] = this.businessName;
    data['PostCode'] = this.postCode;
    data['EACDay'] = this.eACDay;
    data['EACNight'] = this.eACNight;
    data['EACEWE'] = this.eACEWE;
    data['IsforFirstyear'] = this.isforFirstyear;
    data['IsforSecondyear'] = this.isforSecondyear;
    data['IsforThirdyear'] = this.isforThirdyear;
    data['IsforFourthyear'] = this.isforFourthyear;
    data['RequiredByDate'] = this.requiredByDate;
    data['AQ'] = this.aQ;
    data['PreferredStartDate'] = this.preferredStartDate;
    data['ThirdPartyMOP'] = this.thirdPartyMOP;
    data['ThirdPartyDADC'] = this.thirdPartyDADC;
    data['SingleRate'] = this.singleRate;
    data['Image64HHFile'] = this.image64HHFile;
    data['IsforFifthyear'] = this.isforFifthyear;
    data['IsforOtheryear'] = this.isforOtheryear;
    data['IsStarkDADC'] = this.isStarkDADC;
    data['intDADCId'] = this.intDADCId;
    data['PreferredEndDate'] = this.preferredEndDate;
    data['PreferredEndDate1'] = this.preferredEndDate1;
    data['PreferredEndDate2'] = this.preferredEndDate2;
    return data;
  }
}
