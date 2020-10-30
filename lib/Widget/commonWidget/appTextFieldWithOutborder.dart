import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFieldWithOutBorder extends StatelessWidget {
  TextEditingController controller;
  bool obscureText;
  bool autoValidation;
  TextInputType textInputType;
  String hintText;
  FormFieldValidator validator;
  List<TextInputFormatter> textInputFormatter;
  AppTextFieldWithOutBorder({this.textInputFormatter,this.validator,this.textInputType,this.controller,this.hintText,this.autoValidation,this.obscureText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText??false,
      autovalidate: autoValidation??false,
      keyboardType: textInputType,
      textCapitalization: TextCapitalization.words,
      autofocus: false,
      inputFormatters: textInputFormatter,

      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey,fontSize: MediaQuery.of(context).size.height*0.02),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.transparent)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.transparent,width: 1)),

        hintText: hintText??'',
        contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      ),
      validator: validator,
    );
  }
}
