import 'package:pozitive/Core/Model/sendable.dart';

class ChangePasswordCredential extends Sendable {
  String accountId;
  String password;
  String oldPassword;

  ChangePasswordCredential({this.accountId, this.password, this.oldPassword});

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Password'] = this.password;
    data['OldPassword'] = this.oldPassword;
    return data;
  }
}
