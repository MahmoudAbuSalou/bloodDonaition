import 'dart:io';
import 'package:blood_donation_project/Modules/home/add_request_blood/user_info.dart';
import 'package:blood_donation_project/Modules/home/homePage/homePage.dart';
import 'package:blood_donation_project/Modules/on_boarding/on_boarding.dart';
import 'package:blood_donation_project/Modules/register/register_screen.dart';
import 'package:blood_donation_project/cubit/AppCubit/app_cubit.dart';

import 'package:blood_donation_project/cubit/UsenManagmentCubits/Register/GlobalSettingCubit/global_setting_register_cubit.dart';
import 'package:blood_donation_project/cubit/donate_cubit/donate_cubit.dart';
import 'package:blood_donation_project/cubit/notification/notification_cubit.dart';
import 'package:blood_donation_project/layout/home_page/home_screen.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/home/all_post_cubit.dart';
import 'shared/bloc_observer.dart';
import 'shared/network/local/cachehelper.dart';
import 'shared/network/remote/dio_helper.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("on background massage");
  print(message.data.toString());
  showToast(msg: "on background massage", state: ToastState.SUCCESS);
}


main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  // START  Notifications
  await CacheHelper.init();
  await Firebase.initializeApp();
  var token = await FirebaseMessaging.instance.getToken();
  print("*************************");
  print(token);
  print("*************************");

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print("on onMessage Opened App");
    print(event.data.toString());
    showToast(msg: "on onMessage Opened App", state: ToastState.SUCCESS);
  });

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((event) {
    print("on onMessage");
    print(event.data.toString());
    showToast(msg:"Notification Receive Successfully", state: ToastState.SUCCESS);
  });


  //END  Notifications


  AppSharedPreferences.saveTokenPh(token.toString());
  DioHelper.init();
  //bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
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
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GlobalSettingRegisterCubit(),
            ),
            BlocProvider(
              create: (context) => AppCubit(),
            ),
            BlocProvider(
              create: (context) => AllPostCubit()..getPost(),
            ),
            BlocProvider(
              create: (context) => MyPostsCubit()
                ..getMyPosts()
                // ..getDonors(3),
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
            home: (AppSharedPreferences.hasToken)
                ? HomeLayout()
                : OnBoardingScreen(),
          ),
        );
      },
    );
  }
}
