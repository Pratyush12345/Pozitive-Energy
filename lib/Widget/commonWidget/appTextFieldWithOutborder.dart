import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFieldWithOutBorder extends StatelessWidget {
  TextEditingController controller;
  bool obscureText;
  bool autoValidation;
  TextInputType textInputType;
  String hintText;
  FormFieldValidator validator;
  FocusNode focusNode;
  FocusNode nextFocusNode;
  int maxLength;
  List<TextInputFormatter> textInputFormatter;

  AppTextFieldWithOutBorder({
    this.textInputFormatter,
    this.validator,
    this.textInputType,
    this.controller,
    this.hintText,
    this.autoValidation,
    this.obscureText,
    this.focusNode,
    this.nextFocusNode,
    this.maxLength,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      autovalidate: autoValidation ?? false,
      keyboardType: textInputType,
      textCapitalization: TextCapitalization.words,
      autofocus: false,
      inputFormatters: textInputFormatter,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: MediaQuery.of(context).size.height * 0.02),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1)),
        hintText: hintText ?? '',
        contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      ),
      focusNode: focusNode,
      validator: validator,
      onChanged: (_) {
        if (controller.text.length == maxLength) {
          if (nextFocusNode != null)
            FocusScope.of(context).requestFocus(nextFocusNode);
        }
      },
      onFieldSubmitted: (_) {
        if (nextFocusNode != null)
          FocusScope.of(context).requestFocus(nextFocusNode);
      },
    );
  }
}
