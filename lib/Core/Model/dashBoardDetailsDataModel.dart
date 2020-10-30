class DashBoardDetailDataModel {
  String accountId;
  String pageNo;
  String noOfRows;
  String nextPageAvail;
  String txtSearch;
  String strstatus;
  String type;
  bool bIsRestrictRefresh;
  String dteRestrictRefreshDate;
  String strGroupType;
  List<Lstgetdetail> lstgetdetail;

  DashBoardDetailDataModel(
      {this.accountId,
        this.pageNo,
        this.noOfRows,
        this.nextPageAvail,
        this.txtSearch,
        this.strstatus,
        this.type,
        this.bIsRestrictRefresh,
        this.dteRestrictRefreshDate,
        this.strGroupType,

        this.lstgetdetail});

  DashBoardDetailDataModel.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    pageNo = json['PageNo'];
    noOfRows = json['NoOfRows'];
    nextPageAvail = json['NextPageAvail'];
    txtSearch = json['txtSearch'];
    strstatus = json['strstatus'];
    type = json['Type'];
    bIsRestrictRefresh = json['bIsRestrictRefresh'];
    dteRestrictRefreshDate = json['dteRestrictRefreshDate'];
    strGroupType = json['strGroupType'];
    if (json['lstgetdetail'] != null) {
      lstgetdetail = new List<Lstgetdetail>();
      json['lstgetdetail'].forEach((v) {
        lstgetdetail.add(new Lstgetdetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['PageNo'] = this.pageNo;
    data['NoOfRows'] = this.noOfRows;
    data['NextPageAvail'] = this.nextPageAvail;
    data['txtSearch'] = this.txtSearch;
    data['strstatus'] = this.strstatus;
    data['Type'] = this.type;
    data['bIsRestrictRefresh'] = this.bIsRestrictRefresh;
    data['dteRestrictRefreshDate'] = this.dteRestrictRefreshDate;
    data['strGroupType'] = this.strGroupType;
    if (this.lstgetdetail != null) {
      data['lstgetdetail'] = this.lstgetdetail.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lstgetdetail {
  int intId;
  int intGroupId;
  String nosCustomer;
  String strGroupname;
  String dteRequestedDateGroup;
  String businessName;
  String dteRequestedDate;
  String strEmailId;
  String phoneNo;
  String dteCreatedDate;
  String bgColor;
  String strLastAccess;
  String strBrokername;
  bool lastMsgRead;
  String strManualStatus;
  int bteShowRefreshbutton;
  int bteShowOptions;
  String dteQuotedDate;
  String quotedDate;
  String colapseTime;
  bool isSelcted;
  bool click;

  Lstgetdetail(
      {this.intId,
        this.intGroupId,
        this.nosCustomer,
        this.strGroupname,
        this.dteRequestedDateGroup,
        this.businessName,
        this.dteRequestedDate,
        this.strEmailId,
        this.phoneNo,
        this.dteCreatedDate,
        this.bgColor,
        this.strLastAccess,
        this.strBrokername,
        this.lastMsgRead,
        this.strManualStatus,
        this.bteShowRefreshbutton,
        this.bteShowOptions,
        this.dteQuotedDate,
        this.quotedDate,
        this.colapseTime,this.isSelcted:false,this.click:false});

  Lstgetdetail.fromJson(Map<String, dynamic> json) {
    intId = json['intId'];
    intGroupId = json['intGroupId'];
    nosCustomer = json['NosCustomer']??'';
    strGroupname = json['strGroupname'];
    dteRequestedDateGroup = json['dteRequestedDateGroup'];
    businessName = json['Business_Name']??'';
    dteRequestedDate = json['dteRequestedDate']??'';
    strEmailId = json['strEmailId']??'';
    phoneNo = json['PhoneNo'];
    dteCreatedDate = json['dteCreatedDate'];
    bgColor = json['bgColor'];
    strLastAccess = json['strLastAccess'];
    strBrokername = json['strBrokername'];
    lastMsgRead = json['LastMsgRead'];
    strManualStatus = json['strManualStatus']??'';
    bteShowRefreshbutton = json['bteShowRefreshbutton'];
    bteShowOptions = json['bteShowOptions'];
    dteQuotedDate = json['dteQuotedDate'];
    quotedDate = json['QuotedDate'];
    colapseTime = json['ColapseTime'];
    isSelcted=json['isSlected']??false;
    click=json['click']??false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intId'] = this.intId;
    data['intGroupId'] = this.intGroupId;
    data['NosCustomer'] = this.nosCustomer;
    data['strGroupname'] = this.strGroupname;
    data['dteRequestedDateGroup'] = this.dteRequestedDateGroup;
    data['Business_Name'] = this.businessName;
    data['dteRequestedDate'] = this.dteRequestedDate;
    data['strEmailId'] = this.strEmailId;
    data['PhoneNo'] = this.phoneNo;
    data['dteCreatedDate'] = this.dteCreatedDate;
    data['bgColor'] = this.bgColor;
    data['strLastAccess'] = this.strLastAccess;
    data['strBrokername'] = this.strBrokername;
    data['LastMsgRead'] = this.lastMsgRead;
    data['strManualStatus'] = this.strManualStatus;
    data['bteShowRefreshbutton'] = this.bteShowRefreshbutton;
    data['bteShowOptions'] = this.bteShowOptions;
    data['dteQuotedDate'] = this.dteQuotedDate;
    data['QuotedDate'] = this.quotedDate;
    data['ColapseTime'] = this.colapseTime;
    data["isSlected"]==null?false:data["isSlected"]=this.isSelcted;
    data['click']==null?false:data['click']=this.click;
    return data;
  }
}