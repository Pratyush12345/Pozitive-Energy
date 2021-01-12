import 'package:pozitive/Core/Model/sendable.dart';

class LogInCredential extends Sendable {
  String accountId;
  String password;

  LogInCredential({
    this.accountId,
    this.password,
  });

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Password'] = this.password;
    return data;
  }
}
