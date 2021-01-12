import 'baseApi.dart';
import '../Model/Api/askForQuoteViewButtonModel.dart';
import 'dart:convert';

class AskForQuoteView extends BaseApi {
  Future askForQuote(
      AskForQuoteViewButtonModel askForQuoteViewButtonModel) async {
    return postRequest("GetPartnerAddQuickLeadQuote", (r) {
      var x = json.decode(r.body) as Map<String, dynamic>;
      return x;
    }, askForQuoteViewButtonModel);
  }
}
