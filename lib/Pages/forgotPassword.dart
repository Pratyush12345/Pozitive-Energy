import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/emailIdModel.dart';
import 'package:pozitive/Core/ViewModel/forgotPasswordViewModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Widget/bottonfram.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Pages/changePassWordPage.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController email= TextEditingController();

  bool _autovalidation=false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordViewModel>(
      builder: (context,model,child){
        if(model.state==ViewState.BUSY){
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }else{
          return Scaffold(
            backgroundColor: Colors.white,
            appBar:appbar("Forgot Password",context,_scaffoldKey, false,false),
            body: Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03,right: MediaQuery.of(context).size.width * 0.03),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height:MediaQuery.of(context).size.height*.03,
                      ),
                      Text("Please enter registered email-id to recover your password.",style: TextStyle(fontSize: titlefontSize(context)),),

                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.03,
                      ),
                      textFieldEmail(email,false,_autovalidation,TextInputType.emailAddress,"Email Id",
                              (value) {
                            if (value.isEmpty) {
                              return 'Please enter email id';
                            }
                            return null;
                          },context),
                      SizedBox(
                        height:MediaQuery.of(context).size.height*.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            child: Text("Change Password?",style: TextStyle(color: Color.fromRGBO(128, 189, 40, 1),fontSize: MediaQuery.of(context).size.height*.02)),
                            onTap: (){
                              Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>ChangePasswordPage())).then((value){
                                email.text = "";
                              });
                            },

                          ),
                        ],
                      ),
                      SizedBox(
                        height:MediaQuery.of(context).size.height*.03,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(child: buttonframewithresize(context,"Back To Login",0.45),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: (){
                              Navigator.of(context).pop();
                            },

                          ),
                          InkWell(child: buttonframewithresize(context,"Send Email",0.45),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: (){
                            model.forgotPassword(ProfileEmailId(
                              emailId: email.text
                            ));
                            },),
                        ],
                      )
                    ],
                  ),
                )

            ) ,
          );
        }
      },

    );
  }
}
