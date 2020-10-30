//
//
//class User {
//  String user_id;
//  String name;
//  String email;
//  String username;
//  String password;
//  String passcode;
//  String phone;
//  String firstname;
//  String lastname;
//  String profile_image;
//  String zipcode;
//  String address;
//  String city;
//  String state_id;
//  String sharelink;
//  String authentication_key;
//  String country_id;
//  String profession;
//  String user_type;
//
//  dynamic wishlist;
//  String birthday;
//  Set<int> wishlistSet;
//
//  User(
//      this.phone,
//      this.email,
//      this.username,
//      this.password,
//      this.passcode,
//      this.firstname,
//      this.lastname,
//      this.sharelink,
//      this.user_id,
//      this.profile_image,
//      this.name,
//      this.authentication_key,
//      this.address,
//      this.city,
//      this.zipcode,
//      this.wishlist,
//      this.birthday,
//      this.state_id,
//      this.country_id,
//      this.profession,
//      this.user_type);
//
//  User.map(dynamic json) {
//    this.user_id = json["user_id"].toString();
//    this.authentication_key = json["authentication_key"];
//    dynamic obj = json["data"];
//    this.name = obj["name"]!=null?obj["name"]:"";
//    this.email = obj["email"]!=null?obj["email"]:"";
//    this.username = obj["username"]!=null?obj["username"]:"";
//    this.phone = obj["phone"]!=null?obj["phone"]:"";
//    this.firstname = obj["first_name"]!=null?obj["first_name"]:"";
//    this.lastname = obj["last_name"]!=null?obj["last_name"]:"";
//    this.profile_image = obj["profile_image"]!=null?obj["profile_image"]:"";
//    this.sharelink = obj["sharelink"];
//    this.address = obj["address"];
//    this.city = obj["city"];
//    this.birthday=obj["date_of_birth"];
//    this.zipcode = obj["zipcode"];
//    this.passcode=obj["passcode"].toString();
//    this.wishlist = obj["wishlist"];
//    this.country_id=obj["country_id"].toString();
//    this.state_id = obj["state_id"].toString();
//    this.profession=obj["profession"].toString();
//    this.user_type=obj["user_type"].toString();
//
//  }
//
//  void reset() {
//    this.user_id = null;
//    this.name = null;
//    this.email = null;
//    this.username = null;
//    this.password = null;
//    this.passcode=null;
//    this.phone = null;
//    this.firstname = null;
//    this.lastname = null;
//    this.profile_image = null;
//    this.address = null;
//    this.birthday=null;
//    this.city = null;
//    this.state_id = null;
//    this.zipcode = null;
//    this.sharelink = null;
//    this.authentication_key = null;
//    this.wishlist = null;
//    this.wishlistSet = null;
//    this.profession=null;
//    this.user_type=null;
//  }
//
//  void updateProfile(dynamic obj) {
//    this.firstname = obj["first_name"];
//    this.lastname = obj["last_name"];
//    this.address = obj["address"];
//    this.city = obj["city"];
//    this.state_id = obj["state_id"];
//    this.zipcode = obj["zipcode"];
//    this.birthday = obj["date_of_birth"];
//  }
//
//
//
////
////  bool isFavorite(int id) {
////    return wishlistSet != null && wishlistSet.contains(id);
////  }
////
////  String getFavoriteCount() {
////    return wishlistSet != null && wishlistSet.length > 0
////        ? wishlistSet.length.toString()
////        : "0";
////  }
////
//  void setImage(String imageUrl) {
//    this.profile_image = imageUrl;
//  }
//}
class User {
  String accountId;
  String userName;
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

  User(
      {this.accountId,
        this.userName,
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

  User.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    userName=json['UserName'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    phoneNo = json['PhoneNo'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    postcode = json['Postcode'];
    city = json['City'];
    emailId = json['EmailId'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['UserName']=this.userName;
    data['FirstName'] = this.firstName;
    data['MiddleName'] = this.middleName;
    data['LastName'] = this.lastName;
    data['PhoneNo'] = this.phoneNo;
    data['Address1'] = this.address1;
    data['Address2'] = this.address2;
    data['Postcode'] = this.postcode;
    data['City'] = this.city;
    data['EmailId'] = this.emailId;
    data['Password'] = this.password;
    return data;
  }
//  toJson() {
//    return {
//
//      "AccountId": accountId,
//      "UserName": userName,
//      "FirstName": firstName,
//      "MiddleName": middleName,
//      "LastName": lastName,
//      "PhoneNo": phoneNo,
//      "Address1": address1,
//      "Address2": address2,
//      "Postcode": postcode,
//      "City": city,
//      "EmailId": emailId,
//      "Password": password,
//    };
//  }

}