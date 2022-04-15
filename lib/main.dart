import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Modules/SplashPage/splash_screen.dart';
import 'shared/bloc_observer.dart';
import 'shared/network/local/cachehelper.dart';
import 'shared/network/remote/dio_helper.dart';

 main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 2280),

      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

            primarySwatch: Colors.red,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
