import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';

class DropDownTextField extends StatefulWidget {
  TextEditingController controller;
  bool obscureText;
  bool autoValidation;
  TextInputType textInputType;
  String hintText;
  FormFieldValidator validator;
  DropDownTextField({this.controller,this.obscureText,this.autoValidation,this.textInputType,this.hintText,this.validator});
  @override
  _DropDownTextFieldState createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      autovalidate: widget.autoValidation,
      keyboardType: widget.textInputType,
      textCapitalization: TextCapitalization.words,
      autofocus: false,
      enabled: false,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.arrow_drop_down),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey,fontSize: MediaQuery.of(context).size.height*0.02),
        hintText: widget.hintText,
        contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        border: OutlineInputBorder(borderSide: BorderSide(color: ThemeApp().innertextfieldbordercolor)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:  ThemeApp().innertextfieldbordercolor,width: 2)),
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  ThemeApp().innertextfieldbordercolor,width: 2)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color:  ThemeApp().innertextfieldbordercolor,width: 2)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  ThemeApp().innertextfieldbordercolor,width: 2)),
      ),
      validator: widget.validator,
    );
  }
}
