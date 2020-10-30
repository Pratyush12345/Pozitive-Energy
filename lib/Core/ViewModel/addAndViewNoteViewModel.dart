
import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/addQuoteNoteCredential.dart';
import 'package:pozitive/Core/Model/Api/dashBoadDetailCredential.dart';
import 'package:pozitive/Core/Model/Api/profileIdModel.dart';
import 'package:pozitive/Core/Model/Api/quoteNoteCredential.dart';
import 'package:pozitive/Core/Model/DashBoardModel.dart';
import 'package:pozitive/Core/Model/dashBoardDetailsDataModel.dart';
import 'package:pozitive/Core/Model/quoteNotes.dart';
import 'package:pozitive/Core/Services/logInApi.dart';
import 'package:pozitive/Core/Services/profileApi.dart';
import 'package:pozitive/Core/Services/quotationNoteApi.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

GetIt getIt = GetIt.instance;

class AddandViewNoteViewModel extends BaseModel {
  QuotationNoteApi _api = getIt<QuotationNoteApi>();

  QuoteNote quoteNote=QuoteNote();



  Future getQuoteNoteList(QuoteNoteCredential quoteNoteCredential) async {
    assert( quoteNoteCredential != null);
    // TODO: Apply validation here or somewhere else?

    print('acountId ===${quoteNoteCredential.accountId}');

    setState(ViewState.BUSY);

    final response = await _api.getQuoteNoteList(quoteNoteCredential);


    if (isNotError(response)) {
      quoteNote=response;
      print(response);
    }else{
      print("error");

    }

    setState(ViewState.IDLE);
  }
  Future uppdateQuoteNote(AddQuoteNoteCredential addQuoteNoteCredential) async {
    assert( addQuoteNoteCredential != null);
    // TODO: Apply validation here or somewhere else?

    print('acountId ===${addQuoteNoteCredential.accountId}');

    setState(ViewState.BUSY);

    final response = await _api.addQuoteNotes(addQuoteNoteCredential);


    if (isNotError(response)) {
      var res= jsonDecode(response);
      setState(ViewState.IDLE);
      return res;
    }else{
      print("error");
      setState(ViewState.IDLE);
      return;

    }


  }
}
