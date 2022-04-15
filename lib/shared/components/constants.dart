import 'package:flutter/material.dart';

import '../network/local/cachehelper.dart';




 // ignore: constant_identifier_names
 enum ToastState{SUCCESS,ERROR,WARING}


 Color toastColor(ToastState state){
  Color color;
  switch(state){
   case ToastState.SUCCESS:
   color =  Colors.green;
    break;

   case ToastState.WARING:
    color = Colors.yellow;
    break;

   case ToastState.ERROR:
    color =  Colors.red;
    break;
  }
  return color;
 }

String token = CacheHelper.getData(key: 'token');