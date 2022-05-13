import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Modules/SplashPage/splash_screen.dart';
import 'Modules/home/add_request_blood/blood_type.dart';
import 'Modules/home/add_request_blood/user_info.dart';
import 'Modules/home/home_details/details.dart';
import 'layout/home_page/home_screen.dart';
import 'shared/bloc_observer.dart';
import 'shared/network/local/cachehelper.dart';
import 'shared/network/remote/dio_helper.dart';

 main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(1080, 2280),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

            primarySwatch: Colors.red,
          ),
          home:HomeLayout()
          //AddRequestBlood(),
            //SplashScreen(),
        );
      },
    );
  }
}
