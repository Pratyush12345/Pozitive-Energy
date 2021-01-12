import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/askForQuoteModel.dart';
import 'package:pozitive/Core/Model/Api/profileIdModel.dart';
import 'package:pozitive/Core/Services/AskForQuote.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/toastMessage.dart';

GetIt getIt = GetIt.instance;

class GetPartnerAddQuoteViewModel extends BaseModel {
  AskForQuoteApi _api = getIt<AskForQuoteApi>();

  Future askForQuote() async {
    AskForQuoteModel askForQuoteModel;
    assert(askForQuoteModel != null);
    // TODO: Apply validation here or somewhere else?

    setState(ViewState.BUSY);

    final response = await _api.askForQuote(askForQuoteModel);

    if (isNotError(response)) {
      var res = jsonDecode(response);
      print('printitin${res['msg']}');
      successToast(res['msg']);
    } else {
      print("error");
    }

    setState(ViewState.IDLE);
  }
}
