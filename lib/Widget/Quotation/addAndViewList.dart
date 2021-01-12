import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appString.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Core/Model/Api/addQuoteNoteCredential.dart';
import 'package:pozitive/Core/Model/Api/quoteNoteCredential.dart';
import 'package:pozitive/Core/Model/user.dart';
import 'package:pozitive/Core/Services/AuthService.dart';
import 'package:pozitive/Core/ViewModel/addAndViewNoteViewModel.dart';
import 'package:pozitive/Core/baseview.dart';
import 'package:pozitive/Core/enums/view_state.dart';
import 'package:pozitive/Widget/TextField/innerTextField.dart';
import 'package:pozitive/Widget/toastMessage.dart';
import 'package:provider/provider.dart';

class AddAndViewNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AutService().user,
      initialData: User(),
      child: AddAndViewNoteView(),
    );
  }
}

class AddAndViewNoteView extends StatefulWidget {
  @override
  _AddAndViewNoteState createState() => _AddAndViewNoteState();
}

class _AddAndViewNoteState extends State<AddAndViewNoteView> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user.accountId != null
        ? BaseView<AddandViewNoteViewModel>(
            onModelReady: (model) => model.getQuoteNoteList(QuoteNoteCredential(
                accountId: user.accountId, quoteid: '52264')),
            builder: (context, model, child) {
              if (model.state == ViewState.BUSY) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.screenHeight * .01,
                          bottom: SizeConfig.screenHeight * .01,
                          left: SizeConfig.screenWidth * .02),
                      child: Text(
                        AppString.notes,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey.withOpacity(.2),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.screenHeight * .01,
                          left: SizeConfig.screenWidth * .02,
                          right: SizeConfig.screenWidth * .02),
                      child: InnerTextField(
                        controller: _textEditingController,
                        maxline: 5,
                      ),
                    ),
                    SizedBox(
                      height: heightOfBox(model.quoteNote.notes.length),
                      child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: model.quoteNote.notes.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: SizeConfig.screenHeight * .01),
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.screenWidth * .02,
                                      right: SizeConfig.screenWidth * .02),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: Text(model
                                              .quoteNote.notes[index].strNote)),
                                      Text(
                                          "- ${model.quoteNote.notes[index].noteCreator}"),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * .01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * .02,
                          right: SizeConfig.screenWidth * .02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              model
                                  .uppdateQuoteNote(AddQuoteNoteCredential(
                                      accountId: user.accountId,
                                      quoteid: "52264",
                                      notesText: _textEditingController.text))
                                  .then((value) {
                                print('value===$value');
                                if (value['status'] == "1") {
                                  _textEditingController.clear();
                                  model.getQuoteNoteList(QuoteNoteCredential(
                                      accountId: user.accountId,
                                      quoteid: '52264'));
                                  successToast(value['msg']);
                                } else {
                                  showToast(value['msg']);
                                }
                              });
                            },
                            child: Text(
                              'ADD',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * .01,
                    ),
                  ],
                );
              }
            },
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}

double heightOfBox(int length) {
  if (length == 1) {
    return SizeConfig.screenHeight * .03;
  } else if (length == 2) {
    return SizeConfig.screenHeight * .06;
  } else if (length > 2) {
    return SizeConfig.screenHeight * .09;
  } else if (length == 0) {
    return 0.0;
  } else {
    return 0.0;
  }
}
