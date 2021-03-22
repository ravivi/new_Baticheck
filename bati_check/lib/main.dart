import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/AdminHome.dart';
import 'screens/login.dart';
import 'utils/customColors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: CustomColors.littleBlue, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baticheck',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      
      ),
      home: Login(),
       routes: {
          'adminhome':(context)=> AdminHome(),
          //'adminmateriel':(context)=> AdminMateriel(),
        },
    );
  }
}
