

import 'package:pozitive/Core/Model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs{
  static Future<User> getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String AccountId = preferences.getString("AccountId");
    String EmailId = preferences.getString("EmailId");
    String UserName=preferences.getString("UserName");
    String FirstName=preferences.getString('FirstName');
    String MiddleName=preferences.getString('MiddleName');
    String LastName=preferences.getString('LastName');
    String PhoneNo=preferences.getString('PhoneNo');
    String Address1=preferences.getString('Address1');
    String Address2=preferences.getString('Address2');
    String Postcode=preferences.getString('Postcode');
    String City=preferences.getString('City');


    print('#####pre#########$UserName');


    return new User(
      accountId: AccountId,
      firstName: FirstName,
      lastName: LastName,
      userName: UserName,
      address1: Address1,
      address2: Address2,
      emailId: EmailId,
      middleName: MiddleName,
      postcode: Postcode,
      phoneNo: PhoneNo,
      city: City
    );
  }


  static void setUserProfile(User user) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("AccountId", user.accountId);
    preferences.setString("EmailId", user.emailId);
    preferences.setString("UserName", user.userName);
    preferences.setString("FirstName", user.firstName);
    preferences.setString("MiddleName", user.middleName);
    preferences.setString("LastName", user.lastName);
    preferences.setString("PhoneNo", user.phoneNo);
    preferences.setString("Address1", user.address1);
    preferences.setString("Address2", user.address2);
    preferences.setString("Postcode", user.postcode);
    preferences.setString("City", user.city);
    preferences.commit();
  }

  static void logIn(bool logIn)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("logout", logIn);
    preferences.commit();

  }

  static void logOut() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("remember", false);
    preferences.setString("AccountId", null);
    preferences.setString("EmailId", null);
    preferences.setString("UserName", null);
    preferences.setString("FirstName", null);
    preferences.setString("phone", null);
    preferences.setString("username", null);
    preferences.setString("firstname", null);
    preferences.setString("MiddleName", null);
    preferences.setString("LastName", null);
    preferences.setString("PhoneNo", null);
    preferences.setString("Address1", null);
    preferences.setString("Address2", null);
    preferences.setString("Postcode", null);
    preferences.setString("City", null);
    preferences.commit();
  }


}