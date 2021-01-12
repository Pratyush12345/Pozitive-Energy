import 'package:pozitive/Core/Model/Api/credentialLogin.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/Pref.dart';

import 'baseApi.dart';

class LogInApi extends BaseApi {
  Future<dynamic> login(LogInCredential logInCredential) {
    return postRequest("login", (r) {
      print(r.body);
      return r;
    }, logInCredential);
  }

  Stream<User> get user {
    return Stream.fromFuture(Prefs.getUser());
  }
}
