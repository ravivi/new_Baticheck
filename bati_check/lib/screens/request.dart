
// import 'package:flutter/material.dart';

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   DateTime debut = DateTime.now();
//   DateTime fin = (DateTime.now()).add(Duration(days: 1));

//   Future<DateTime> viewDate(BuildContext context, DateTime d) async {
//     return showDatePicker(
//         context: context,
//         firstDate: debut,
//         cancelText: "Annuler",
//         initialDate: d,
//         lastDate: DateTime(2100));
//   }

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(width: 360.0, height: 752.0, allowFontScaling: false);

//     Residence residence =
//         ModalRoute.of(context).settings.arguments as Residence;
//     return Scaffold(
//       body: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             SizedBox(
//                 height: ScreenUtil().setHeight(30),
//             ),
//             Row(
//                 children: <Widget>[
//                   IconButton(
//                       icon: Icon(
//                         Icons.close,
//                         color: CustomColors.grey,
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       }),
//                   SizedBox(
//                     width: ScreenUtil().setWidth(20),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     child: Text(
//                       residence.nom,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           color: CustomColors.grey,
//                           fontWeight: FontWeight.bold,
//                           fontSize: ScreenUtil().setSp(17)),
//                     ),
//                   ),
//                 ],
//             ),
//             SizedBox(
//                 height: ScreenUtil().setHeight(10),
//             ),
//             Center(
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Colors.white,
//                   backgroundImage: AssetImage("images/maison.jpg"),
//                 ),
//             ),
//             SizedBox(
//                 height: ScreenUtil().setHeight(20),
//             ),
//             Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   "Choississez Votre date d'arrivée et de Départ pour rétrouver la meilleure chambre qui correspondra a votre séjour",
//                   style: TextStyle(
//                       color: Colors.grey[600],
//                       fontSize: ScreenUtil().setSp(16),
//                       fontWeight: FontWeight.w600),
//                   textAlign: TextAlign.center,
//                 ),
//             ),
//             SizedBox(
//                 height: ScreenUtil().setHeight(20),
//             ),
//             Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Text(
//                   "Date d'arrivée",
//                   style: TextStyle(color: Colors.grey[600]),
//                 ),
//             ),
//             GestureDetector(
//                 onTap: () async {
//                   DateTime d = await viewDate(context, DateTime.now());
//                   if (d != null) {
//                     debut = d;
//                     setState(() {});
//                   }
//                 },
//                 child: Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: EdgeInsets.symmetric(horizontal: 10),
//                     height: ScreenUtil().setHeight(50),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     alignment: Alignment.centerLeft,
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text(
//                           format(debut),
//                           style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: ScreenUtil().setSp(15)),
//                         ),
//                         Icon(Icons.calendar_today, color: Colors.grey[600])
//                       ],
//                     ),
//                   ),
//                 ),
//             ),
//             SizedBox(
//                 height: ScreenUtil().setHeight(20),
//             ),
//             Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Text(
//                   "Date de départ",
//                   style: TextStyle(color: Colors.grey[600]),
//                 ),
//             ),
//             GestureDetector(
//                 onTap: () async {
//                   DateTime d = await viewDate(context, debut);
//                   if (d != null) {
//                     fin = d;
//                     setState(() {});
//                   }
//                 },
//                 child: Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: EdgeInsets.symmetric(horizontal: 10),
//                     height: ScreenUtil().setHeight(50),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     alignment: Alignment.centerLeft,
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text(
//                           format(fin),
//                           style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: ScreenUtil().setSp(15)),
//                         ),
//                         Icon(Icons.calendar_today, color: Colors.grey[600])
//                       ],
//                     ),
//                   ),
//                 ),
//             ),
//             SizedBox(
//                 height: ScreenUtil().setHeight(35),
//             ),
//             Center(
//               child: GestureDetector(
//                   onTap: () {
//                   if (fin.isAfter(debut)) {
//                     Provider.of<ChambreService>(context, listen: false)
//                         .setParameters(
//                             residence: residence, debut: debut, fin: fin);
//                     Navigator.pushNamed(context, 'resultPage');
//                   } else {
//                     showDialog(
//                         context: context,
//                         builder: (BuildContext context) => AssetGiffyDialog(
//                               image: Image.asset(
//                                 "images/triste.gif",
//                                 fit: BoxFit.cover,
//                               ),
//                               title: Text('Attention Attention!!!',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: ScreenUtil().setSp(22),
//                                       fontWeight: FontWeight.w600)),
//                               description: Text(
//                                 "Assurez vous que la date de départ ne soit pas inférieur à la date d'arrivée",
//                                 textAlign: TextAlign.center,
//                               ),
//                               entryAnimation: EntryAnimation.BOTTOM_RIGHT,
//                               onOkButtonPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               onlyOkButton: true,
//                               buttonOkText: Text(
//                                 "Recommencer",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               buttonOkColor: CustomColors.skyBlue.withOpacity(0.7),
//                             ));
//                   }
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                  // margin: EdgeInsets.symmetric(horizontal: 50),
//                   width: MediaQuery.of(context).size.width/1.5,
//                   height: ScreenUtil().setHeight(56),
//                   child: Text(
//                     "Rechercher votre chambre",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                         fontSize: ScreenUtil().setSp(16)),
//                   ),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             CustomColors.skyBlue,
//                             CustomColors.skyBlue.withAlpha(200)
//                           ]),
//                       borderRadius: BorderRadius.circular(30)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//               ),
//       ),
//     );
//   }

//   String format(DateTime date) {
//     return '${date.day}/${date.month}/${date.year}';
//   }
// }
