import 'package:pozitive/Core/Model/sendable.dart';

class GetPartnerAddQuickLeadQuoteModel extends Sendable {
  String status;
  String msg;
  Data data;
  String error;

  GetPartnerAddQuickLeadQuoteModel(
      {this.status, this.msg, this.data, this.error});

  GetPartnerAddQuickLeadQuoteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['Error'] = this.error;
    return data;
  }
}

class Data {
  String accountId;
  int customerId;
  String fuel;
  String type;
  int quoteid;
  String strStatus;
  int termType;
  bool isSoldByme;
  bool isSoldByOther;
  String quotedDate;
  String isAbleToAddPrice;
  bool lastMsgRead;
  bool showSendEsign;
  String hHSampleFileAttachment;
  int intQuotePriceId1;
  int intQuotePriceId2;
  int intQuotePriceId3;
  int intQuotePriceId4;
  int intQuotePriceId5;
  int intQuotePriceIdO;
  bool isHHCustomer;
  String renewalLink;
  String renewalErrorMsg;
  String priceAlertMsg;
  int intCompanyId;
  int intCompanyUserId;
  String emailId;
  String cRN;
  String phoneNo;
  String qouteNotes;
  String flagFrom;
  int intsubuserID;
  String businessName;
  String postCode;
  bool isforFirstyear;
  bool isforSecondyear;
  bool isforThirdyear;
  bool isforFourthyear;
  bool isforFifthyear;
  bool isforOtheryear;
  String requiredByDate;
  String preferredStartDate;
  String nextPreferredStartDate;
  String preferredEndDate;
  String preferredEndDate1;
  String preferredEndDate2;
  bool thirdPartyMOP;
  bool thirdPartyDADC;
  bool isStarkDADC;
  String intDADCId;
  bool singleRate;
  String mPAN;
  String fullMPAN;
  String mPAN1;
  String mPAN2;
  String mPAN3;
  String mPAN4;
  String mPAN5;
  String mPAN6;
  String mPAN7;
  String eACDay;
  String eACNight;
  String eACEWE;
  String image64HHFile;
  String manualEleStatus;
  String mPRN;
  String aQ;
  String manualGasStatus;
  String electricityuplift;
  String electricityStandingChargeuplift;
  String electricityupliftAffiliate;
  String electricityupliftAffiliateStandingChargeuplift;
  String gasuplift;
  String gasStandingCharge;
  String gasupliftAffiliate;
  String gasupliftAffiliateStandingCharge;
  List<AffiliateSubUserList> affiliateSubUserList;
  int intAffiliateSubUserId;
  String contractstartdate;
  String contractenddate1;
  String baserateDayUnit1;
  String baserateNightUnit1;
  String baserateEWEUnit1;
  String baserateStandingCharge1;
  String requiredUpliftEle1Y;
  String requiredUpliftEleNight1Y;
  String requiredUpliftEleEWE1Y;
  String requiredUpliftEleSC1Y;
  String affiliateUpliftEle1Y;
  String affiliateUpliftEleNight1Y;
  String affiliateUpliftEleEWE1Y;
  String affiliateUpliftEleSC1Y;
  String finalDayUnit1F;
  String finalNightUnit1F;
  String finalEWEUnit1F;
  String finalStandingCharge1F;
  String supplyCapacity1;
  String supplyCapacityPerKVA1;
  String eMRCFD1;
  String exceesCapacityCharegs1;
  String reactiveCharegs1;
  int hasEle1YWPriceChanged;
  String contractenddate2;
  String baserateDayUnit2;
  String baserateNightUnit2;
  String baserateEWEUnit2;
  String baserateStandingCharge2;
  String requiredUpliftEle2Y;
  String requiredUpliftEleNight2Y;
  String requiredUpliftEleEWE2Y;
  String requiredUpliftEleSC2Y;
  String affiliateUpliftEle2Y;
  String affiliateUpliftEleNight2Y;
  String affiliateUpliftEleEWE2Y;
  String affiliateUpliftEleSC2Y;
  String finalDayUnit2F;
  String finalNightUnit2F;
  String finalEWEUnit2F;
  String finalStandingCharge2F;
  String supplyCapacity2;
  String supplyCapacityPerKVA2;
  String eMRCFD2;
  String exceesCapacityCharegs2;
  String reactiveCharegs2;
  int hasEle2YWPriceChanged;
  String contractenddate3;
  String baserateDayUnit3;
  String baserateNightUnit3;
  String baserateEWEUnit3;
  String baserateStandingCharge3;
  String requiredUpliftEle3Y;
  String requiredUpliftEleNight3Y;
  String requiredUpliftEleEWE3Y;
  String requiredUpliftEleSC3Y;
  String affiliateUpliftEle3Y;
  String affiliateUpliftEleNight3Y;
  String affiliateUpliftEleEWE3Y;
  String affiliateUpliftEleSC3Y;
  String finalDayUnit3F;
  String finalNightUnit3F;
  String finalEWEUnit3F;
  String finalStandingCharge3F;
  String supplyCapacity3;
  String supplyCapacityPerKVA3;
  String eMRCFD3;
  String exceesCapacityCharegs3;
  String reactiveCharegs3;
  int hasEle3YWPriceChanged;
  String contractenddate4;
  String baserateDayUnit4;
  String baserateNightUnit4;
  String baserateEWEUnit4;
  String baserateStandingCharge4;
  String requiredUpliftEle4Y;
  String requiredUpliftEleNight4Y;
  String requiredUpliftEleEWE4Y;
  String requiredUpliftEleSC4Y;
  String affiliateUpliftEle4Y;
  String affiliateUpliftEleNight4Y;
  String affiliateUpliftEleEWE4Y;
  String affiliateUpliftEleSC4Y;
  String finalDayUnit4F;
  String finalNightUnit4F;
  String finalEWEUnit4F;
  String finalStandingCharge4F;
  String supplyCapacity4;
  String supplyCapacityPerKVA4;
  String eMRCFD4;
  String exceesCapacityCharegs4;
  String reactiveCharegs4;
  int hasEle4YWPriceChanged;
  String contractenddate5;
  String baserateDayUnit5;
  String baserateNightUnit5;
  String baserateEWEUnit5;
  String baserateStandingCharge5;
  String requiredUpliftEle5Y;
  String requiredUpliftEleNight5Y;
  String requiredUpliftEleEWE5Y;
  String requiredUpliftEleSC5Y;
  String affiliateUpliftEle5Y;
  String affiliateUpliftEleNight5Y;
  String affiliateUpliftEleEWE5Y;
  String affiliateUpliftEleSC5Y;
  String finalDayUnit5F;
  String finalNightUnit5F;
  String finalEWEUnit5F;
  String finalStandingCharge5F;
  String supplyCapacity5;
  String supplyCapacityPerKVA5;
  String eMRCFD5;
  String exceesCapacityCharegs5;
  String reactiveCharegs5;
  int hasEle5YWPriceChanged;
  String contractenddateO;
  String baserateDayUnitO;
  String baserateNightUnitO;
  String baserateEWEUnitO;
  String baserateStandingChargeO;
  String requiredUpliftEleOY;
  String requiredUpliftEleNightOY;
  String requiredUpliftEleEWEOY;
  String requiredUpliftEleSCOY;
  String affiliateUpliftEleOY;
  String affiliateUpliftEleNightOY;
  String affiliateUpliftEleEWEOY;
  String affiliateUpliftEleSCOY;
  String finalDayUnitOF;
  String finalNightUnitOF;
  String finalEWEUnitOF;
  String finalStandingChargeOF;
  String supplyCapacityO;
  String supplyCapacityPerKVAO;
  String eMRCFDO;
  String exceesCapacityCharegsO;
  String reactiveCharegsO;
  int hasEleOYWPriceChanged;
  String contractenddategas1;
  String baserateSatandingChargeGas1;
  String baserateUnitPriceGas1;
  String requiredUpliftGasSC1Y;
  String requiredUpliftGas1Y;
  String affiliateUpliftGasSC1Y;
  String affiliateUpliftGas1Y;
  String finalSatandingChargeGas1F;
  String finalUnitPriceGas1F;
  int hasGas1YWPriceChanged;
  String contractenddategas2;
  String baserateSatandingChargeGas2;
  String baserateUnitPriceGas2;
  String requiredUpliftGasSC2Y;
  String requiredUpliftGas2Y;
  String affiliateUpliftGasSC2Y;
  String affiliateUpliftGas2Y;
  String finalSatandingChargeGas2F;
  String finalUnitPriceGas2F;
  int hasGas2YWPriceChanged;
  String contractenddategas3;
  String baserateSatandingChargeGas3;
  String baserateUnitPriceGas3;
  String requiredUpliftGasSC3Y;
  String requiredUpliftGas3Y;
  String affiliateUpliftGasSC3Y;
  String affiliateUpliftGas3Y;
  String finalSatandingChargeGas3F;
  String finalUnitPriceGas3F;
  int hasGas3YWPriceChanged;
  String contractenddategas4;
  String baserateSatandingChargeGas4;
  String baserateUnitPriceGas4;
  String requiredUpliftGasSC4Y;
  String requiredUpliftGas4Y;
  String affiliateUpliftGasSC4Y;
  String affiliateUpliftGas4Y;
  String finalSatandingChargeGas4F;
  String finalUnitPriceGas4F;
  int hasGas4YWPriceChanged;
  String contractenddategas5;
  String baserateSatandingChargeGas5;
  String baserateUnitPriceGas5;
  String requiredUpliftGasSC5Y;
  String requiredUpliftGas5Y;
  String affiliateUpliftGasSC5Y;
  String affiliateUpliftGas5Y;
  String finalSatandingChargeGas5F;
  String finalUnitPriceGas5F;
  int hasGas5YWPriceChanged;
  String contractenddategasO;
  String baserateSatandingChargeGasO;
  String baserateUnitPriceGasO;
  String requiredUpliftGasSCOY;
  String requiredUpliftGasOY;
  String affiliateUpliftGasSCOY;
  String affiliateUpliftGasOY;
  String finalSatandingChargeGasOF;
  String finalUnitPriceGasOF;
  int hasGasOYWPriceChanged;

