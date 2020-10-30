import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Util/theme.dart';

class InnerTextField extends StatefulWidget {
  TextEditingController controller;
  bool enablepadding;
  bool obsecureText;
  bool autoValidation;
  TextInputType textInputType;
  String hintText;
  String intialvalue;
  String errorText;
  int maxline;
  FormFieldValidator validator;
  InnerTextField({this.errorText,this.intialvalue,this.textInputType,this.controller,this.hintText,this.autoValidation:false,this.obsecureText:false,this.validator,this.enablepadding:true
  ,this.maxline:1});
  @override
  _InnerTextFieldState createState() => _InnerTextFieldState();
}

class _InnerTextFieldState extends State<InnerTextField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.intialvalue!=null){
      setState(() {
        widget.controller.text=widget.intialvalue;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  widget.enablepadding?EdgeInsets.only(
        bottom: SizeConfig.screenHeight*.03
      ):EdgeInsets.all(0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obsecureText,
        autovalidate: widget.autoValidation,
        keyboardType: widget.textInputType,
        textCapitalization: TextCapitalization.words,

        autofocus: false,
        maxLines: widget.maxline,

        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.grey,fontSize: MediaQuery.of(context).size.height*0.02),
          hintText: widget.hintText,
          contentPadding: EdgeInsets.fromLTRB(10.0, 10, 10.0, 10),
          border: OutlineInputBorder(borderSide: BorderSide(color: ThemeApp().innertextfieldbordercolor)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:  ThemeApp().innertextfieldbordercolor,width: 2)),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  ThemeApp().innertextfieldbordercolor,width: 2)),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color:  ThemeApp().innertextfieldbordercolor,width: 2)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  ThemeApp().innertextfieldbordercolor,width: 2)),
        ),
        validator: widget.validator,
      ),
    );
  }
}
