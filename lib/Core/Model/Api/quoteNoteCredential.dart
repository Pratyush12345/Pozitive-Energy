
import 'package:pozitive/Core/Model/sendable.dart';

class QuoteNoteCredential extends Sendable {
  String accountId;
  String quoteid;

  QuoteNoteCredential({
    this.accountId,
    this.quoteid,
  });

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Quoteid'] = this.quoteid;
    return data;
  }
}