import 'dart:convert';

import 'package:pozitive/Core/Model/Api/AddProspectModel.dart';
import 'package:pozitive/Core/Services/baseApi.dart';
import 'package:pozitive/Core/Model/sendable.dart';

class AddProspectApi extends BaseApi {
  Future addProspectGasGenerateContract(
      AddProspectModel AddProspectModel) async {
    return postRequest("InsertAddProspect", (r) {
      print(r.statusCode);
      var x = json.decode(r.body) as Map<String, dynamic>;

      return x;
    }, AddProspectModel);
  }
}
