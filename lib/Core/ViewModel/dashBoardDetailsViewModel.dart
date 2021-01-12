import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/dashBoadDetailCredential.dart';
import 'package:pozitive/Core/Model/dashBoardDetailsDataModel.dart';
import 'package:pozitive/Core/Services/dashBoradDetaislApi.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

GetIt getIt = GetIt.instance;

class DashBoardDetailsViewModel extends BaseModel {
  DashBoardDatailsApi _api = getIt<DashBoardDatailsApi>();

  DashBoardDetailDataModel dashBoardDetailDataModel =
      DashBoardDetailDataModel();

  Future getDashBoardDetails(
      DashBoardDetailsCredential dashBoardDetailsCredential) async {
    assert(dashBoardDetailsCredential != null);
    // TODO: Apply validation here or somewhere else?

    print('acountId ===${dashBoardDetailsCredential.accountId}');

    setState(ViewState.BUSY);

    final response =
        await _api.getDashBoardDetailsList(dashBoardDetailsCredential);

    if (isNotError(response)) {
      dashBoardDetailDataModel = response;
      print(response);
    } else {
      print("error");
    }

    setState(ViewState.IDLE);
  }
}
