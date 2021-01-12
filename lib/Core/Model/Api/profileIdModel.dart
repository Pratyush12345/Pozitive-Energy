import 'package:pozitive/Core/Model/sendable.dart';

class ProfileId extends Sendable {
  String accountId;

  ProfileId({
    this.accountId,
  });

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    return data;
  }
}
