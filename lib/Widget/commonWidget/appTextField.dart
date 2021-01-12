import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pozitive/Util/theme.dart';

class AppTextField extends StatelessWidget {
  TextEditingController controller;
  String title;
  bool obscureText;
  TextInputType textInputType;
  bool mandatory;
  String hintText;
  FormFieldValidator validator;
  FocusNode focusNode;
  FocusNode nextFocusNode;
  List<TextInputFormatter> textInputFormatter;
  AppTextField(
      {this.mandatory: false,
      this.title,
      this.validator,
      this.textInputType,
      this.controller,
      this.hintText,
      this.obscureText,
      this.textInputFormatter,
      this.focusNode,
      this.nextFocusNode});

  ThemeApp theme = ThemeApp();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: title,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .015,
                color: Color.fromRGBO(31, 33, 29, 1)),
            children: <TextSpan>[
              TextSpan(
                  text: mandatory ? ' \*' : '',
                  style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
          keyboardType: textInputType,
          textCapitalization: TextCapitalization.words,
          autofocus: false,
          inputFormatters: textInputFormatter ?? [],
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: MediaQuery.of(context).size.height * 0.02),
            hintText: hintText,
            contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: theme.innertextfieldbordercolor, width: 2)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: theme.innertextfieldbordercolor, width: 2)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: theme.innertextfieldbordercolor, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: theme.innertextfieldbordercolor, width: 2)),
          ),
          focusNode: focusNode,
          validator: validator,
          onFieldSubmitted: (_) {
            if (nextFocusNode != null)
              FocusScope.of(context).requestFocus(nextFocusNode);
          },
        ),
      ],
    );
  }
}
