import 'package:flutter/material.dart';
import 'package:pozitive/Core/Model/Api/changePassword.dart';
import 'package:pozitive/Core/ViewModel/changePasswordViewModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/appbar.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Widget/bottonfram.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();

  bool _autovalidation = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<ChangePasswordViewModel>(
      builder: (context, model, child) {
        if (model.state == ViewState.BUSY) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar:
                appbar("Change Password", context, _scaffoldKey, false, false),
            body: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03,
                    right: MediaQuery.of(context).size.width * 0.03),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .07,
                        ),
                        textField(model.oldPassword, true, _autovalidation,
                            TextInputType.text, "Old Password", (value) {
                          if (value.isEmpty) {
                            return 'Please enter old password';
                          }
                          return null;
                        }, context),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        textField(model.newPassword, true, _autovalidation,
                            TextInputType.text, "New Password", (value) {
                          if (value.isEmpty) {
                            return 'Please enter new password';
                          } else if (value == model.oldPassword.text) {
                            return "Old and new Password can't be same";
                          }
                          return null;
                        }, context),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        textField(model.accountId, false, _autovalidation,
                            TextInputType.text, "Account Id", (value) {
                          if (value.isEmpty) {
                            return 'Please enter account Id';
                          }
                          return null;
                        }, context),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              child: buttonframewithresize(
                                  context, "Change Password", 0.55),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                if (_formKey.currentState.validate()) {
                                  model.changePassword(ChangePasswordCredential(
                                      accountId: model.accountId.text,
                                      oldPassword: model.oldPassword.text,
                                      password: model.newPassword.text));
                                }
                              },
                            ),
                            InkWell(
                              child:
                                  buttonframewithresize(context, "Back", 0.3),
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          );
        }
      },
    );
  }
}
