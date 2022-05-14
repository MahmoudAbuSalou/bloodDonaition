import 'dart:io';
import 'package:blood_donation_project/Modules/home/add_request_blood/blood_type.dart';
import 'package:blood_donation_project/Modules/home/add_request_blood/user_info.dart';
import 'package:blood_donation_project/Modules/home/homePage/homePage.dart';
import 'package:blood_donation_project/Modules/on_boarding/on_boarding.dart';
import 'package:blood_donation_project/cubit/AppCubit/app_cubit.dart';
import 'package:blood_donation_project/cubit/register_cubit/register_cubit.dart';
import 'package:blood_donation_project/cubit/register_cubit/register_states.dart';
import 'package:blood_donation_project/layout/home_page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'shared/bloc_observer.dart';
import 'shared/network/local/cachehelper.dart';
import 'shared/network/remote/dio_helper.dart';

main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  //bool onBoarding = CacheHelper.getData(key: 'onBoarding');
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

        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => RegisterCubit(RegisterInitialState()),

            ),
            BlocProvider(
              create: (context) => AppCubit()..CheckNet(),

            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            // Use this line to prevent extra rebuilds
            useInheritedMediaQuery: true,

            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              iconTheme: IconThemeData(
                color: Colors.black,
                opacity: 1,

              ),
              primarySwatch: Colors.red,
              textTheme: TextTheme(bodyText2: TextStyle(fontSize: 30.sp)),
            ),
            home:OnBoardingScreen(),
          ),
        );
      },
    );
  }
}