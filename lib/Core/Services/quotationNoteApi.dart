import 'dart:convert';

import 'package:pozitive/Core/Model/Api/addQuoteNoteCredential.dart';
import 'package:pozitive/Core/Model/Api/quoteNoteCredential.dart';
import 'package:pozitive/Core/Model/quoteNotes.dart';
import 'baseApi.dart';

class QuotationNoteApi extends BaseApi {
  Future<dynamic> getQuoteNoteList(QuoteNoteCredential quoteNoteCredential) {
    return postRequest("GetQuoteNotes", (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return QuoteNote.fromJson(res['data']);
    }, quoteNoteCredential);
  }

  Future<dynamic> addQuoteNotes(AddQuoteNoteCredential addQuoteNoteCredential) {
    return postRequest("AddQuoteNotes", (r) => r.body, addQuoteNoteCredential);
  }
}
