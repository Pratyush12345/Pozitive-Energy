import 'package:pozitive/Core/Model/Api/credentialLogin.dart';
import 'package:pozitive/Core/Model/Api/emailIdModel.dart';
import 'baseApi.dart';

class ForgotPasswordApi extends BaseApi {


  Future<dynamic> forGotPassword(ProfileEmailId profileEmailId){
    return postRequest("ForgotPassword", (r) {
      print(r.body);
      return r.body;
    },profileEmailId);
  }


}