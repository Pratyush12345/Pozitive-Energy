class DashBoardModel {
  String accountId;
  int upderProcessCount;
  int requestedQuoteCount;
  int quotedCount;
  int requestedReQuoteCount;
  int requotedCount;
  int acceptedCount;
  int contractSendNotReceivedCount;
  int upderProcessGroupCount;
  int requestedQuoteGroupCount;
  int quotedGroupCount;
  int requestedReQuoteGroupCount;
  int requotedGroupCount;
  int acceptedGroupCount;
  int contractSendNotReceivedGroupCount;

  DashBoardModel(
      {this.accountId,
        this.upderProcessCount,
        this.requestedQuoteCount,
        this.quotedCount,
        this.requestedReQuoteCount,
        this.requotedCount,
        this.acceptedCount,
        this.contractSendNotReceivedCount,
        this.upderProcessGroupCount,
        this.requestedQuoteGroupCount,
        this.quotedGroupCount,
        this.requestedReQuoteGroupCount,
        this.requotedGroupCount,
        this.acceptedGroupCount,
        this.contractSendNotReceivedGroupCount});

  DashBoardModel.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    upderProcessCount = json['UpderProcessCount'];
    requestedQuoteCount = json['RequestedQuoteCount'];
    quotedCount = json['QuotedCount'];
    requestedReQuoteCount = json['RequestedReQuoteCount'];
    requotedCount = json['RequotedCount'];
    acceptedCount = json['AcceptedCount'];
    contractSendNotReceivedCount = json['ContractSendNotReceivedCount'];
    upderProcessGroupCount = json['UpderProcessGroupCount'];
    requestedQuoteGroupCount = json['RequestedQuoteGroupCount'];
    quotedGroupCount = json['QuotedGroupCount'];
    requestedReQuoteGroupCount = json['RequestedReQuoteGroupCount'];
    requotedGroupCount = json['RequotedGroupCount'];
    acceptedGroupCount = json['AcceptedGroupCount'];
    contractSendNotReceivedGroupCount =
    json['ContractSendNotReceivedGroupCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['UpderProcessCount'] = this.upderProcessCount;
    data['RequestedQuoteCount'] = this.requestedQuoteCount;
    data['QuotedCount'] = this.quotedCount;
    data['RequestedReQuoteCount'] = this.requestedReQuoteCount;
    data['RequotedCount'] = this.requotedCount;
    data['AcceptedCount'] = this.acceptedCount;
    data['ContractSendNotReceivedCount'] = this.contractSendNotReceivedCount;
    data['UpderProcessGroupCount'] = this.upderProcessGroupCount;
    data['RequestedQuoteGroupCount'] = this.requestedQuoteGroupCount;
    data['QuotedGroupCount'] = this.quotedGroupCount;
    data['RequestedReQuoteGroupCount'] = this.requestedReQuoteGroupCount;
    data['RequotedGroupCount'] = this.requotedGroupCount;
    data['AcceptedGroupCount'] = this.acceptedGroupCount;
    data['ContractSendNotReceivedGroupCount'] =
        this.contractSendNotReceivedGroupCount;
    return data;
  }
}