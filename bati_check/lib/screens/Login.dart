import 'package:bati_check/utils/customColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'clip.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 400.0, height: 634.6666666666666, allowFontScaling: false);
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: 250.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: CustomColors.littleBlue,
                    image: DecorationImage(
                        image: AssetImage("assets/images/ma.jpg"),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(.2), BlendMode.darken),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 70.h,
                      width: 70.h,
                      decoration: BoxDecoration(
                          color: Colors.white.withAlpha(200),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"))),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Baticheck",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 35.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email ou numéro",
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.white, width: 1)),
                  width: 350.w,
                  height: 50.h,
                  child: TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.person,
                          color: CustomColors.skyBlue,
                        ),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(20))),
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  "Mot de passe",
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.white, width: 1)),
                  width: 350.w,
                  height: 50.h,
                  child: TextField(
                    textAlign: TextAlign.start,
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.lock,
                          color: CustomColors.skyBlue,
                        ),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(20))),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'adminhome');
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
                width: MediaQuery.of(context).size.width - 100,
                height: 56.h,
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
                  "Connexion",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(15),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: 35.h),
          ],
        ),
      ),
    );
  }
}
