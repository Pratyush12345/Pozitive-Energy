import 'package:pozitive/Core/Model/Api/profileIdModel.dart';
import 'package:pozitive/Core/Model/Api/updateProfileModel.dart';
import 'baseApi.dart';

class ProfileApi extends BaseApi {


  Future<dynamic>getProfileById(ProfileId profileId){
    return postRequest("GetPartnerProfileDetail", (r) {
      print(r.body);
      return r;
    },profileId);
  }

  Future<dynamic> updateProfile(UpdateProfile updateProfile){
    return postRequest("UpdatePartnerProfileDetail", (r) => r.body,updateProfile);
  }


}