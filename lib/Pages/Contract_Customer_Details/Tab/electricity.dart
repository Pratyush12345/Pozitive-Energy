import 'package:flutter/material.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:pozitive/Util/theme.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Util/global.dart' as globals;

class Electricity extends StatefulWidget {
  @override
  _ElectricityState createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> {

  ThemeApp themeApp=ThemeApp();
  TextEditingController mpancodecontroller=TextEditingController();
  TextEditingController businessnamecontroller1= TextEditingController();
  TextEditingController businessnamecontroller2= TextEditingController();
  TextEditingController businessnamecontroller3= TextEditingController();
  TextEditingController businessnamecontroller4= TextEditingController();
  TextEditingController businessnamecontroller5= TextEditingController();
  TextEditingController businessnamecontroller6= TextEditingController();
  TextEditingController requirebydatecontroller=TextEditingController();
  TextEditingController preferreddatecontroller=TextEditingController();

  TextEditingController standingCharge= TextEditingController();
  TextEditingController dayUnitCharge= TextEditingController();
  TextEditingController nightUnitCharge= TextEditingController();
  TextEditingController eweUnitCharge= TextEditingController();
  TextEditingController capacityCharge= TextEditingController();
  TextEditingController supplyCapacity= TextEditingController();
  TextEditingController excessCapacity= TextEditingController();
  TextEditingController reactiveCharge= TextEditingController();

  bool _autovalidation=false;
  List mpancodelist=[
    "00","11","22"
  ];

  Widget mpancodeview(){
    return  ListView.builder(shrinkWrap:true,itemCount: mpancodelist.length,itemBuilder: (BuildContext context,int index){
      return Container(
        child: ListTile(
          title: Text(mpancodelist[index],style: TextStyle(fontWeight: FontWeight.bold),),
          onTap: (){
            setState(() {
              mpancodecontroller.text=mpancodelist[index];
            });

            Navigator.pop(context);
          },
        ),
      );
    });
  }

  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  Future _selectDate(BuildContext context,String fromfield) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null){

      if(fromfield=="Required"){
        setState(() {

          requirebydatecontroller.text=dateFormat.format(picked);
        });

      }else{
        setState(() {
          preferreddatecontroller.text=dateFormat.format(picked);
        });
      }

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height*0.018,
            ),
            Text("MPAN",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height*.062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width*.3,
                      child: withoutboderdropdowntextfield(mpancodecontroller,false,_autovalidation,TextInputType.text,"",
                              (value) {
                            if (value.isEmpty) {
                              return 'Please Select Partner';
                            }
                            return null;
                          },context),
                      decoration: BoxDecoration(
                          border: Border(right: BorderSide(color: Color.fromRGBO(128, 189, 40, 1)))
                      ),
                    ),
                    onTap: (){
                      FocusScope.of(context).requestFocus(FocusNode());
                      showDialog(context: context,child:Dialog(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                            Text("Select MPAN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.03),),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: Colors.grey.withOpacity(.2),
                            ),

                            Container(
                              child:  mpancodeview(),
                            )

                          ],
                        ),

                      ));
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*.3,
                    child: withoutborderinnertextfield(businessnamecontroller1,false,_autovalidation,TextInputType.number,"",
                            (value) {
                          if (value.isEmpty) {
                            return 'Please enter Name';
                          }
                          return null;
                        },context),
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color:Color.fromRGBO(128, 189, 40, 1)))
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.32,
                    child: withoutborderinnertextfield(businessnamecontroller2,false,_autovalidation,TextInputType.number,"",
                            (value) {
                          if (value.isEmpty) {
                            return 'Please enter Name';
                          }
                          return null;
                        },context),
                  )


                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:Border.all(color:themeApp.textfieldbordercolor,width: 2),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5))
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*.062,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*.23,
                    child: withoutborderinnertextfield(businessnamecontroller3,false,_autovalidation,TextInputType.number,"",
                            (value) {
                          if (value.isEmpty) {
                            return 'Please enter Name';
                          }
                          return null;
                        },context),
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: themeApp.textfieldbordercolor,width: 2))
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*.23,
                    child: withoutborderinnertextfield(businessnamecontroller4,false,_autovalidation,TextInputType.number,"",
                            (value) {
                          if (value.isEmpty) {
                            return 'Please enter Name';
                          }
                          return null;
                        },context),
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: themeApp.textfieldbordercolor,width: 2))
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*.23,
                    child: withoutborderinnertextfield(businessnamecontroller5,false,_autovalidation,TextInputType.number,"",
                            (value) {
                          if (value.isEmpty) {
                            return 'Please enter Name';
                          }
                          return null;
                        },context),
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Color.fromRGBO(128, 189, 40, 1)))
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.23,
                    child: withoutborderinnertextfield(businessnamecontroller6,false,_autovalidation,TextInputType.number,"",
                            (value) {
                          if (value.isEmpty) {
                            return 'Please enter Name';
                          }
                          return null;
                        },context),
                  )


                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:Border.all(color: themeApp.textfieldbordercolor,width: 2),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Text("Standing Charge",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(standingCharge,false,_autovalidation,TextInputType.number,"Standing Charge",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter Standing Charge';
                    }
                    return null;
                  },context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Text("Day Unit Charge",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(dayUnitCharge,false,_autovalidation,TextInputType.number,"Standing Charge",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter Standing Charge';
                    }
                    return null;
                  },context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Text("Night Unit Charge",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(nightUnitCharge,false,_autovalidation,TextInputType.number,"Night Unit Charge",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter Night Unit Charge';
                    }
                    return null;
                  },context),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Text("EWE Unit Charge",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(eweUnitCharge,false,_autovalidation,TextInputType.number,"EWE Unit Charge",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter EWE Unit Charge';
                    }
                    return null;
                  },context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Text("Capacity Charge",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(capacityCharge,false,_autovalidation,TextInputType.number,"Capacity Charge",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter Capacity Charge';
                    }
                    return null;
                  },context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Text("Supply Capacity",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(supplyCapacity,false,_autovalidation,TextInputType.number,"Supply Capacity",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter Supply Capacity';
                    }
                    return null;
                  },context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Text("Excess Capacity Charge",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(excessCapacity,false,_autovalidation,TextInputType.number,"Excess Capacity Charge",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter Excess Capacity Charge';
                    }
                    return null;
                  },context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),
            Text("Reactive Charge",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(reactiveCharge,false,_autovalidation,TextInputType.number,"Reactive Charge",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter Reactive Charge';
                    }
                    return null;
                  },context),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),

            Text("Contract Start Date",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            InkWell(
              child: SizedBox(
                height: MediaQuery.of(context).size.height*.062,
                child: datetextfield(requirebydatecontroller,false,_autovalidation,TextInputType.text,"Select date",
                        (value) {
                      if (value.isEmpty) {
                        return 'Please Select date';
                      }
                      return null;
                    },context),
              ),
              onTap: (){
                _selectDate(context,"Required");
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.022,
            ),

            Text("Contract End Date",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            InkWell(
              child: SizedBox(
                height: MediaQuery.of(context).size.height*.062,
                child: datetextfield(preferreddatecontroller,false,_autovalidation,TextInputType.text,"Select date",
                        (value) {
                      if (value.isEmpty) {
                        return 'Please Select date';
                      }
                      return null;
                    },context),
              ),
              onTap: (){
                _selectDate(context,"Preferred");
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.062,
                child: Center(
                  child: Text("Save And Next",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.019,
                      fontWeight: FontWeight.bold),),
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(155, 119, 217, 1),
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
              onTap: (){
                globals.tabController5.animateTo(6);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.028,
            ),
          ],
        ),
      ),
    );
  }
}
