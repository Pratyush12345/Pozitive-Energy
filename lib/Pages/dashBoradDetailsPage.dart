import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/assetApp.dart';
import 'package:pozitive/Core/Model/Api/dashBoadDetailCredential.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/AuthService.dart';
import 'package:pozitive/Core/ViewModel/dashBoardDetailsViewModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/commonWidget/paginationwidget.dart';
import 'package:pozitive/Widget/customswitch.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:provider/provider.dart';
class DeshbordDetailsPage extends StatelessWidget {
  String title;
  String type;
  int totalItem;
  DeshbordDetailsPage({this.title,this.type,this.totalItem:2});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(value: AutService().user,
      initialData: User(),
      child: DeshbordDetails(title: title,type: type,totleItem: totalItem,),);
  }
}
class DeshbordDetails extends StatefulWidget {
  String title;
  String type;
  int totleItem;
  DeshbordDetails({this.title,this.type,this.totleItem});
  @override
  _DeshbordDetailsPageState createState() => _DeshbordDetailsPageState();
}

class _DeshbordDetailsPageState extends State<DeshbordDetails> {
  
  int page=1;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List assginuserlist=[
    "Abc","Gdgd","Xyz"
  ];
  TextEditingController assignusercontroller=TextEditingController();
  TextEditingController searchcontroller=TextEditingController();
  Widget userview(){
    return  ListView.builder(shrinkWrap:true,itemCount: assginuserlist.length,itemBuilder: (BuildContext context,int index){
      return Container(
        child: ListTile(
          title: Text(assginuserlist[index],style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: (){
            setState(() {
              assignusercontroller.text=assginuserlist[index];
            });

            Navigator.pop(context);
          },
        ),
      );
    });
  }
ThemeApp themeApp=ThemeApp();

  List requestedlist=[
    {
      "Status":"Amber",
      "Timer":"18:15",
      "No":"l155455",
      "partner_name":"Black Sheep Utitlities",
      "Last Access":"Quotes Support",
      "Business_name":"Mr M F and Mrs H E Way ta Way Fuels",
      "Required By Date":"02/12/2019",
      "Created/Rerequested Date":"02/12/2019 08:20:16"
    }
  ];
  List viewlist=[];

  bool isSwitched = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 20; i++) {
      setState(() {
        viewlist.add({
          "view":false,
          "click":false,
          "checkbox":false
        });
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);
    return user.accountId!=null?BaseView<DashBoardDetailsViewModel>(
      onModelReady: (model)=>model.getDashBoardDetails(DashBoardDetailsCredential(
        accountId: user.accountId,
        type: widget.type!=null?widget.type.toLowerCase():"",
        strstatus: widget.title=="Contract send but not received"?"CNR":widget.title==null?"CNR":widget.title,
        noOfRows: '10',
        txtSearch: ''

      )),
      builder: (context,model,child){
        if(model.state==ViewState.BUSY){
          return Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          );
        }else{
          return Scaffold(
            key: _scaffoldKey,
            appBar:appbar("${widget.type}(${widget.title})",context,_scaffoldKey, true,true),
            drawer: DrawerWidget(),
            body: ListView(
              children: <Widget>[
//                widget.type==AppString.group?Container():Container(
//                  color: Colors.white,
//                  child: Padding(
//                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*.02),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        InkWell(
//                          child: SizedBox(
//                            height: MediaQuery.of(context).size.height*.05,
//                            width: MediaQuery.of(context).size.width*.5,
//                            child: dropdowntextfield(assignusercontroller,false,false,TextInputType.text,"Assign User",
//                                    (value) {
//                                  if (value.isEmpty) {
//                                    return 'Please Select User';
//                                  }
//                                  return null;
//                                },context),
//                          ),
//                          onTap: (){
//                            FocusScope.of(context).requestFocus(FocusNode());
//                            showDialog(context: context,child:Dialog(
//                              child: Column(
//                                mainAxisSize: MainAxisSize.min,
//                                children: <Widget>[
//                                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
//                                  Text("Select User",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.03),),
//                                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//                                  Container(
//                                    width: MediaQuery.of(context).size.width,
//                                    height: 1,
//                                    color: Colors.grey.withOpacity(.2),
//                                  ),
//
//                                  Container(
//                                    child:  userview(),
//                                  )
//
//                                ],
//                              ),
//
//                            ));
//                          },
//                        ),
//                        Container(
//                          width: MediaQuery.of(context).size.width*.2,
//                          height: MediaQuery.of(context).size.height*0.05,
//                          child: Center(
//                            child: Text("OWN",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.017,
//                                fontWeight: FontWeight.bold),),
//                          ),
//                          decoration: BoxDecoration(
//                              color: Color.fromRGBO(155, 119, 217, 1),
//                              borderRadius: BorderRadius.circular(30)
//                          ),
//                        ),
//                        Container(
//                          width: MediaQuery.of(context).size.width*.2,
//                          height: MediaQuery.of(context).size.height*0.05,
//                          child: Center(
//                            child: Text("ASSIGN",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.017,
//                                fontWeight: FontWeight.bold),),
//                          ),
//                          decoration: BoxDecoration(
//                              color: Color.fromRGBO(155, 119, 217, 1),
//                              borderRadius: BorderRadius.circular(30)
//                          ),
//                        ),
//
//                      ],
//                    ),
//                  ),
//                ),

                Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width*.02,left: MediaQuery.of(context).size.width*.02,right: MediaQuery.of(context).size.width*.02),
                  child: TextField(
                    controller: searchcontroller,
                    onSubmitted: (val){
                      model.getDashBoardDetails(DashBoardDetailsCredential(
                        accountId: user.accountId,
                        txtSearch: val,
                        type: widget.type=="Individual"?"individual":"group",
                        strstatus: widget.title=="Contract send but not received"?"CNR":widget.title,
                      ));

                    },
                    decoration: InputDecoration(
                        suffixIcon: Image.asset("assets/search.png",scale: 10,),
                        hintText: "Search here..."
                    ),
                  ),),
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*.02,right: MediaQuery.of(context).size.width*.02),
                  child: Column(
                    children: <Widget>[
                      Container(
//                  width: MediaQuery.of(context).size.width,
                        color: Color.fromRGBO(48, 142, 58, 1),
                        child: Padding(
                          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01,bottom:  MediaQuery.of(context).size.height*0.01),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width*.25,
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*.02,
                                    ),
//                                    Icon(Icons.check_box_outline_blank,color: Colors.white,),
//                                    SizedBox(
//                                      width: MediaQuery.of(context).size.width*.02,
//                                    ),
                                    Text(AppString.no,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),)
                                  ],
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width*.17,
                                  child: Text(AppString.status,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),)
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width*.26,
                                  child: Text(AppString.partnerName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),)
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width*.28,
                                  child: Text(AppString.action,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.02),)
                              )
                            ],
                          ),
                        ),
                      ),
                      ListView.builder(padding: EdgeInsets.all(0),physics: NeverScrollableScrollPhysics(),shrinkWrap: true,
                          itemCount: model.dashBoardDetailDataModel.lstgetdetail.length,itemBuilder: (BuildContext context,int index){
                        return Column(
                          children: <Widget>[
                            Container(
//                  width: MediaQuery.of(context).size.width,
                              color: index.isOdd?Colors.white:Color.fromRGBO(237, 243, 231, 1),
                              child: Padding(
                                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01,bottom:  MediaQuery.of(context).size.height*0.01),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width*.25,
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*.02,
                                          ),
//                                          InkWell(child: Padding(
//                                            padding:  EdgeInsets.all(MediaQuery.of(context).size.width*.02),
//                                            child: model.dashBoardDetailDataModel.lstgetdetail[index].isSelcted?Icon(Icons.check_box,color: Colors.black45,size: MediaQuery.of(context).size.width*0.04,):Icon(Icons.check_box_outline_blank,color: Colors.black45,size: MediaQuery.of(context).size.width*0.04,),
//                                          ),
//                                            onTap: (){
//                                              setState(() {
//                                                model.dashBoardDetailDataModel.lstgetdetail[index].isSelcted=!model.dashBoardDetailDataModel.lstgetdetail[index].isSelcted;
//                                              });
//                                            },),
//                                          SizedBox(
//                                            width: MediaQuery.of(context).size.width*.02,
//                                          ),
                                          Text(widget.type==AppString.group?"G${model.dashBoardDetailDataModel.lstgetdetail[index].intGroupId}":
                                          "I${model.dashBoardDetailDataModel.lstgetdetail[index].intId}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),)
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width*.17,
                                        child: Text("${model.dashBoardDetailDataModel.lstgetdetail[index].strManualStatus}",style: TextStyle(color: Colors.amber,fontSize: MediaQuery.of(context).size.width*0.029),)
                                    ),
                                    InkWell(
                                      child: Container(
                                          width: MediaQuery.of(context).size.width*.26,
                                          child: Text("${model.dashBoardDetailDataModel.lstgetdetail[index].strBrokername}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.029),)
                                      ),
                                      onTap: (){
                                        setState(() {
                                          model.dashBoardDetailDataModel.lstgetdetail[index].click=! model.dashBoardDetailDataModel.lstgetdetail[index].click;
                                        });
                                      },
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width*.28,
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Image.asset(AppAssets.view,scale: 12,),
                                            Text(AppString.view,style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,color: themeApp.purplecolor),),

                                            Transform.scale(
                                              scale: .7,
                                              child: CustomSwitch(
                                                value:   model.dashBoardDetailDataModel.lstgetdetail[index].click ,
                                                onChanged: (bool val){
                                                  setState(() {
                                                    model.dashBoardDetailDataModel.lstgetdetail[index].click = val;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                            model.dashBoardDetailDataModel.lstgetdetail[index].click?Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(243, 249, 237, 1),
                                  border: Border.all(color: Colors.grey.withOpacity(.5))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          child: Text(AppString.status,textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027,)),
                                          width: MediaQuery.of(context).size.width*0.46,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*.03,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width*0.46,
                                            child: Text( model.dashBoardDetailDataModel.lstgetdetail[index].strManualStatus,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width*0.46,
                                            child: Text(AppString.timer,textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*.03,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width*0.46,
                                            child: Text( model.dashBoardDetailDataModel.lstgetdetail[index].colapseTime,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width*0.46,
                                            child: Text(AppString.no,textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*.03,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width*0.46,
                                            child: Text(widget.type==AppString.group?"G${model.dashBoardDetailDataModel.lstgetdetail[index].intGroupId}":"I${model.dashBoardDetailDataModel.lstgetdetail[index].intId}",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*0.46,
                                          child: Text(AppString.partnerName,textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027)),),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*.03,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width*0.46,
                                            child: Text( model.dashBoardDetailDataModel.lstgetdetail[index].strBrokername,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width*0.46,child: Text("Last Access",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027,fontWeight: FontWeight.bold))),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*.03,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width*0.46,
                                            child: Text( model.dashBoardDetailDataModel.lstgetdetail[index].strLastAccess,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(width: MediaQuery.of(context).size.width*0.46,
                                            child: Text(AppString.businessName,textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.width*0.027))),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*.03,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width*0.46,
                                            child: Text( model.dashBoardDetailDataModel.lstgetdetail[index].businessName,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width*0.46,
                                            child: Text(AppString.requiredByDate,textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027,fontWeight: FontWeight.bold))),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*.03,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width*0.46,
                                            child: Text( model.dashBoardDetailDataModel.lstgetdetail[index].dteRequestedDate,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01,top:  MediaQuery.of(context).size.height*0.01),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width*0.46,
                                            child: Text(AppString.createdRerequestedDate,textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027,fontWeight: FontWeight.bold))),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width*.03,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context).size.width*0.46,
                                            child: Text( model.dashBoardDetailDataModel.lstgetdetail[index].dteCreatedDate,style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width*0.027)))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ):Container()
                          ],
                        );
                      })

                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.022,
                ),
                widget.totleItem>0?Paginationwidget(curentpage:page ,totalItem: widget.totleItem,perpage: model.dashBoardDetailDataModel.noOfRows!=null?int.parse(model.dashBoardDetailDataModel.noOfRows):1,
                selectDecreaseFunction: (){
                  if(page>1){
                    setState(() {
                      page--;

                    });
                    model.getDashBoardDetails(DashBoardDetailsCredential(
                        accountId: user.accountId,
                        type: widget.type.toLowerCase(),
                        strstatus: widget.title=="Contract send but not received"?"CNR":widget.title,
                        pageNo: "$page",

                    ));

                  }
                },selectIndexFunction: (value){
                    model.getDashBoardDetails(DashBoardDetailsCredential(
                        accountId: user.accountId,
                        type: widget.type.toLowerCase(),
                        strstatus: widget.title=="Contract send but not received"?"CNR":widget.title,
                        pageNo: "$value"
                    ));
                    setState(() {
                      page=value;
                    });

                  },selectIncreaseFunction: (){
                  if(page<widget.totleItem){
                    setState(() {
                      page++;

                    });
                    model.getDashBoardDetails(DashBoardDetailsCredential(
                        accountId: user.accountId,
                        type: widget.type.toLowerCase(),
                        strstatus: widget.title=="Contract send but not received"?"CNR":widget.title,
                        pageNo: "$page"
                    ));
                  }

                  },):Container(),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.022,
                ),
              ],
            ),



          );
        }
      },
    ):Scaffold(body: Center(child: CircularProgressIndicator(),),);
  }
}
