import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Core/Model/Api/credentialLogin.dart';

import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/ViewModel/logInProvider.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';

import 'package:pozitive/Pages/homepage.dart';
import 'package:pozitive/Util/Pref.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:pozitive/Widget/bottonfram.dart';
import 'package:pozitive/Widget/checkboxwidget.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Pages/forgotPassword.dart';
class LogInPage extends StatefulWidget {
  static User user;
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  TextEditingController idcontroller= TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  bool _autovalidation=false;

  bool rememberme=false;



  Future<bool> _willPopCallback() async {
    exit(0);
    return true; // return true if the route to be popped
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop:_willPopCallback ,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BaseView<LogInModel>(
          builder: (context,model,child){
            if(model.state==ViewState.BUSY){

              return Center(
                child: CircularProgressIndicator(),
              );

            }else{
              return Padding(
                padding:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1),
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height:MediaQuery.of(context).size.height*.27,
                      child: Image.asset("assets/PozitiveLogo.png",scale: 5.3,),
                    ),
                    Text("Account ID :",style: TextStyle(fontSize: titlefontSize(context)),),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),

                    textField(idcontroller,false,_autovalidation,TextInputType.text,"Account ID",
                            (value) {
                          if (value.isEmpty) {
                            return 'Please enter Account ID';
                          }
                          return null;
                        },context),
                    SizedBox(
                      height:MediaQuery.of(context).size.height*.03,
                    ),
                    Text("Password :",style: TextStyle(fontSize: titlefontSize(context)),),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),

                    textField(passwordcontroller,true,_autovalidation,TextInputType.text,"Password",
                            (value) {
                          if (value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },context),
                    SizedBox(
                      height:MediaQuery.of(context).size.height*.03,
                    ),
                    InkWell(child: buttonframe(context,"LOGIN"),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){


                      model.login(LogInCredential(
                        accountId: idcontroller.text,
                        password: passwordcontroller.text
                      )).then((user){
                        print("#####@@@@@@@@@@########${user.userName}");
                        if(user!=null){
                          Prefs.setUserProfile(user);
                          Navigator.of(context).pushNamed(HomePage.routeName);

                        }

                      });

                      },),
                    SizedBox(
                      height:MediaQuery.of(context).size.height*.04,
                    ),
                    Row(
                      children: <Widget>[
                        rememberme?InkWell(child: Icon(Icons.check_box),
                          onTap: (){
                            setState(() {
                              rememberme=!rememberme;
                            });
                          },):InkWell(child: Icon(Icons.check_box_outline_blank,),
                          onTap: (){
                            setState(() {
                              rememberme=!rememberme;
                            });
                          },),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.025,
                        ),
                        Text("Remember Me",style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1),fontSize: MediaQuery.of(context).size.height*.02),),
                        Spacer(),
                        InkWell(
                          child: Text("Forgot password?",style: TextStyle(color: Color.fromRGBO(128, 189, 40, 1),fontSize: MediaQuery.of(context).size.height*.02)),
                          onTap: (){
                            Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>ForgotPasswordPage()));
                          },

                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.04,
                        ),

                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Copyright",style: TextStyle(color: Color.fromRGBO(71, 71, 71, 1),fontSize: MediaQuery.of(context).size.height*.02),),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.03,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.height*.025,
                          height: MediaQuery.of(context).size.height*.025,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Color.fromRGBO(114, 114, 114, 1))
                          ),
                          child: Center(
                            child: Text("C",style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.015,color: Color.fromRGBO(71, 71, 71, 1)),),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.02,
                        ),
                        Text("POZITIVE ENERGY 2020",style: TextStyle(color: Color.fromRGBO(71, 71, 71, 1),fontSize: MediaQuery.of(context).size.height*.02),),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    Center(child: Text("Reg No:09523048",style: TextStyle(color: Color.fromRGBO(71, 71, 71, 1),fontSize: MediaQuery.of(context).size.height*.02),)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.005,
                    ),
                    Center(child: Text("ISO Certificate No:15930-ISMS-001",style: TextStyle(color: Color.fromRGBO(71, 71, 71, 1),fontSize: MediaQuery.of(context).size.height*.02),)),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