  Data(
      {this.accountId,
      this.customerId,
      this.fuel,
      this.type,
      this.quoteid,
      this.strStatus,
      this.termType,
      this.isSoldByme,
      this.isSoldByOther,
      this.quotedDate,
      this.isAbleToAddPrice,
      this.lastMsgRead,
      this.showSendEsign,
      this.hHSampleFileAttachment,
      this.intQuotePriceId1,
      this.intQuotePriceId2,
      this.intQuotePriceId3,
      this.intQuotePriceId4,
      this.intQuotePriceId5,
      this.intQuotePriceIdO,
      this.isHHCustomer,
      this.renewalLink,
      this.renewalErrorMsg,
      this.priceAlertMsg,
      this.intCompanyId,
      this.intCompanyUserId,
      this.emailId,
      this.cRN,
      this.phoneNo,
      this.qouteNotes,
      this.flagFrom,
      this.intsubuserID,
      this.businessName,
      this.postCode,
      this.isforFirstyear,
      this.isforSecondyear,
      this.isforThirdyear,
      this.isforFourthyear,
      this.isforFifthyear,
      this.isforOtheryear,
      this.requiredByDate,
      this.preferredStartDate,
      this.nextPreferredStartDate,
      this.preferredEndDate,
      this.preferredEndDate1,
      this.preferredEndDate2,
      this.thirdPartyMOP,
      this.thirdPartyDADC,
      this.isStarkDADC,
      this.intDADCId,
      this.singleRate,
      this.mPAN,
      this.fullMPAN,
      this.mPAN1,
      this.mPAN2,
      this.mPAN3,
      this.mPAN4,
      this.mPAN5,
      this.mPAN6,
      this.mPAN7,
      this.eACDay,
      this.eACNight,
      this.eACEWE,
      this.image64HHFile,
      this.manualEleStatus,
      this.mPRN,
      this.aQ,
      this.manualGasStatus,
      this.electricityuplift,
      this.electricityStandingChargeuplift,
      this.electricityupliftAffiliate,
      this.electricityupliftAffiliateStandingChargeuplift,
      this.gasuplift,
      this.gasStandingCharge,
      this.gasupliftAffiliate,
      this.gasupliftAffiliateStandingCharge,
      this.affiliateSubUserList,
      this.intAffiliateSubUserId,
      this.contractstartdate,
      this.contractenddate1,
      this.baserateDayUnit1,
      this.baserateNightUnit1,
      this.baserateEWEUnit1,
      this.baserateStandingCharge1,
      this.requiredUpliftEle1Y,
      this.requiredUpliftEleNight1Y,
      this.requiredUpliftEleEWE1Y,
      this.requiredUpliftEleSC1Y,
      this.affiliateUpliftEle1Y,
      this.affiliateUpliftEleNight1Y,
      this.affiliateUpliftEleEWE1Y,
      this.affiliateUpliftEleSC1Y,
      this.finalDayUnit1F,
      this.finalNightUnit1F,
      this.finalEWEUnit1F,
      this.finalStandingCharge1F,
      this.supplyCapacity1,
      this.supplyCapacityPerKVA1,
      this.eMRCFD1,
      this.exceesCapacityCharegs1,
      this.reactiveCharegs1,
      this.hasEle1YWPriceChanged,
      this.contractenddate2,
      this.baserateDayUnit2,
      this.baserateNightUnit2,
      this.baserateEWEUnit2,
      this.baserateStandingCharge2,
      this.requiredUpliftEle2Y,
      this.requiredUpliftEleNight2Y,
      this.requiredUpliftEleEWE2Y,
      this.requiredUpliftEleSC2Y,
      this.affiliateUpliftEle2Y,
      this.affiliateUpliftEleNight2Y,
      this.affiliateUpliftEleEWE2Y,
      this.affiliateUpliftEleSC2Y,
      this.finalDayUnit2F,
      this.finalNightUnit2F,
      this.finalEWEUnit2F,
      this.finalStandingCharge2F,
      this.supplyCapacity2,
      this.supplyCapacityPerKVA2,
      this.eMRCFD2,
      this.exceesCapacityCharegs2,
      this.reactiveCharegs2,
      this.hasEle2YWPriceChanged,
      this.contractenddate3,
      this.baserateDayUnit3,
      this.baserateNightUnit3,
      this.baserateEWEUnit3,
      this.baserateStandingCharge3,
      this.requiredUpliftEle3Y,
      this.requiredUpliftEleNight3Y,
      this.requiredUpliftEleEWE3Y,
      this.requiredUpliftEleSC3Y,
      this.affiliateUpliftEle3Y,
      this.affiliateUpliftEleNight3Y,
      this.affiliateUpliftEleEWE3Y,
      this.affiliateUpliftEleSC3Y,
      this.finalDayUnit3F,
      this.finalNightUnit3F,
      this.finalEWEUnit3F,
      this.finalStandingCharge3F,
      this.supplyCapacity3,
      this.supplyCapacityPerKVA3,
      this.eMRCFD3,
      this.exceesCapacityCharegs3,
      this.reactiveCharegs3,
      this.hasEle3YWPriceChanged,
      this.contractenddate4,
      this.baserateDayUnit4,
      this.baserateNightUnit4,
      this.baserateEWEUnit4,
      this.baserateStandingCharge4,
      this.requiredUpliftEle4Y,
      this.requiredUpliftEleNight4Y,
      this.requiredUpliftEleEWE4Y,
      this.requiredUpliftEleSC4Y,
      this.affiliateUpliftEle4Y,
      this.affiliateUpliftEleNight4Y,
      this.affiliateUpliftEleEWE4Y,
      this.affiliateUpliftEleSC4Y,
      this.finalDayUnit4F,
      this.finalNightUnit4F,
      this.finalEWEUnit4F,
      this.finalStandingCharge4F,
      this.supplyCapacity4,
      this.supplyCapacityPerKVA4,
      this.eMRCFD4,
      this.exceesCapacityCharegs4,
      this.reactiveCharegs4,
      this.hasEle4YWPriceChanged,
      this.contractenddate5,
      this.baserateDayUnit5,
      this.baserateNightUnit5,
      this.baserateEWEUnit5,
      this.baserateStandingCharge5,
      this.requiredUpliftEle5Y,
      this.requiredUpliftEleNight5Y,
      this.requiredUpliftEleEWE5Y,
      this.requiredUpliftEleSC5Y,
      this.affiliateUpliftEle5Y,
      this.affiliateUpliftEleNight5Y,
      this.affiliateUpliftEleEWE5Y,
      this.affiliateUpliftEleSC5Y,
      this.finalDayUnit5F,
      this.finalNightUnit5F,
      this.finalEWEUnit5F,
      this.finalStandingCharge5F,
      this.supplyCapacity5,
      this.supplyCapacityPerKVA5,
      this.eMRCFD5,
      this.exceesCapacityCharegs5,
      this.reactiveCharegs5,
      this.hasEle5YWPriceChanged,
      this.contractenddateO,
      this.baserateDayUnitO,
      this.baserateNightUnitO,
      this.baserateEWEUnitO,
      this.baserateStandingChargeO,
      this.requiredUpliftEleOY,
      this.requiredUpliftEleNightOY,
      this.requiredUpliftEleEWEOY,
      this.requiredUpliftEleSCOY,
      this.affiliateUpliftEleOY,
      this.affiliateUpliftEleNightOY,
      this.affiliateUpliftEleEWEOY,
      this.affiliateUpliftEleSCOY,
      this.finalDayUnitOF,
      this.finalNightUnitOF,
      this.finalEWEUnitOF,
      this.finalStandingChargeOF,
      this.supplyCapacityO,
      this.supplyCapacityPerKVAO,
      this.eMRCFDO,
      this.exceesCapacityCharegsO,
      this.reactiveCharegsO,
      this.hasEleOYWPriceChanged,
      this.contractenddategas1,
      this.baserateSatandingChargeGas1,
      this.baserateUnitPriceGas1,
      this.requiredUpliftGasSC1Y,
      this.requiredUpliftGas1Y,
      this.affiliateUpliftGasSC1Y,
      this.affiliateUpliftGas1Y,
      this.finalSatandingChargeGas1F,
      this.finalUnitPriceGas1F,
      this.hasGas1YWPriceChanged,
      this.contractenddategas2,
      this.baserateSatandingChargeGas2,
      this.baserateUnitPriceGas2,
      this.requiredUpliftGasSC2Y,
      this.requiredUpliftGas2Y,
      this.affiliateUpliftGasSC2Y,
      this.affiliateUpliftGas2Y,
      this.finalSatandingChargeGas2F,
      this.finalUnitPriceGas2F,
      this.hasGas2YWPriceChanged,
      this.contractenddategas3,
      this.baserateSatandingChargeGas3,
      this.baserateUnitPriceGas3,
      this.requiredUpliftGasSC3Y,
      this.requiredUpliftGas3Y,
      this.affiliateUpliftGasSC3Y,
      this.affiliateUpliftGas3Y,
      this.finalSatandingChargeGas3F,
      this.finalUnitPriceGas3F,
      this.hasGas3YWPriceChanged,
      this.contractenddategas4,
      this.baserateSatandingChargeGas4,
      this.baserateUnitPriceGas4,
      this.requiredUpliftGasSC4Y,
      this.requiredUpliftGas4Y,
      this.affiliateUpliftGasSC4Y,
      this.affiliateUpliftGas4Y,
      this.finalSatandingChargeGas4F,
      this.finalUnitPriceGas4F,
      this.hasGas4YWPriceChanged,
      this.contractenddategas5,
      this.baserateSatandingChargeGas5,
      this.baserateUnitPriceGas5,
      this.requiredUpliftGasSC5Y,
      this.requiredUpliftGas5Y,
      this.affiliateUpliftGasSC5Y,
      this.affiliateUpliftGas5Y,
      this.finalSatandingChargeGas5F,
      this.finalUnitPriceGas5F,
      this.hasGas5YWPriceChanged,
      this.contractenddategasO,
      this.baserateSatandingChargeGasO,
      this.baserateUnitPriceGasO,
      this.requiredUpliftGasSCOY,
      this.requiredUpliftGasOY,
      this.affiliateUpliftGasSCOY,
      this.affiliateUpliftGasOY,
      this.finalSatandingChargeGasOF,
      this.finalUnitPriceGasOF,
      this.hasGasOYWPriceChanged});

