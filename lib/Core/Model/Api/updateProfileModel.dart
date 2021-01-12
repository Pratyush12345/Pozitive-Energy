import 'package:pozitive/Core/Model/sendable.dart';

class UpdateProfile extends Sendable {
  String accountId;
  String firstName;
  String middleName;
  String lastName;
  String phoneNo;
  String address1;
  String address2;
  String postcode;
  String city;
  String emailId;
  String password;

  UpdateProfile(
      {this.accountId,
      this.firstName,
      this.middleName,
      this.lastName,
      this.phoneNo,
      this.address1,
      this.address2,
      this.postcode,
      this.city,
      this.emailId,
      this.password});

//  UpdateProfile .fromJson(Map<String, dynamic> json) {
//    accountId = json['AccountId'];
//    firstName = json['FirstName'];
//    middleName = json['MiddleName'];
//    lastName = json['LastName'];
//    phoneNo = json['PhoneNo'];
//    address1 = json['Address1'];
//    address2 = json['Address2'];
//    postcode = json['Postcode'];
//    city = json['City'];
//    emailId = json['EmailId'];
//    password = json['Password'];
//  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId ?? "";
    data['FirstName'] = this.firstName ?? "";
    data['MiddleName'] = this.middleName ?? "";
    data['LastName'] = this.lastName ?? "";
    data['PhoneNo'] = this.phoneNo ?? "";
    data['Address1'] = this.address1 ?? "";
    data['Address2'] = this.address2 ?? "";
    data['Postcode'] = this.postcode ?? "";
    data['City'] = this.city ?? "";
    data['EmailId'] = this.emailId ?? "";
    data['Password'] = this.password ?? "";
    return data;
  }
}
