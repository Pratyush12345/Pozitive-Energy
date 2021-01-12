import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:pozitive/Core/Model/Api/profileIdModel.dart';
import 'package:pozitive/Core/Model/Api/updateProfileModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/profileApi.dart';
import 'package:pozitive/Core/ViewModel/baseModel.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/Pref.dart';

GetIt getIt = GetIt.instance;

class ProfileProviderModel extends BaseModel {
  ProfileApi _api = getIt<ProfileApi>();
  User user = User();

  Future getProfileDetails() async {
    // TODO: Apply validation here or somewhere else?

    setState(ViewState.BUSY);

    user = await Prefs.getUser();

    final response =
        await _api.getProfileById(ProfileId(accountId: user.accountId));

    if (isNotError(response)) {
      var res = jsonDecode(response.body);
      print(res['data']);
      User _user = User.fromJson(res['data']);
      user = _user;
      print('#########z${user.firstName}');
      Prefs.setUserProfile(user);
      setState(ViewState.IDLE);
    } else {
      print("error");
      setState(ViewState.IDLE);
    }
  }

  Future updateProfile(UpdateProfile updateProfile) async {
    setState(ViewState.BUSY);
    final response = await _api.updateProfile(updateProfile);
    if (isNotError(response)) {
      print(response);
      var res = jsonDecode(response);
      setState(ViewState.IDLE);
      return res;
    } else {
      print("error");
      return;
    }
  }

  Future getUser() async {
    setState(ViewState.BUSY);
    user = await Prefs.getUser();
    setState(ViewState.IDLE);
  }
}
