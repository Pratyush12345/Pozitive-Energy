import 'package:pozitive/Core/Model/sendable.dart';

class ProfileEmailId extends Sendable {
  String emailId;

  ProfileEmailId({
    this.emailId,
  });

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmailId'] = this.emailId;
    return data;
  }
}
