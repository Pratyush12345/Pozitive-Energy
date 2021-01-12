import 'package:pozitive/Core/Model/sendable.dart';

class AddQuoteNoteCredential extends Sendable {
  String accountId;
  String quoteid;
  String notesText;

  AddQuoteNoteCredential({this.accountId, this.quoteid, this.notesText});

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['Quoteid'] = this.quoteid;
    data['NotesText'] = this.notesText;
    return data;
  }
}