  Data.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    customerId = json['CustomerId'];
    fuel = json['Fuel'];
    type = json['Type'];
    quoteid = json['Quoteid'];
    strStatus = json['strStatus'];
    termType = json['TermType'];
    isSoldByme = json['IsSoldByme'];
    isSoldByOther = json['IsSoldByOther'];
    quotedDate = json['QuotedDate'];
    isAbleToAddPrice = json['IsAbleToAddPrice'];
    lastMsgRead = json['LastMsgRead'];
    showSendEsign = json['ShowSendEsign'];
    hHSampleFileAttachment = json['HHSampleFileAttachment'];
    intQuotePriceId1 = json['intQuotePriceId1'];
    intQuotePriceId2 = json['intQuotePriceId2'];
    intQuotePriceId3 = json['intQuotePriceId3'];
    intQuotePriceId4 = json['intQuotePriceId4'];
    intQuotePriceId5 = json['intQuotePriceId5'];
    intQuotePriceIdO = json['intQuotePriceIdO'];
    isHHCustomer = json['isHHCustomer'];
    renewalLink = json['RenewalLink'];
    renewalErrorMsg = json['RenewalErrorMsg'];
    priceAlertMsg = json['PriceAlertMsg'];
    intCompanyId = json['IntCompanyId'];
    intCompanyUserId = json['IntCompanyUserId'];
    emailId = json['EmailId'];
    cRN = json['CRN'];
    phoneNo = json['PhoneNo'];
    qouteNotes = json['QouteNotes'];
    flagFrom = json['FlagFrom'];
    intsubuserID = json['intsubuserID'];
    businessName = json['BusinessName'];
    postCode = json['PostCode'];
    isforFirstyear = json['IsforFirstyear'];
    isforSecondyear = json['IsforSecondyear'];
    isforThirdyear = json['IsforThirdyear'];
    isforFourthyear = json['IsforFourthyear'];
    isforFifthyear = json['IsforFifthyear'];
    isforOtheryear = json['IsforOtheryear'];
    requiredByDate = json['RequiredByDate'];
    preferredStartDate = json['PreferredStartDate'];
    nextPreferredStartDate = json['NextPreferredStartDate'];
    preferredEndDate = json['PreferredEndDate'];
    preferredEndDate1 = json['PreferredEndDate1'];
    preferredEndDate2 = json['PreferredEndDate2'];
    thirdPartyMOP = json['ThirdPartyMOP'];
    thirdPartyDADC = json['ThirdPartyDADC'];
    isStarkDADC = json['IsStarkDADC'];
    intDADCId = json['intDADCId'].toString();
    singleRate = json['SingleRate'];
    mPAN = json['MPAN'];
    fullMPAN = json['FullMPAN'];
    mPAN1 = json['MPAN1'];
    mPAN2 = json['MPAN2'];
    mPAN3 = json['MPAN3'];
    mPAN4 = json['MPAN4'];
    mPAN5 = json['MPAN5'];
    mPAN6 = json['MPAN6'];
    mPAN7 = json['MPAN7'];
    eACDay = json['EACDay'];
    eACNight = json['EACNight'];
    eACEWE = json['EACEWE'];
    image64HHFile = json['Image64HHFile'];
    manualEleStatus = json['ManualEleStatus'];
    mPRN = json['MPRN'];
    aQ = json['AQ'];
    manualGasStatus = json['ManualGasStatus'];
    electricityuplift = json['Electricityuplift'];
    electricityStandingChargeuplift = json['ElectricityStandingChargeuplift'];
    electricityupliftAffiliate = json['ElectricityupliftAffiliate'];
    electricityupliftAffiliateStandingChargeuplift =
        json['ElectricityupliftAffiliateStandingChargeuplift'];
    gasuplift = json['Gasuplift'];
    gasStandingCharge = json['GasStandingCharge'];
    gasupliftAffiliate = json['GasupliftAffiliate'];
    gasupliftAffiliateStandingCharge = json['GasupliftAffiliateStandingCharge'];
    if (json['AffiliateSubUserList'] != null) {
      affiliateSubUserList = new List<AffiliateSubUserList>();
      json['AffiliateSubUserList'].forEach((v) {
        affiliateSubUserList.add(new AffiliateSubUserList.fromJson(v));
      });
    }
    intAffiliateSubUserId = json['IntAffiliateSubUserId'];
    contractstartdate = json['Contractstartdate'];
    contractenddate1 = json['Contractenddate1'];
    baserateDayUnit1 = json['BaserateDayUnit1'];
    baserateNightUnit1 = json['BaserateNightUnit1'];
    baserateEWEUnit1 = json['BaserateEWEUnit1'];
    baserateStandingCharge1 = json['BaserateStandingCharge1'];
    requiredUpliftEle1Y = json['RequiredUpliftEle1Y'];
    requiredUpliftEleNight1Y = json['RequiredUpliftEleNight1Y'];
    requiredUpliftEleEWE1Y = json['RequiredUpliftEleEWE1Y'];
    requiredUpliftEleSC1Y = json['RequiredUpliftEleSC1Y'];
    affiliateUpliftEle1Y = json['AffiliateUpliftEle1Y'];
    affiliateUpliftEleNight1Y = json['AffiliateUpliftEleNight1Y'];
    affiliateUpliftEleEWE1Y = json['AffiliateUpliftEleEWE1Y'];
    affiliateUpliftEleSC1Y = json['AffiliateUpliftEleSC1Y'];
    finalDayUnit1F = json['FinalDayUnit1F'];
    finalNightUnit1F = json['FinalNightUnit1F'];
    finalEWEUnit1F = json['FinalEWEUnit1F'];
    finalStandingCharge1F = json['FinalStandingCharge1F'];
    supplyCapacity1 = json['SupplyCapacity1'];
    supplyCapacityPerKVA1 = json['SupplyCapacityPerKVA1'];
    eMRCFD1 = json['EMRCFD1'];
    exceesCapacityCharegs1 = json['ExceesCapacityCharegs1'];
    reactiveCharegs1 = json['ReactiveCharegs1'];
    hasEle1YWPriceChanged = json['HasEle1YWPriceChanged'];
    contractenddate2 = json['Contractenddate2'];
    baserateDayUnit2 = json['BaserateDayUnit2'];
    baserateNightUnit2 = json['BaserateNightUnit2'];
    baserateEWEUnit2 = json['BaserateEWEUnit2'];
    baserateStandingCharge2 = json['BaserateStandingCharge2'];
    requiredUpliftEle2Y = json['RequiredUpliftEle2Y'];
    requiredUpliftEleNight2Y = json['RequiredUpliftEleNight2Y'];
    requiredUpliftEleEWE2Y = json['RequiredUpliftEleEWE2Y'];
    requiredUpliftEleSC2Y = json['RequiredUpliftEleSC2Y'];
    affiliateUpliftEle2Y = json['AffiliateUpliftEle2Y'];
    affiliateUpliftEleNight2Y = json['AffiliateUpliftEleNight2Y'];
    affiliateUpliftEleEWE2Y = json['AffiliateUpliftEleEWE2Y'];
    affiliateUpliftEleSC2Y = json['AffiliateUpliftEleSC2Y'];
    finalDayUnit2F = json['FinalDayUnit2F'];
    finalNightUnit2F = json['FinalNightUnit2F'];
    finalEWEUnit2F = json['FinalEWEUnit2F'];
    finalStandingCharge2F = json['FinalStandingCharge2F'];
    supplyCapacity2 = json['SupplyCapacity2'];
    supplyCapacityPerKVA2 = json['SupplyCapacityPerKVA2'];
    eMRCFD2 = json['EMRCFD2'];
    exceesCapacityCharegs2 = json['ExceesCapacityCharegs2'];
    reactiveCharegs2 = json['ReactiveCharegs2'];
    hasEle2YWPriceChanged = json['HasEle2YWPriceChanged'];
    contractenddate3 = json['Contractenddate3'];
    baserateDayUnit3 = json['BaserateDayUnit3'];
    baserateNightUnit3 = json['BaserateNightUnit3'];
    baserateEWEUnit3 = json['BaserateEWEUnit3'];
    baserateStandingCharge3 = json['BaserateStandingCharge3'];
    requiredUpliftEle3Y = json['RequiredUpliftEle3Y'];
    requiredUpliftEleNight3Y = json['RequiredUpliftEleNight3Y'];
    requiredUpliftEleEWE3Y = json['RequiredUpliftEleEWE3Y'];
    requiredUpliftEleSC3Y = json['RequiredUpliftEleSC3Y'];
    affiliateUpliftEle3Y = json['AffiliateUpliftEle3Y'];
    affiliateUpliftEleNight3Y = json['AffiliateUpliftEleNight3Y'];
    affiliateUpliftEleEWE3Y = json['AffiliateUpliftEleEWE3Y'];
    affiliateUpliftEleSC3Y = json['AffiliateUpliftEleSC3Y'];
    finalDayUnit3F = json['FinalDayUnit3F'];
    finalNightUnit3F = json['FinalNightUnit3F'];
    finalEWEUnit3F = json['FinalEWEUnit3F'];
    finalStandingCharge3F = json['FinalStandingCharge3F'];
    supplyCapacity3 = json['SupplyCapacity3'];
    supplyCapacityPerKVA3 = json['SupplyCapacityPerKVA3'];
    eMRCFD3 = json['EMRCFD3'];
    exceesCapacityCharegs3 = json['ExceesCapacityCharegs3'];
    reactiveCharegs3 = json['ReactiveCharegs3'];
    hasEle3YWPriceChanged = json['HasEle3YWPriceChanged'];
    contractenddate4 = json['Contractenddate4'];
    baserateDayUnit4 = json['BaserateDayUnit4'];
    baserateNightUnit4 = json['BaserateNightUnit4'];
    baserateEWEUnit4 = json['BaserateEWEUnit4'];
    baserateStandingCharge4 = json['BaserateStandingCharge4'];
    requiredUpliftEle4Y = json['RequiredUpliftEle4Y'];
    requiredUpliftEleNight4Y = json['RequiredUpliftEleNight4Y'];
    requiredUpliftEleEWE4Y = json['RequiredUpliftEleEWE4Y'];
    requiredUpliftEleSC4Y = json['RequiredUpliftEleSC4Y'];
    affiliateUpliftEle4Y = json['AffiliateUpliftEle4Y'];
    affiliateUpliftEleNight4Y = json['AffiliateUpliftEleNight4Y'];
    affiliateUpliftEleEWE4Y = json['AffiliateUpliftEleEWE4Y'];
    affiliateUpliftEleSC4Y = json['AffiliateUpliftEleSC4Y'];
    finalDayUnit4F = json['FinalDayUnit4F'];
    finalNightUnit4F = json['FinalNightUnit4F'];
    finalEWEUnit4F = json['FinalEWEUnit4F'];
    finalStandingCharge4F = json['FinalStandingCharge4F'];
    supplyCapacity4 = json['SupplyCapacity4'];
    supplyCapacityPerKVA4 = json['SupplyCapacityPerKVA4'];
    eMRCFD4 = json['EMRCFD4'];
    exceesCapacityCharegs4 = json['ExceesCapacityCharegs4'];
    reactiveCharegs4 = json['ReactiveCharegs4'];
    hasEle4YWPriceChanged = json['HasEle4YWPriceChanged'];
    contractenddate5 = json['Contractenddate5'];
    baserateDayUnit5 = json['BaserateDayUnit5'];
    baserateNightUnit5 = json['BaserateNightUnit5'];
    baserateEWEUnit5 = json['BaserateEWEUnit5'];
    baserateStandingCharge5 = json['BaserateStandingCharge5'];
    requiredUpliftEle5Y = json['RequiredUpliftEle5Y'];
    requiredUpliftEleNight5Y = json['RequiredUpliftEleNight5Y'];
    requiredUpliftEleEWE5Y = json['RequiredUpliftEleEWE5Y'];
    requiredUpliftEleSC5Y = json['RequiredUpliftEleSC5Y'];
    affiliateUpliftEle5Y = json['AffiliateUpliftEle5Y'];
    affiliateUpliftEleNight5Y = json['AffiliateUpliftEleNight5Y'];
    affiliateUpliftEleEWE5Y = json['AffiliateUpliftEleEWE5Y'];
    affiliateUpliftEleSC5Y = json['AffiliateUpliftEleSC5Y'];
    finalDayUnit5F = json['FinalDayUnit5F'];
    finalNightUnit5F = json['FinalNightUnit5F'];
    finalEWEUnit5F = json['FinalEWEUnit5F'];
    finalStandingCharge5F = json['FinalStandingCharge5F'];
    supplyCapacity5 = json['SupplyCapacity5'];
    supplyCapacityPerKVA5 = json['SupplyCapacityPerKVA5'];
    eMRCFD5 = json['EMRCFD5'];
    exceesCapacityCharegs5 = json['ExceesCapacityCharegs5'];
    reactiveCharegs5 = json['ReactiveCharegs5'];
    hasEle5YWPriceChanged = json['HasEle5YWPriceChanged'];
    contractenddateO = json['ContractenddateO'];
    baserateDayUnitO = json['BaserateDayUnitO'];
    baserateNightUnitO = json['BaserateNightUnitO'];
    baserateEWEUnitO = json['BaserateEWEUnitO'];
    baserateStandingChargeO = json['BaserateStandingChargeO'];
    requiredUpliftEleOY = json['RequiredUpliftEleOY'];
    requiredUpliftEleNightOY = json['RequiredUpliftEleNightOY'];
    requiredUpliftEleEWEOY = json['RequiredUpliftEleEWEOY'];
    requiredUpliftEleSCOY = json['RequiredUpliftEleSCOY'];
    affiliateUpliftEleOY = json['AffiliateUpliftEleOY'];
    affiliateUpliftEleNightOY = json['AffiliateUpliftEleNightOY'];
    affiliateUpliftEleEWEOY = json['AffiliateUpliftEleEWEOY'];
    affiliateUpliftEleSCOY = json['AffiliateUpliftEleSCOY'];
    finalDayUnitOF = json['FinalDayUnitOF'];
    finalNightUnitOF = json['FinalNightUnitOF'];
    finalEWEUnitOF = json['FinalEWEUnitOF'];
    finalStandingChargeOF = json['FinalStandingChargeOF'];
    supplyCapacityO = json['SupplyCapacityO'];
    supplyCapacityPerKVAO = json['SupplyCapacityPerKVAO'];
    eMRCFDO = json['EMRCFDO'];
    exceesCapacityCharegsO = json['ExceesCapacityCharegsO'];
    reactiveCharegsO = json['ReactiveCharegsO'];
    hasEleOYWPriceChanged = json['HasEleOYWPriceChanged'];
    contractenddategas1 = json['Contractenddategas1'];
    baserateSatandingChargeGas1 = json['BaserateSatandingChargeGas1'];
    baserateUnitPriceGas1 = json['BaserateUnitPriceGas1'];
    requiredUpliftGasSC1Y = json['RequiredUpliftGasSC1Y'];
    requiredUpliftGas1Y = json['RequiredUpliftGas1Y'];
    affiliateUpliftGasSC1Y = json['AffiliateUpliftGasSC1Y'];
    affiliateUpliftGas1Y = json['AffiliateUpliftGas1Y'];
    finalSatandingChargeGas1F = json['FinalSatandingChargeGas1F'];
    finalUnitPriceGas1F = json['FinalUnitPriceGas1F'];
    hasGas1YWPriceChanged = json['HasGas1YWPriceChanged'];
    contractenddategas2 = json['Contractenddategas2'];
    baserateSatandingChargeGas2 = json['BaserateSatandingChargeGas2'];
    baserateUnitPriceGas2 = json['BaserateUnitPriceGas2'];
    requiredUpliftGasSC2Y = json['RequiredUpliftGasSC2Y'];
    requiredUpliftGas2Y = json['RequiredUpliftGas2Y'];
    affiliateUpliftGasSC2Y = json['AffiliateUpliftGasSC2Y'];
    affiliateUpliftGas2Y = json['AffiliateUpliftGas2Y'];
    finalSatandingChargeGas2F = json['FinalSatandingChargeGas2F'];
    finalUnitPriceGas2F = json['FinalUnitPriceGas2F'];
    hasGas2YWPriceChanged = json['HasGas2YWPriceChanged'];
    contractenddategas3 = json['Contractenddategas3'];
    baserateSatandingChargeGas3 = json['BaserateSatandingChargeGas3'];
    baserateUnitPriceGas3 = json['BaserateUnitPriceGas3'];
    requiredUpliftGasSC3Y = json['RequiredUpliftGasSC3Y'];
    requiredUpliftGas3Y = json['RequiredUpliftGas3Y'];
    affiliateUpliftGasSC3Y = json['AffiliateUpliftGasSC3Y'];
    affiliateUpliftGas3Y = json['AffiliateUpliftGas3Y'];
    finalSatandingChargeGas3F = json['FinalSatandingChargeGas3F'];
    finalUnitPriceGas3F = json['FinalUnitPriceGas3F'];
    hasGas3YWPriceChanged = json['HasGas3YWPriceChanged'];
    contractenddategas4 = json['Contractenddategas4'];
    baserateSatandingChargeGas4 = json['BaserateSatandingChargeGas4'];
    baserateUnitPriceGas4 = json['BaserateUnitPriceGas4'];
    requiredUpliftGasSC4Y = json['RequiredUpliftGasSC4Y'];
    requiredUpliftGas4Y = json['RequiredUpliftGas4Y'];
    affiliateUpliftGasSC4Y = json['AffiliateUpliftGasSC4Y'];
    affiliateUpliftGas4Y = json['AffiliateUpliftGas4Y'];
    finalSatandingChargeGas4F = json['FinalSatandingChargeGas4F'];
    finalUnitPriceGas4F = json['FinalUnitPriceGas4F'];
    hasGas4YWPriceChanged = json['HasGas4YWPriceChanged'];
    contractenddategas5 = json['Contractenddategas5'];
    baserateSatandingChargeGas5 = json['BaserateSatandingChargeGas5'];
    baserateUnitPriceGas5 = json['BaserateUnitPriceGas5'];
    requiredUpliftGasSC5Y = json['RequiredUpliftGasSC5Y'];
    requiredUpliftGas5Y = json['RequiredUpliftGas5Y'];
    affiliateUpliftGasSC5Y = json['AffiliateUpliftGasSC5Y'];
    affiliateUpliftGas5Y = json['AffiliateUpliftGas5Y'];
    finalSatandingChargeGas5F = json['FinalSatandingChargeGas5F'];
    finalUnitPriceGas5F = json['FinalUnitPriceGas5F'];
    hasGas5YWPriceChanged = json['HasGas5YWPriceChanged'];
    contractenddategasO = json['ContractenddategasO'];
    baserateSatandingChargeGasO = json['BaserateSatandingChargeGasO'];
    baserateUnitPriceGasO = json['BaserateUnitPriceGasO'];
    requiredUpliftGasSCOY = json['RequiredUpliftGasSCOY'];
    requiredUpliftGasOY = json['RequiredUpliftGasOY'];
    affiliateUpliftGasSCOY = json['AffiliateUpliftGasSCOY'];
    affiliateUpliftGasOY = json['AffiliateUpliftGasOY'];
    finalSatandingChargeGasOF = json['FinalSatandingChargeGasOF'];
    finalUnitPriceGasOF = json['FinalUnitPriceGasOF'];
    hasGasOYWPriceChanged = json['HasGasOYWPriceChanged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['CustomerId'] = this.customerId;
    data['Fuel'] = this.fuel;
    data['Type'] = this.type;
    data['Quoteid'] = this.quoteid;
    data['strStatus'] = this.strStatus;
    data['TermType'] = this.termType;
    data['IsSoldByme'] = this.isSoldByme;
    data['IsSoldByOther'] = this.isSoldByOther;
    data['QuotedDate'] = this.quotedDate;
    data['IsAbleToAddPrice'] = this.isAbleToAddPrice;
    data['LastMsgRead'] = this.lastMsgRead;
    data['ShowSendEsign'] = this.showSendEsign;
    data['HHSampleFileAttachment'] = this.hHSampleFileAttachment;
    data['intQuotePriceId1'] = this.intQuotePriceId1;
    data['intQuotePriceId2'] = this.intQuotePriceId2;
    data['intQuotePriceId3'] = this.intQuotePriceId3;
    data['intQuotePriceId4'] = this.intQuotePriceId4;
    data['intQuotePriceId5'] = this.intQuotePriceId5;
    data['intQuotePriceIdO'] = this.intQuotePriceIdO;
    data['isHHCustomer'] = this.isHHCustomer;
    data['RenewalLink'] = this.renewalLink;
    data['RenewalErrorMsg'] = this.renewalErrorMsg;
    data['PriceAlertMsg'] = this.priceAlertMsg;
    data['IntCompanyId'] = this.intCompanyId;
    data['IntCompanyUserId'] = this.intCompanyUserId;
    data['EmailId'] = this.emailId;
    data['CRN'] = this.cRN;
    data['PhoneNo'] = this.phoneNo;
    data['QouteNotes'] = this.qouteNotes;
    data['FlagFrom'] = this.flagFrom;
    data['intsubuserID'] = this.intsubuserID;
    data['BusinessName'] = this.businessName;
    data['PostCode'] = this.postCode;
    data['IsforFirstyear'] = this.isforFirstyear;
    data['IsforSecondyear'] = this.isforSecondyear;
    data['IsforThirdyear'] = this.isforThirdyear;
    data['IsforFourthyear'] = this.isforFourthyear;
    data['IsforFifthyear'] = this.isforFifthyear;
    data['IsforOtheryear'] = this.isforOtheryear;
    data['RequiredByDate'] = this.requiredByDate;
    data['PreferredStartDate'] = this.preferredStartDate;
    data['NextPreferredStartDate'] = this.nextPreferredStartDate;
    data['PreferredEndDate'] = this.preferredEndDate;
    data['PreferredEndDate1'] = this.preferredEndDate1;
    data['PreferredEndDate2'] = this.preferredEndDate2;
    data['ThirdPartyMOP'] = this.thirdPartyMOP;
    data['ThirdPartyDADC'] = this.thirdPartyDADC;
    data['IsStarkDADC'] = this.isStarkDADC;
    data['intDADCId'] = this.intDADCId;
    data['SingleRate'] = this.singleRate;
    data['MPAN'] = this.mPAN;
    data['FullMPAN'] = this.fullMPAN;
    data['MPAN1'] = this.mPAN1;
    data['MPAN2'] = this.mPAN2;
    data['MPAN3'] = this.mPAN3;
    data['MPAN4'] = this.mPAN4;
    data['MPAN5'] = this.mPAN5;
    data['MPAN6'] = this.mPAN6;
    data['MPAN7'] = this.mPAN7;
    data['EACDay'] = this.eACDay;
    data['EACNight'] = this.eACNight;
    data['EACEWE'] = this.eACEWE;
    data['Image64HHFile'] = this.image64HHFile;
    data['ManualEleStatus'] = this.manualEleStatus;
    data['MPRN'] = this.mPRN;
    data['AQ'] = this.aQ;
    data['ManualGasStatus'] = this.manualGasStatus;
    data['Electricityuplift'] = this.electricityuplift;
    data['ElectricityStandingChargeuplift'] =
        this.electricityStandingChargeuplift;
    data['ElectricityupliftAffiliate'] = this.electricityupliftAffiliate;
    data['ElectricityupliftAffiliateStandingChargeuplift'] =
        this.electricityupliftAffiliateStandingChargeuplift;
    data['Gasuplift'] = this.gasuplift;
    data['GasStandingCharge'] = this.gasStandingCharge;
    data['GasupliftAffiliate'] = this.gasupliftAffiliate;
    data['GasupliftAffiliateStandingCharge'] =
        this.gasupliftAffiliateStandingCharge;
    if (this.affiliateSubUserList != null) {
      data['AffiliateSubUserList'] =
          this.affiliateSubUserList.map((v) => v.toJson()).toList();
    }
    data['IntAffiliateSubUserId'] = this.intAffiliateSubUserId;
    data['Contractstartdate'] = this.contractstartdate;
    data['Contractenddate1'] = this.contractenddate1;
    data['BaserateDayUnit1'] = this.baserateDayUnit1;
    data['BaserateNightUnit1'] = this.baserateNightUnit1;
    data['BaserateEWEUnit1'] = this.baserateEWEUnit1;
    data['BaserateStandingCharge1'] = this.baserateStandingCharge1;
    data['RequiredUpliftEle1Y'] = this.requiredUpliftEle1Y;
    data['RequiredUpliftEleNight1Y'] = this.requiredUpliftEleNight1Y;
    data['RequiredUpliftEleEWE1Y'] = this.requiredUpliftEleEWE1Y;
    data['RequiredUpliftEleSC1Y'] = this.requiredUpliftEleSC1Y;
    data['AffiliateUpliftEle1Y'] = this.affiliateUpliftEle1Y;
    data['AffiliateUpliftEleNight1Y'] = this.affiliateUpliftEleNight1Y;
    data['AffiliateUpliftEleEWE1Y'] = this.affiliateUpliftEleEWE1Y;
    data['AffiliateUpliftEleSC1Y'] = this.affiliateUpliftEleSC1Y;
    data['FinalDayUnit1F'] = this.finalDayUnit1F;
    data['FinalNightUnit1F'] = this.finalNightUnit1F;
    data['FinalEWEUnit1F'] = this.finalEWEUnit1F;
    data['FinalStandingCharge1F'] = this.finalStandingCharge1F;
    data['SupplyCapacity1'] = this.supplyCapacity1;
    data['SupplyCapacityPerKVA1'] = this.supplyCapacityPerKVA1;
    data['EMRCFD1'] = this.eMRCFD1;
    data['ExceesCapacityCharegs1'] = this.exceesCapacityCharegs1;
    data['ReactiveCharegs1'] = this.reactiveCharegs1;
    data['HasEle1YWPriceChanged'] = this.hasEle1YWPriceChanged;
    data['Contractenddate2'] = this.contractenddate2;
    data['BaserateDayUnit2'] = this.baserateDayUnit2;
    data['BaserateNightUnit2'] = this.baserateNightUnit2;
    data['BaserateEWEUnit2'] = this.baserateEWEUnit2;
    data['BaserateStandingCharge2'] = this.baserateStandingCharge2;
    data['RequiredUpliftEle2Y'] = this.requiredUpliftEle2Y;
    data['RequiredUpliftEleNight2Y'] = this.requiredUpliftEleNight2Y;
    data['RequiredUpliftEleEWE2Y'] = this.requiredUpliftEleEWE2Y;
    data['RequiredUpliftEleSC2Y'] = this.requiredUpliftEleSC2Y;
    data['AffiliateUpliftEle2Y'] = this.affiliateUpliftEle2Y;
    data['AffiliateUpliftEleNight2Y'] = this.affiliateUpliftEleNight2Y;
    data['AffiliateUpliftEleEWE2Y'] = this.affiliateUpliftEleEWE2Y;
    data['AffiliateUpliftEleSC2Y'] = this.affiliateUpliftEleSC2Y;
    data['FinalDayUnit2F'] = this.finalDayUnit2F;
    data['FinalNightUnit2F'] = this.finalNightUnit2F;
    data['FinalEWEUnit2F'] = this.finalEWEUnit2F;
    data['FinalStandingCharge2F'] = this.finalStandingCharge2F;
    data['SupplyCapacity2'] = this.supplyCapacity2;
    data['SupplyCapacityPerKVA2'] = this.supplyCapacityPerKVA2;
    data['EMRCFD2'] = this.eMRCFD2;
    data['ExceesCapacityCharegs2'] = this.exceesCapacityCharegs2;
    data['ReactiveCharegs2'] = this.reactiveCharegs2;
    data['HasEle2YWPriceChanged'] = this.hasEle2YWPriceChanged;
    data['Contractenddate3'] = this.contractenddate3;
    data['BaserateDayUnit3'] = this.baserateDayUnit3;
    data['BaserateNightUnit3'] = this.baserateNightUnit3;
    data['BaserateEWEUnit3'] = this.baserateEWEUnit3;
    data['BaserateStandingCharge3'] = this.baserateStandingCharge3;
    data['RequiredUpliftEle3Y'] = this.requiredUpliftEle3Y;
    data['RequiredUpliftEleNight3Y'] = this.requiredUpliftEleNight3Y;
    data['RequiredUpliftEleEWE3Y'] = this.requiredUpliftEleEWE3Y;
    data['RequiredUpliftEleSC3Y'] = this.requiredUpliftEleSC3Y;
    data['AffiliateUpliftEle3Y'] = this.affiliateUpliftEle3Y;
    data['AffiliateUpliftEleNight3Y'] = this.affiliateUpliftEleNight3Y;
    data['AffiliateUpliftEleEWE3Y'] = this.affiliateUpliftEleEWE3Y;
    data['AffiliateUpliftEleSC3Y'] = this.affiliateUpliftEleSC3Y;
    data['FinalDayUnit3F'] = this.finalDayUnit3F;
    data['FinalNightUnit3F'] = this.finalNightUnit3F;
    data['FinalEWEUnit3F'] = this.finalEWEUnit3F;
    data['FinalStandingCharge3F'] = this.finalStandingCharge3F;
    data['SupplyCapacity3'] = this.supplyCapacity3;
    data['SupplyCapacityPerKVA3'] = this.supplyCapacityPerKVA3;
    data['EMRCFD3'] = this.eMRCFD3;
    data['ExceesCapacityCharegs3'] = this.exceesCapacityCharegs3;
    data['ReactiveCharegs3'] = this.reactiveCharegs3;
    data['HasEle3YWPriceChanged'] = this.hasEle3YWPriceChanged;
    data['Contractenddate4'] = this.contractenddate4;
    data['BaserateDayUnit4'] = this.baserateDayUnit4;
    data['BaserateNightUnit4'] = this.baserateNightUnit4;
    data['BaserateEWEUnit4'] = this.baserateEWEUnit4;
    data['BaserateStandingCharge4'] = this.baserateStandingCharge4;
    data['RequiredUpliftEle4Y'] = this.requiredUpliftEle4Y;
    data['RequiredUpliftEleNight4Y'] = this.requiredUpliftEleNight4Y;
    data['RequiredUpliftEleEWE4Y'] = this.requiredUpliftEleEWE4Y;
    data['RequiredUpliftEleSC4Y'] = this.requiredUpliftEleSC4Y;
    data['AffiliateUpliftEle4Y'] = this.affiliateUpliftEle4Y;
    data['AffiliateUpliftEleNight4Y'] = this.affiliateUpliftEleNight4Y;
    data['AffiliateUpliftEleEWE4Y'] = this.affiliateUpliftEleEWE4Y;
    data['AffiliateUpliftEleSC4Y'] = this.affiliateUpliftEleSC4Y;
    data['FinalDayUnit4F'] = this.finalDayUnit4F;
    data['FinalNightUnit4F'] = this.finalNightUnit4F;
    data['FinalEWEUnit4F'] = this.finalEWEUnit4F;
    data['FinalStandingCharge4F'] = this.finalStandingCharge4F;
    data['SupplyCapacity4'] = this.supplyCapacity4;
    data['SupplyCapacityPerKVA4'] = this.supplyCapacityPerKVA4;
    data['EMRCFD4'] = this.eMRCFD4;
    data['ExceesCapacityCharegs4'] = this.exceesCapacityCharegs4;
    data['ReactiveCharegs4'] = this.reactiveCharegs4;
    data['HasEle4YWPriceChanged'] = this.hasEle4YWPriceChanged;
    data['Contractenddate5'] = this.contractenddate5;
    data['BaserateDayUnit5'] = this.baserateDayUnit5;
    data['BaserateNightUnit5'] = this.baserateNightUnit5;
    data['BaserateEWEUnit5'] = this.baserateEWEUnit5;
    data['BaserateStandingCharge5'] = this.baserateStandingCharge5;
    data['RequiredUpliftEle5Y'] = this.requiredUpliftEle5Y;
    data['RequiredUpliftEleNight5Y'] = this.requiredUpliftEleNight5Y;
    data['RequiredUpliftEleEWE5Y'] = this.requiredUpliftEleEWE5Y;
    data['RequiredUpliftEleSC5Y'] = this.requiredUpliftEleSC5Y;
    data['AffiliateUpliftEle5Y'] = this.affiliateUpliftEle5Y;
    data['AffiliateUpliftEleNight5Y'] = this.affiliateUpliftEleNight5Y;
    data['AffiliateUpliftEleEWE5Y'] = this.affiliateUpliftEleEWE5Y;
    data['AffiliateUpliftEleSC5Y'] = this.affiliateUpliftEleSC5Y;
    data['FinalDayUnit5F'] = this.finalDayUnit5F;
    data['FinalNightUnit5F'] = this.finalNightUnit5F;
    data['FinalEWEUnit5F'] = this.finalEWEUnit5F;
    data['FinalStandingCharge5F'] = this.finalStandingCharge5F;
    data['SupplyCapacity5'] = this.supplyCapacity5;
    data['SupplyCapacityPerKVA5'] = this.supplyCapacityPerKVA5;
    data['EMRCFD5'] = this.eMRCFD5;
    data['ExceesCapacityCharegs5'] = this.exceesCapacityCharegs5;
    data['ReactiveCharegs5'] = this.reactiveCharegs5;
    data['HasEle5YWPriceChanged'] = this.hasEle5YWPriceChanged;
    data['ContractenddateO'] = this.contractenddateO;
    data['BaserateDayUnitO'] = this.baserateDayUnitO;
    data['BaserateNightUnitO'] = this.baserateNightUnitO;
    data['BaserateEWEUnitO'] = this.baserateEWEUnitO;
    data['BaserateStandingChargeO'] = this.baserateStandingChargeO;
    data['RequiredUpliftEleOY'] = this.requiredUpliftEleOY;
    data['RequiredUpliftEleNightOY'] = this.requiredUpliftEleNightOY;
    data['RequiredUpliftEleEWEOY'] = this.requiredUpliftEleEWEOY;
    data['RequiredUpliftEleSCOY'] = this.requiredUpliftEleSCOY;
    data['AffiliateUpliftEleOY'] = this.affiliateUpliftEleOY;
    data['AffiliateUpliftEleNightOY'] = this.affiliateUpliftEleNightOY;
    data['AffiliateUpliftEleEWEOY'] = this.affiliateUpliftEleEWEOY;
    data['AffiliateUpliftEleSCOY'] = this.affiliateUpliftEleSCOY;
    data['FinalDayUnitOF'] = this.finalDayUnitOF;
    data['FinalNightUnitOF'] = this.finalNightUnitOF;
    data['FinalEWEUnitOF'] = this.finalEWEUnitOF;
    data['FinalStandingChargeOF'] = this.finalStandingChargeOF;
    data['SupplyCapacityO'] = this.supplyCapacityO;
    data['SupplyCapacityPerKVAO'] = this.supplyCapacityPerKVAO;
    data['EMRCFDO'] = this.eMRCFDO;
    data['ExceesCapacityCharegsO'] = this.exceesCapacityCharegsO;
    data['ReactiveCharegsO'] = this.reactiveCharegsO;
    data['HasEleOYWPriceChanged'] = this.hasEleOYWPriceChanged;
    data['Contractenddategas1'] = this.contractenddategas1;
    data['BaserateSatandingChargeGas1'] = this.baserateSatandingChargeGas1;
    data['BaserateUnitPriceGas1'] = this.baserateUnitPriceGas1;
    data['RequiredUpliftGasSC1Y'] = this.requiredUpliftGasSC1Y;
    data['RequiredUpliftGas1Y'] = this.requiredUpliftGas1Y;
    data['AffiliateUpliftGasSC1Y'] = this.affiliateUpliftGasSC1Y;
    data['AffiliateUpliftGas1Y'] = this.affiliateUpliftGas1Y;
    data['FinalSatandingChargeGas1F'] = this.finalSatandingChargeGas1F;
    data['FinalUnitPriceGas1F'] = this.finalUnitPriceGas1F;
    data['HasGas1YWPriceChanged'] = this.hasGas1YWPriceChanged;
    data['Contractenddategas2'] = this.contractenddategas2;
    data['BaserateSatandingChargeGas2'] = this.baserateSatandingChargeGas2;
    data['BaserateUnitPriceGas2'] = this.baserateUnitPriceGas2;
    data['RequiredUpliftGasSC2Y'] = this.requiredUpliftGasSC2Y;
    data['RequiredUpliftGas2Y'] = this.requiredUpliftGas2Y;
    data['AffiliateUpliftGasSC2Y'] = this.affiliateUpliftGasSC2Y;
    data['AffiliateUpliftGas2Y'] = this.affiliateUpliftGas2Y;
    data['FinalSatandingChargeGas2F'] = this.finalSatandingChargeGas2F;
    data['FinalUnitPriceGas2F'] = this.finalUnitPriceGas2F;
    data['HasGas2YWPriceChanged'] = this.hasGas2YWPriceChanged;
    data['Contractenddategas3'] = this.contractenddategas3;
    data['BaserateSatandingChargeGas3'] = this.baserateSatandingChargeGas3;
    data['BaserateUnitPriceGas3'] = this.baserateUnitPriceGas3;
    data['RequiredUpliftGasSC3Y'] = this.requiredUpliftGasSC3Y;
    data['RequiredUpliftGas3Y'] = this.requiredUpliftGas3Y;
    data['AffiliateUpliftGasSC3Y'] = this.affiliateUpliftGasSC3Y;
    data['AffiliateUpliftGas3Y'] = this.affiliateUpliftGas3Y;
    data['FinalSatandingChargeGas3F'] = this.finalSatandingChargeGas3F;
    data['FinalUnitPriceGas3F'] = this.finalUnitPriceGas3F;
    data['HasGas3YWPriceChanged'] = this.hasGas3YWPriceChanged;
    data['Contractenddategas4'] = this.contractenddategas4;
    data['BaserateSatandingChargeGas4'] = this.baserateSatandingChargeGas4;
    data['BaserateUnitPriceGas4'] = this.baserateUnitPriceGas4;
    data['RequiredUpliftGasSC4Y'] = this.requiredUpliftGasSC4Y;
    data['RequiredUpliftGas4Y'] = this.requiredUpliftGas4Y;
    data['AffiliateUpliftGasSC4Y'] = this.affiliateUpliftGasSC4Y;
    data['AffiliateUpliftGas4Y'] = this.affiliateUpliftGas4Y;
    data['FinalSatandingChargeGas4F'] = this.finalSatandingChargeGas4F;
    data['FinalUnitPriceGas4F'] = this.finalUnitPriceGas4F;
    data['HasGas4YWPriceChanged'] = this.hasGas4YWPriceChanged;
    data['Contractenddategas5'] = this.contractenddategas5;
    data['BaserateSatandingChargeGas5'] = this.baserateSatandingChargeGas5;
    data['BaserateUnitPriceGas5'] = this.baserateUnitPriceGas5;
    data['RequiredUpliftGasSC5Y'] = this.requiredUpliftGasSC5Y;
    data['RequiredUpliftGas5Y'] = this.requiredUpliftGas5Y;
    data['AffiliateUpliftGasSC5Y'] = this.affiliateUpliftGasSC5Y;
    data['AffiliateUpliftGas5Y'] = this.affiliateUpliftGas5Y;
    data['FinalSatandingChargeGas5F'] = this.finalSatandingChargeGas5F;
    data['FinalUnitPriceGas5F'] = this.finalUnitPriceGas5F;
    data['HasGas5YWPriceChanged'] = this.hasGas5YWPriceChanged;
    data['ContractenddategasO'] = this.contractenddategasO;
    data['BaserateSatandingChargeGasO'] = this.baserateSatandingChargeGasO;
    data['BaserateUnitPriceGasO'] = this.baserateUnitPriceGasO;
    data['RequiredUpliftGasSCOY'] = this.requiredUpliftGasSCOY;
    data['RequiredUpliftGasOY'] = this.requiredUpliftGasOY;
    data['AffiliateUpliftGasSCOY'] = this.affiliateUpliftGasSCOY;
    data['AffiliateUpliftGasOY'] = this.affiliateUpliftGasOY;
    data['FinalSatandingChargeGasOF'] = this.finalSatandingChargeGasOF;
    data['FinalUnitPriceGasOF'] = this.finalUnitPriceGasOF;
    data['HasGasOYWPriceChanged'] = this.hasGasOYWPriceChanged;
    return data;
  }
}

class AffiliateSubUserList {
  bool selected;
  String text;
  String value;

  AffiliateSubUserList({this.selected, this.text, this.value});

  AffiliateSubUserList.fromJson(Map<String, dynamic> json) {
    selected = json['Selected'];
    text = json['Text'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Selected'] = this.selected;
    data['Text'] = this.text;
    data['Value'] = this.value;
    return data;
  }
}
