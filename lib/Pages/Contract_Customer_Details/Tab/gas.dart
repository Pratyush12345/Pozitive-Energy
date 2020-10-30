import 'package:flutter/material.dart';
import 'package:pozitive/Widget/textfieldsforapp.dart';
import 'package:intl/intl.dart';
import 'package:pozitive/Util/global.dart' as globals;

class Gas extends StatefulWidget {
  @override
  _GasState createState() => _GasState();
}

class _GasState extends State<Gas> {

  bool _autovalidation=false;
  TextEditingController mprn= TextEditingController();
  TextEditingController standingCharge= TextEditingController();
  TextEditingController unitPrice= TextEditingController();
  TextEditingController requirebydatecontroller=TextEditingController();
  TextEditingController preferreddatecontroller=TextEditingController();


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
            Text("MPRN",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(mprn,false,_autovalidation,TextInputType.number,"MPRN",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter MPRN';
                    }
                    return null;
                  },context),
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
            Text("Unit Price",style: TextStyle(fontSize: MediaQuery.of(context).size.height*.015,color: Color.fromRGBO(31, 33, 29, 1)),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.062,
              child: innertextfield(unitPrice,false,_autovalidation,TextInputType.number,"Unit Price",
                      (value) {
                    if (value.isEmpty) {
                      return 'Please enter Unit Price';
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
                globals.tabController5.animateTo(7);
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
