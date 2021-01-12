import 'package:pozitive/Core/Model/Api/generateContractIndivisualModel.dart';
import 'baseApi.dart';

class GenerateContractIndivisual extends BaseApi {
  Future<dynamic> generateContractIndivisual(
      GenerateContractIndivisualModel generateContractIndivisualModel) async {
    return postRequest("GenerateContractIndividual", (r) {
      print(r.body);
      return r;
    }, generateContractIndivisualModel);
  }
}
