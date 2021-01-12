import 'dart:convert';

import 'package:pozitive/Core/AppConstact/apiPath.dart';
import 'package:pozitive/Core/Model/Api/dashBoadDetailCredential.dart';
import 'package:pozitive/Core/Model/dashBoardDetailsDataModel.dart';
import 'baseApi.dart';

class DashBoardDatailsApi extends BaseApi {
  Future<dynamic> getDashBoardDetailsList(
      DashBoardDetailsCredential dashBoardDetailsCredential) {
    return postRequest(ApiPath.quickLeadQuoteDashboardDetail, (r) {
      print(r.body);
      var res = jsonDecode(r.body);
      return DashBoardDetailDataModel.fromJson(res['data']);
    }, dashBoardDetailsCredential);
  }
}
