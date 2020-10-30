

import 'package:pozitive/Core/Model/Api/changePassword.dart';
import 'package:pozitive/Core/Model/Api/credentialLogin.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/Pref.dart';


import 'baseApi.dart';

class ChangePasswordAPi extends BaseApi {



  Future<dynamic>changePassword(ChangePasswordCredential changePasswordCredential){
    return postRequest("ChangePassword", (r) {
      print(r.body);
      return r;
    },changePasswordCredential);
  }
  Stream<User>get user{
    return Stream.fromFuture(Prefs.getUser());
  }


}