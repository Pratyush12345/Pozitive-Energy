import 'package:pozitive/Core/Model/sendable.dart';

class GenerateContractIndivisualModel extends Sendable {
  String accountId;
  String quoteid;
  String nextPreferredStartDate;
  String intsubuserID;
  String termType;
  String intCompanyId;
  String requiredUpliftEle1Y;
  String requiredUpliftEleNight1Y;
  String requiredUpliftEleEWE1Y;
  String requiredUpliftEleSC1Y;
  String affiliateUpliftEle1Y;
  String affiliateUpliftEleNight1Y;
  String affiliateUpliftEleEWE1Y;
  String affiliateUpliftEleSC1Y;
  String baserateDayUnit1;
  String baserateNightUnit1;
  String requiredUpliftGasSC1Y;
  String affiliateUpliftGas1Y;
  String affiliateUpliftGasSC1Y;

  GenerateContractIndivisualModel(
      {this.accountId,
      this.quoteid,
      this.nextPreferredStartDate,
      this.intsubuserID,
      this.termType,
      this.intCompanyId,
      this.requiredUpliftEle1Y,
      this.requiredUpliftEleNight1Y,
      this.requiredUpliftEleEWE1Y,
      this.requiredUpliftEleSC1Y,
      this.affiliateUpliftEle1Y,
      this.affiliateUpliftEleNight1Y,
      this.affiliateUpliftEleEWE1Y,
      this.affiliateUpliftEleSC1Y,
      this.baserateDayUnit1,
      this.baserateNightUnit1,
      this.requiredUpliftGasSC1Y,
      this.affiliateUpliftGas1Y,
      this.affiliateUpliftGasSC1Y});

  GenerateContractIndivisualModel.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    quoteid = json['Quoteid'];
    nextPreferredStartDate = json['NextPreferredStartDate'];
    intsubuserID = json['intsubuserID'];
    termType = json['TermType'];
    intCompanyId = json['IntCompanyId'];
    requiredUpliftEle1Y = json['RequiredUpliftEle1Y'];
    requiredUpliftEleNight1Y = json['RequiredUpliftEleNight1Y'];
    requiredUpliftEleEWE1Y = json['RequiredUpliftEleEWE1Y'];
    requiredUpliftEleSC1Y = json['RequiredUpliftEleSC1Y'];
    affiliateUpliftEle1Y = json['AffiliateUpliftEle1Y'];
    affiliateUpliftEleNight1Y = json['AffiliateUpliftEleNight1Y'];
    affiliateUpliftEleEWE1Y = json['AffiliateUpliftEleEWE1Y'];
    affiliateUpliftEleSC1Y = json['AffiliateUpliftEleSC1Y'];
    baserateDayUnit1 = json['BaserateDayUnit1'];
    baserateNightUnit1 = json['BaserateNightUnit1'];
    requiredUpliftGasSC1Y = json['RequiredUpliftGasSC1Y'];
    affiliateUpliftGas1Y = json['AffiliateUpliftGas1Y'];
    affiliateUpliftGasSC1Y = json['AffiliateUpliftGasSC1Y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Quoteid'] = this.quoteid;
    data['NextPreferredStartDate'] = this.nextPreferredStartDate;
    data['intsubuserID'] = this.intsubuserID;
    data['TermType'] = this.termType;
    data['IntCompanyId'] = this.intCompanyId;
    data['RequiredUpliftEle1Y'] = this.requiredUpliftEle1Y;
    data['RequiredUpliftEleNight1Y'] = this.requiredUpliftEleNight1Y;
    data['RequiredUpliftEleEWE1Y'] = this.requiredUpliftEleEWE1Y;
    data['RequiredUpliftEleSC1Y'] = this.requiredUpliftEleSC1Y;
    data['AffiliateUpliftEle1Y'] = this.affiliateUpliftEle1Y;
    data['AffiliateUpliftEleNight1Y'] = this.affiliateUpliftEleNight1Y;
    data['AffiliateUpliftEleEWE1Y'] = this.affiliateUpliftEleEWE1Y;
    data['AffiliateUpliftEleSC1Y'] = this.affiliateUpliftEleSC1Y;
    data['BaserateDayUnit1'] = this.baserateDayUnit1;
    data['BaserateNightUnit1'] = this.baserateNightUnit1;
    data['RequiredUpliftGasSC1Y'] = this.requiredUpliftGasSC1Y;
    data['AffiliateUpliftGas1Y'] = this.affiliateUpliftGas1Y;
    data['AffiliateUpliftGasSC1Y'] = this.affiliateUpliftGasSC1Y;
    return data;
  }
}
