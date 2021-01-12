import 'dart:convert';

import 'package:pozitive/Core/Model/Api/profileIdModel.dart';
import 'package:pozitive/Core/Model/DashBoardModel.dart';
import 'baseApi.dart';

class DashBoardApi extends BaseApi {
  Future<dynamic> getDashBoardDetails(ProfileId profileId) {
    return postRequest("QuickLeadQuoteDashboard", (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return DashBoardModel.fromJson(res['data']);
    }, profileId);
  }
}
