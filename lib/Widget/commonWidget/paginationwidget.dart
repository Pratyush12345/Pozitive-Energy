import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/sizeConfig.dart';
import 'package:pozitive/Util/theme.dart';

class Paginationwidget extends StatelessWidget {
  int perpage;
  int curentpage;
  int totalItem;
  Function selectDecreaseFunction, selectIncreaseFunction, selectIndexFunction;
  Paginationwidget(
      {@required this.perpage,
      this.totalItem,
      @required this.curentpage,
      this.selectDecreaseFunction,
      this.selectIncreaseFunction,
      this.selectIndexFunction});
  ThemeApp themeApp = ThemeApp();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * .06,
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .02,
            right: MediaQuery.of(context).size.width * .02),
        child: Row(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * .0022),
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width * .1,
                  height: MediaQuery.of(context).size.width * .1,
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.height * .025,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: themeApp.purplecolor, shape: BoxShape.circle),
                ),
                onTap: selectDecreaseFunction,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: totalItem ~/ perpage + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * .0022),
                      child: InkWell(
                        child: Container(
                          width: MediaQuery.of(context).size.width * .1,
                          height: MediaQuery.of(context).size.width * .1,
                          child: Center(
                              child: Text(
                            "${index + 1}",
                            style: TextStyle(
                                color: index + 1 == curentpage
                                    ? Colors.white
                                    : themeApp.purplecolor),
                          )),
                          decoration: BoxDecoration(
                              color: index + 1 == curentpage
                                  ? themeApp.purplecolor
                                  : Colors.white,
                              shape: BoxShape.circle),
                        ),
                        onTap: () {
                          selectIndexFunction(index + 1);
                        },
                      ),
                    );
                  }),
            ),
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * .0022),
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width * .1,
                  height: MediaQuery.of(context).size.width * .1,
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.height * .025,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: themeApp.purplecolor, shape: BoxShape.circle),
                ),
                onTap: selectIncreaseFunction,
              ),
            )
          ],
        ),
      ),
    );
  }
}
