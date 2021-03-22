import 'package:bati_check/utils/customColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  List<String> _personals = ['Arcchitecte', 'Maçon', 'Carroleur', 'Peintre'];

  String _selectedPersonal;
  // https://www.youtube.com/watch?v=x9-FubtbPrI&ab_channel=OdooSogesi

  @override
  Widget build(BuildContext context) {
    Future _showDialogPersonel(context) async {
      return await showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            title: Text("Demande De Personnel"),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: <
                        Widget>[
                      Container(
                        padding: EdgeInsets.all(8),
                        height: 50.h,
                        width: 500.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,

                            hint: Text("Métier"), // Not necessary for Option 1
                            value: _selectedPersonal,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedPersonal = newValue;
                              });
                            },
                            items: _personals.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      Container(
                        padding: EdgeInsets.all(
                          8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        width: 500.w,
                        height: 50.h,
                        child: TextField(
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Quantité",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setSp(20))),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.only(top: ScreenUtil().setHeight(50)),
                          width: MediaQuery.of(context).size.width - 200,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    CustomColors.littleBlue,
                                    CustomColors.lightBlue
                                  ]),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Envoyer",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(15),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ]),
                  ),
                );
              },
            ),
          );
        },
      );
    }

    ScreenUtil.init(context,
        width: 400.0, height: 634.6666666666666, allowFontScaling: false);
  }
}
