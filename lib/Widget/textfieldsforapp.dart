import 'package:flutter/material.dart';
import 'package:pozitive/Util/theme.dart';

ThemeApp theme = ThemeApp();

Widget textField(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.grey),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(
          20.0,
          MediaQuery.of(context).size.height * 0.02,
          20.0,
          MediaQuery.of(context).size.height * 0.02),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget textFieldEmail(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,

    keyboardType: textInputType,
    //textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.grey),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(
          20.0,
          MediaQuery.of(context).size.height * 0.02,
          20.0,
          MediaQuery.of(context).size.height * 0.02),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.textfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget dropdowntextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    enabled: false,
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.arrow_drop_down),
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget innertextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context,
    [FocusNode focusNode,
    FocusNode nextfocusnode]) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    focusNode: focusNode,
    validator: validator,
    onFieldSubmitted: (_) {
      FocusScope.of(context).requestFocus(nextfocusnode);
    },
  );
}

Widget innertextfieldEmail(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,

    keyboardType: textInputType,
    // textCapitalization: TextCapitalization.words,
    autofocus: false,

    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget innerLongtextfield(
    int lines,
    TextEditingController controller,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    keyboardType: textInputType,
    maxLines: lines,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget datetextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    enabled: false,
    decoration: InputDecoration(
      suffixIcon: Image.asset(
        "assets/calendar.png",
        scale: 12,
        color: Color.fromRGBO(155, 119, 217, 1),
      ),
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.innertextfieldbordercolor)),
      focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: theme.innertextfieldbordercolor, width: 2)),
    ),
    validator: validator,
  );
}

Widget withoutboderdropdowntextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    enabled: false,
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.arrow_drop_down),
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
    ),
    validator: validator,
  );
}

Widget withoutborderinnertextfield(
    TextEditingController controller,
    bool obscuretext,
    bool autovalidation,
    TextInputType textInputType,
    String hinttext,
    FormFieldValidator validator,
    BuildContext context) {
  return TextFormField(
    controller: controller,
    obscureText: obscuretext,
    keyboardType: textInputType,
    textCapitalization: TextCapitalization.words,
    autofocus: false,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: MediaQuery.of(context).size.height * 0.02),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1)),
      hintText: hinttext,
      contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
    ),
    validator: validator,
  );
}
