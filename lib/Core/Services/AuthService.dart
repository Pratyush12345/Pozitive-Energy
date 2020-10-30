

import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Util/Pref.dart';

class AutService{

  Stream<User>get user{
    return Stream.fromFuture(Prefs.getUser());
  }

}