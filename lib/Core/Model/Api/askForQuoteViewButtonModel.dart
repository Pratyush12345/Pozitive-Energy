import 'package:pozitive/Core/Model/sendable.dart';

class AskForQuoteViewButtonModel extends Sendable {
  String accountId;
  String type;
  String quoteId;

  AskForQuoteViewButtonModel({this.accountId, this.quoteId, this.type});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = accountId;
    data['Type'] = type;
    data['Quoteid'] = quoteId;
    return data;
  }
}
