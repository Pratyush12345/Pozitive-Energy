import 'package:pozitive/Core/Model/sendable.dart';

class DashBoardDetailsCredential extends Sendable {
  String accountId;
  String pageNo;
  String noOfRows;
  String txtSearch;
  String strstatus;
  String type;

  DashBoardDetailsCredential(
      {this.accountId,
      this.pageNo,
      this.noOfRows,
      this.txtSearch,
      this.strstatus,
      this.type});

  /// Create the JSON required by Dayblizz API server for updating a post.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['PageNo'] = this.pageNo ?? "1";
    data['NoOfRows'] = this.noOfRows ?? "10";
    data['txtSearch'] = this.txtSearch ?? "";
    data['strstatus'] = this.strstatus.replaceAll(' ', '') ?? 'CNR';
    data['Type'] = this.type;
    return data;
  }
}
