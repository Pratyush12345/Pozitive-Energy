
import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/profileIdModel.dart';
import 'package:pozitive/Core/Model/DashBoardModel.dart';
import 'package:pozitive/Core/Services/dashBoardApi.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';

GetIt getIt = GetIt.instance;

class DashBoardViewModel extends BaseModel {
  DashBoardApi _api = getIt<DashBoardApi>();

  DashBoardModel dashBoardModel=DashBoardModel();



  Future getDashBoardDetails(ProfileId profileId) async {
    assert( profileId != null);
    // TODO: Apply validation here or somewhere else?

    print('acountId ===${profileId.accountId}');

    setState(ViewState.BUSY);

    final response = await _api.getDashBoardDetails(profileId);


    if (isNotError(response)) {
      dashBoardModel=response;
      print(response);
    }else{
      print("error");

    }

    setState(ViewState.IDLE);
  }
}
