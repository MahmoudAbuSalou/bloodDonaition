

import 'package:flutter/material.dart';

import '../../Models/onBoarding/onBoardingModel.dart';

import '../network/local/cachehelper.dart';



List <OnBoardingModel> onBoardingObject =[
 OnBoardingModel(tittle: ' من فوائد التبرع بالدم',details: 'يقلل من مخاطر الإصابة بأمراض القلب والجلطات',urlImage: 'images/image_slider1.png'),
 OnBoardingModel(tittle: 'من فوائد التبرع بالدم',details: 'يخفض ضغط الدم والكوليسترول',urlImage: 'images/image_slider2.png'),
 OnBoardingModel(tittle: 'هل تعلم !',details: '350 مل من الدم كافية لإنقاذ حياة 4 أشخاص',urlImage: 'images/image_slider3.png'),
];
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
