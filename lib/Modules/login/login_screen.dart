import 'package:blood_donation_project/Modules/donate/donate_screen.dart';
import 'package:blood_donation_project/Modules/forgetPassword/forgetPasswordScreen.dart';
import 'package:blood_donation_project/cubit/AppCubit/app_cubit.dart';
import 'package:blood_donation_project/layout/home_page/home_screen.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/UsenManagmentCubits/login_cubit/login_cubit.dart';
import '../../cubit/UsenManagmentCubits/login_cubit/login_states.dart';
import '../../shared/components/components.dart';

import '../../shared/components/constants.dart';
import '../../shared/validation/userValidation.dart';
import '../home/homePage/homePage.dart';
import '../register/register_screen.dart';

// ignore: must_be_immutable
class LogInScreen extends StatelessWidget {
  LogInScreen() : super();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100.h,
                        ),
                        Center(
                          child: Container(
                            width: 600.w,
                            height: 600.h,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Image.asset(
                                'assets/images/logo.jpg',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          'تسجيل الدخول',
                          style: GoogleFonts.tajawal(
                            textStyle:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      color: Colors.black,
                                      fontSize: 100.sp,
                                      // fontWeight: FontWeight.w700,
                                      //  fontStyle: FontStyle.italic,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text('تبرعك بالدم إنقاذ لحياة إنسان بحاجته ',
                            style: GoogleFonts.tajawal(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: Colors.grey),
                            )),
                        SizedBox(
                          height: 50.h,
                        ),
                        TextFormField(
                          textDirection: TextDirection.ltr,
                          controller: email,
                          validator: (value) {
                            return UserInputValidation.ValidateEmail(
                                value: value.toString());
                          },
                          decoration: InputDecoration(
                            label: Text(
                              'البريد الإلكتروني',
                              style: GoogleFonts.tajawal(
                                  textStyle: TextStyle(color: Colors.red)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        TextFormField(
                          textDirection: TextDirection.ltr,
                          controller: password,
                          validator: (value) {
                            return UserInputValidation.ValidatePassword(
                                value: value.toString());
                          },
                          obscureText: cubit.isPassword,
                          decoration: InputDecoration(
                            label: Text(
                              'كلمة المرور',
                              style: GoogleFonts.tajawal(
                                  textStyle: TextStyle(color: Colors.red)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            prefixIcon: IconButton(
                              icon: Icon(
                                (cubit.isPassword)
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.red,
                              ),
                              onPressed: () => cubit.changePasswordIcon(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        BlocProvider(
                          create: (context) => LoginCubit(),
                          child: BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              if (state is LoadingState) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              return Container(
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          var tokenPh=AppSharedPreferences.getTokenPh;
                                          LoginCubit.get(context).userLogin(email: email.text, password: password.text,token:tokenPh,context: context);

                                        }
                                      },
                                      child: Text('تسجيل دخول'.toUpperCase(), style: GoogleFonts.tajawal(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
                                          ))));
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('لا تمتلك حساب',
                                  style: GoogleFonts.tajawal(
                                    textStyle: TextStyle(
                                      fontSize: 50.sp,
                                    ),
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              BlocConsumer<AppCubit, AppState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  if (state is getLocationLoading) {
                                    return Container(
                                        height: 5,
                                        width: 35,
                                        child: CupertinoActivityIndicator(
                                            color: Colors.red));
                                  }

                                  return defaultTextButton(
                                      color: Colors.red,
                                      text: 'إنشاء حساب ',
                                      function: () async {
                                        await AppCubit.get(context)
                                            .determinePosition(context);


                                      });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 75.h,
                        ),
                        Center(
                          child: defaultTextButton(
                              color: Colors.red,
                              text: 'نسيت كلمة المرور ',
                              function: () {
                                navigatorTo(context, ForgetPassword());
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
