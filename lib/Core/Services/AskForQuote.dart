import 'package:pozitive/Core/Model/Api/askForQuoteModel.dart';
import 'baseApi.dart';
import 'dart:convert';

class AskForQuoteApi extends BaseApi {
  Future askForQuote(AskForQuoteModel askForQuoteModel) async {
    return postRequest("AddPartnerAddQuickLeadQuote", (r) {
      print(r.statusCode);
      var x = json.decode(r.body) as Map<String, dynamic>;

      return x;
    }, askForQuoteModel);
  }
}
