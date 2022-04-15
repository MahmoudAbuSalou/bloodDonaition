import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style/colors.dart';


ThemeData lightThem = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black)),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      titleSpacing: 20.0,
      iconTheme: IconThemeData(color: Colors.black),
      backwardsCompatibility: false,
      titleTextStyle: TextStyle(
          fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
     // color: Colors.white,
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 20.0,
        selectedItemColor: defaultColor,
        backgroundColor: Colors.white));

ThemeData darkThem = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF262424),
  //HexColor('333739'),
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    iconTheme: IconThemeData(color: Colors.white),
    backwardsCompatibility: false,
    titleTextStyle: TextStyle(
        fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor:  Color(0xFF262424), //HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    color: Color(0xFF262424),
    //HexColor('333739'),
    elevation: 0,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 20.0,
    selectedItemColor: Colors.deepOrange,
    backgroundColor: Color(0xFF262424), // HexColor('333739'),
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white)),
);
