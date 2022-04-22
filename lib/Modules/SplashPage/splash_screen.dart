

import 'dart:ffi';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

import '../login/login_screen.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 @override
  void initState() {
    // TODO: implement initState
   Future.delayed(const Duration(seconds: 5)).then((value) => navigatorToNew(context, LogInScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Padding(
        padding:  EdgeInsets.only(top:20.h),
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/cover.png',
                ),
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
                isAntiAlias: true,
              )),
        ),
      ),
    );
  }
}
