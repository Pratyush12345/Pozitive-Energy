import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appConstant.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Core/Model/Api/profileIdModel.dart';
import 'package:pozitive/Core/Model/Api/updateProfileModel.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/AuthService.dart';
import 'package:pozitive/Core/ViewModel/profileProvideModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/TextField/innerTextField.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Widget/bottonfram.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:pozitive/Widget/drawerwidget.dart';
import 'package:pozitive/Widget/toastMessage.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(value: AutService().user,
      initialData: User(),
      child: ProfileView(),);
  }
}



class ProfileView extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileView> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController firstName= TextEditingController();
  TextEditingController middleName= TextEditingController();
  TextEditingController lastName= TextEditingController();
  TextEditingController telephone= TextEditingController();
  TextEditingController address1= TextEditingController();
  TextEditingController address2= TextEditingController();
  TextEditingController postcode= TextEditingController();
  TextEditingController city= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  String phoneNumber;
  String phoneIsoCode;
  bool _autovalidation=false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onPhoneNumberChange(String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }


  @override
  Widget build(BuildContext context) {
    final user= Provider.of<User>(context);
    return BaseView<ProfileProviderModel>(
      onModelReady: (model)=>model.getProfileDetails(),
      builder: (context,model,child){
        if(model.state==ViewState.BUSY){
          return Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          );
        }else{
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            appBar:appbar("Profile",context,_scaffoldKey,true,true),
            drawer: DrawerWidget(),
            body: Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03,right: MediaQuery.of(context).size.width * 0.03),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height:MediaQuery.of(context).size.height*.04,
                        ),
                        RichText(
                          text: TextSpan(
                            text: AppString.firstName,
                            style: TextStyle(fontSize: titlefontResize(context,0.015),color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: ' \*',style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                        InnerTextField(
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.text,
                          hintText: AppString.firstName,
                          intialvalue: model.user.firstName,
                          controller: firstName,
                          validator: (val){
                            if(val.isEmpty){
                              return 'Please enter FirstName';
                            }else{
                              return null;
                            }
                          },

                        ),
                        Text(AppString.middleName,style: TextStyle(fontSize: titlefontResize(context,0.015),color: Colors.black),),
                        SizedBox(
                          height: SizeConfig.screenHeight*.01,
                        ),
                        InnerTextField(

                          textInputType: TextInputType.text,
                          hintText: AppString.middleName,
                          intialvalue: model.user.middleName,
                          controller: middleName,

                        ),


                        RichText(
                          text: TextSpan(
                            text: AppString.lastName,
                            style: TextStyle(fontSize: titlefontResize(context,0.015),color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: ' \*',style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                        InnerTextField(
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.text,
                          hintText: AppString.lastName,
                          intialvalue: model.user.lastName,
                          controller: lastName,
                          validator: (val){
                            if(val.isEmpty){
                              return 'Please enter LastName';
                            }else{
                              return null;
                            }
                          },

                        ),


                        Text(AppString.telePhoneNumber,style: TextStyle(fontSize: titlefontResize(context,0.015),color: Colors.black),),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),

                        Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width*.12,
                              height: MediaQuery.of(context).size.width*.12,
                              child: Center(
                                child: Text("44"),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.5),
                                // border: Border.all(color:theme.textfieldbordercolor),


                              ),
                            ),
                            SizedBox(
                              width:  MediaQuery.of(context).size.width*.818,
                              child:
                              InnerTextField(
                                enablepadding: false,

                                textInputType: TextInputType.text,
                                hintText: AppString.telePhoneNumber,
                                intialvalue: model.user.phoneNo,
                                controller: telephone,

                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height:MediaQuery.of(context).size.height*.03,
                        ),
                        Text(AppString.address1,style: TextStyle(fontSize: titlefontResize(context,0.015),color: Colors.black),),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                        InnerTextField(

                          textInputType: TextInputType.text,
                          hintText: AppString.address1,
                          intialvalue: model.user.address1,
                          controller: address1,

                        ),

                        Text(AppString.address2,style: TextStyle(fontSize: titlefontResize(context,0.015),color: Colors.black),),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                        InnerTextField(

                          textInputType: TextInputType.text,
                          hintText: AppString.address2,
                          intialvalue: model.user.address2,
                          controller: address2,

                        ),


                        RichText(
                          text: TextSpan(
                            text: AppString.postCode,
                            style: TextStyle(fontSize: titlefontResize(context,0.015),color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: ' \*',style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                        InnerTextField(

                          textInputType: TextInputType.text,
                          hintText: AppString.postCode,
                          intialvalue: model.user.postcode,
                          controller: postcode,

                        ),

                        Text(AppString.city,style: TextStyle(fontSize: titlefontResize(context,0.015),color: Colors.black),),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                        InnerTextField(

                          textInputType: TextInputType.text,
                          hintText: AppString.city,
                          intialvalue: model.user.city,
                          controller: city,

                        ),

                        RichText(
                          text: TextSpan(
                            text: AppString.emailAddess,
                            style: TextStyle(fontSize: titlefontResize(context,0.015),color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: ' \*',style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                        InnerTextField(
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.text,
                          intialvalue: model.user.emailId!=null?model.user.emailId:"",
                          hintText: AppString.emailAddess,
                          controller: email,
                          validator: (val){
                            if(val.isEmpty){
                              return 'Please enter email';
                            }else{
                              return null;
                            }
                          },


                        ),
                        RichText(
                          text: TextSpan(
                            text: AppString.password,
                            style: TextStyle(fontSize: titlefontResize(context,0.015),color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: ' \*',style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                        InnerTextField(
                          autoValidation: _autovalidation,
                          textInputType: TextInputType.text,
                          hintText: AppString.password,
                          controller: password,
                          validator: (val){
                            if(val.isEmpty){
                              return 'Please enter password';
                            }else{
                              return null;
                            }
                          },

                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(child: buttonframewithresize(context,"Update",0.45),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: (){
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  model.updateProfile(UpdateProfile(
                                      accountId: user.accountId,
                                      firstName: firstName.text,
                                      lastName: lastName.text,
                                      middleName: middleName.text,
                                      phoneNo:telephone.text,
                                      address1: address1.text,
                                      address2: address2.text,
                                      postcode: postcode.text,
                                      city: city.text,
                                      emailId: email.text,
                                      password: password.text
                                  )).then((value) {
                                    print(value);
                                    if(value["status"]=="1"){
                                      successToast(value['msg']);
                                    }else{
                                      showToast(value['msg']);
                                    }
                                  });
                                } else {
//    If all data are not valid then start auto validation.
                                  setState(() {
                                    _autovalidation = true;
                                  });
                                }


                              },

                            ),
                            InkWell(child: buttonframewithresize(context,"Clear",0.45),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: (){
                              AppConstant.showComfirmDialogue(mainContext: context,function: (){
                                firstName.text = '';
                                middleName.text = '';
                                lastName.text = '';
                                phoneNumber = '';
                                telephone.clear();
                                address1.text = '';
                                address2.text = '';
                                postcode.text = '';
                                city.text = '';
                                email.text = '';
                                password.text = '';

                              });



                              },),
                          ],
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height*.05,
                        ),
                      ],
                    ),
                  ),
                )

            ) ,
          );
        }
      },
    );
  }
}
