import 'package:flutter/material.dart';

class ThemeApp {
  final textfieldbordercolor = Color.fromRGBO(128, 189, 40, 1);
  final innertextfieldbordercolor = Color.fromRGBO(128, 189, 40, 1);
  final purplecolor = Color.fromRGBO(142, 110, 207, 1);
  final greenappcolor = Color.fromRGBO(18, 122, 69, 1);
}

titlefontSize(BuildContext context) {
  return MediaQuery.of(context).size.height * .025;
}

titlefontResize(BuildContext context, double resizeFont) {
  return MediaQuery.of(context).size.height * resizeFont;
}
