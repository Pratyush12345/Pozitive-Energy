import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/credentialLogin.dart';
import 'package:pozitive/Core/Model/user.dart';

import 'package:pozitive/Core/Services/logInApi.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/toastMessage.dart';

GetIt getIt = GetIt.instance;

class LogInModel extends BaseModel {
  LogInApi _api = getIt<LogInApi>();

  Future<User> login(LogInCredential logInCredential) async {
    assert(logInCredential != null);
    // TODO: Apply validation here or somewhere else?

    setState(ViewState.BUSY);

    final response = await _api.login(logInCredential);

    if (isNotError(response)) {
      var res = jsonDecode(response.body);

      print("#############${res["status"]}");

      if (res["status"] == "1") {
        setState(ViewState.IDLE);
        successToast(res["msg"]);
        return User.fromJson(res["data"]);
      } else {
        setState(ViewState.IDLE);
        showToast(res["msg"]);

        return null;
      }
    } else {
      setState(ViewState.IDLE);
      print("error");
      return null;
    }
  }
}
