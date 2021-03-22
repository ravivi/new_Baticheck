import 'package:bati_check/utils/customColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List titre = ["Article", "Materiel", "Personnel"];

  List<String> _articles = ['Béton', 'Acier', 'Brique', 'Sable'];
  List<String> _personals = ['Arcchitecte', 'Maçon', 'Carroleur', 'Peintre'];
  List<String> _materials = [
    'Grue',
    'Mini pelle',
    'Chargeuse',
    'Chariot Elevateur'
  ];
  String _selectedArtcle;
  String _selectedPersonal;
  String _selectedMaterial;
  DateTime debut = DateTime.now();
  DateTime fin = (DateTime.now()).add(Duration(days: 1));

  Future<DateTime> viewDate(BuildContext context, DateTime d) async {
    return showDatePicker(
        context: context,
        firstDate: debut,
        cancelText: "Annuler",
        initialDate: d,
        lastDate: DateTime(2100));
  }

  String format(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
  // https://www.youtube.com/watch?v=x9-FubtbPrI&ab_channel=OdooSogesi

  @override
  Widget build(BuildContext context) {
    Future _showDialogMateriel(context) async {
      return await showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            title: Text("Demande De Matériel"),
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

                            hint:
                                Text('Matériel'), // Not necessary for Option 1
                            value: _selectedMaterial,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedMaterial = newValue;
                              });
                            },
                            items: _materials.map((location) {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              DateTime d =
                                  await viewDate(context, DateTime.now());
                              if (d != null) {
                                debut = d;
                                setState(() {});
                              }
                            },
                            child: Container(
                              width: 115.w,
                              height: ScreenUtil().setHeight(50),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                format(debut),
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: ScreenUtil().setSp(15)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              DateTime d = await viewDate(context, debut);
                              if (d != null) {
                                fin = d;
                                setState(() {});
                              }
                            },
                            child: Container(
                              width: 115.w,
                              height: ScreenUtil().setHeight(50),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                format(fin),
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: ScreenUtil().setSp(15)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      Container(
                        padding: EdgeInsets.all(
                          8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10.0),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black12,
                          //     blurRadius: 6.0,
                          //     offset: Offset(0, 2),
                          //   ),
                          // ],
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
                              EdgeInsets.only(top: ScreenUtil().setHeight(30)),
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

                            hint: Text('Metier'), // Not necessary for Option 1
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

    Future _showDialogArticle(context) async {
      return await showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            title: Text("Demande D'article"),
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

                            hint: Text("Article"), // Not necessary for Option 1
                            value: _selectedArtcle,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedArtcle = newValue;
                              });
                            },
                            items: _articles.map((location) {
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

    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      appBar: AppBar(
        backgroundColor: CustomColors.littleBlue,
        title: Text("Tableau de Bord"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              height: 100.h,
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showDialogPersonel(context);
                        },
                        child: Container(
                          height: 60.h,
                          width: 60.w,
                          child: Icon(
                            Icons.people,
                            size: 30,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColors.littleBlue,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.purpleAccent,
                                    CustomColors.lightBlue
                                  ])),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text("Employés",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showDialogMateriel(context);
                        },
                        child: Container(
                          height: 60.h,
                          width: 60.w,
                          child: Icon(
                            Icons.build_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColors.littleBlue,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.purpleAccent,
                                    Colors.deepOrangeAccent
                                  ])),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text("Materiel",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showDialogArticle(context);
                        },
                        child: Container(
                          height: 60.h,
                          width: 60.w,
                          child: Icon(
                            Icons.people,
                            size: 30,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColors.littleBlue,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.deepPurpleAccent,
                                    CustomColors.lightBlue
                                  ])),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text("Article",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 60.h,
                        width: 60.w,
                        child: Icon(
                          Icons.edit,
                          size: 30,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomColors.littleBlue,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.purpleAccent,
                                  CustomColors.lightBlue
                                ])),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text("Rapport",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w500))
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Wrap(
            spacing: 30.w,
            runSpacing: 30.h,
            children: [
              Container(
                height: 150.h,
                width: 160.w,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    //border: Border.all(width: 1,color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/icons/i1.png"),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("Total Employé"),
                    Text(
                      "30",
                      style: TextStyle(
                          fontSize: 35.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150.h,
                width: 160.w,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    //border: Border.all(width: 1,color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/icons/i2.png"),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("Total Equipement"),
                    Text(
                      "5",
                      style: TextStyle(
                          fontSize: 35.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150.h,
                width: 160.w,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    //border: Border.all(width: 1,color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/icons/i3.png"),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("Total Matériel"),
                    Text(
                      "80",
                      style: TextStyle(
                          fontSize: 35.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150.h,
                width: 160.w,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    //border: Border.all(width: 1,color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/icons/i4.png"),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("Rapport"),
                    Text(
                      "30",
                      style: TextStyle(
                          fontSize: 35.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(15.h),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Evolution des depenses",
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Wrap(
                      spacing: 50.w,
                      runSpacing: 30.h,
                      children: [
                        CircularPercentIndicator(
                          radius: 80.0,
                          animation: true,
                          animationDuration: 2200,
                          lineWidth: 8.0,
                          percent: 0.7,
                          center: Text(
                            "70",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.0.sp),
                          ),
                          footer: Text("data"),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.grey.shade300,
                          progressColor: Colors.red,
                        ),
                        CircularPercentIndicator(
                          radius: 80.0,
                          animation: true,
                          animationDuration: 2200,
                          lineWidth: 8.0,
                          percent: 0.3,
                          center: Text(
                            "30",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.0.sp),
                          ),
                          footer: Text("data"),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.grey.shade300,
                          progressColor: Colors.purpleAccent,
                        ),
                        CircularPercentIndicator(
                          radius: 80.0,
                          animation: true,
                          animationDuration: 2200,
                          lineWidth: 8.0,
                          percent: 0.5,
                          center: Text(
                            "50",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.0.sp),
                          ),
                          footer: Text("data"),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.grey.shade300,
                          progressColor: CustomColors.skyBlue,
                        ),
                        CircularPercentIndicator(
                          radius: 80.0,
                          animation: true,
                          animationDuration: 2200,
                          lineWidth: 8.0,
                          percent: 0.7,
                          center: Text(
                            "70",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.0.sp),
                          ),
                          footer: Text("data"),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.grey.shade300,
                          progressColor: Colors.red,
                        ),
                        CircularPercentIndicator(
                          radius: 80.0,
                          animation: true,
                          animationDuration: 2200,
                          lineWidth: 8.0,
                          percent: 0.3,
                          center: Text(
                            "30",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.0.sp),
                          ),
                          footer: Text("data"),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.grey.shade300,
                          progressColor: Colors.purpleAccent,
                        ),
                        CircularPercentIndicator(
                          radius: 80.0,
                          animation: true,
                          animationDuration: 2200,
                          lineWidth: 8.0,
                          percent: 0.5,
                          center: Text(
                            "50",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.0.sp),
                          ),
                          footer: Text("data"),
                          circularStrokeCap: CircularStrokeCap.butt,
                          backgroundColor: Colors.grey.shade300,
                          progressColor: CustomColors.skyBlue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textFieldController = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('TextField in Dialog'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  String codeDialog;
  String valueText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (codeDialog == "123456") ? Colors.green : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Alert Dialog'),
      ),
      body: Center(
        child: FlatButton(
          color: Colors.teal,
          textColor: Colors.white,
          onPressed: () {
            _displayTextInputDialog(context);
          },
          child: Text('Press For Alert'),
        ),
      ),
    );
  }
}
