import 'package:blood_donation_project/Modules/login/login_screen.dart';
import 'package:blood_donation_project/cubit/AppCubit/app_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/components/components.dart';
import '../../shared/validation/userValidation.dart';
import '../register/register_screen.dart';
import 'PinEntry.dart';

// ignore: must_be_immutable
class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit=AppCubit.get(context);
          return Scaffold(

            body: SafeArea(
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Stack(
                            children: [
                              SizedBox(
                                height: 100.h,
                              ),
                              Row(
                                children: [

                                  IconButton(onPressed: () {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LogInScreen(),));
                                  }, icon: Icon(Icons.arrow_back_ios))
                                ],)
                            ],
                          ),
                          Center(
                            child: Container(
                              width: 800.w,
                              height: 1000.h,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset('images/resetPassword.jpg',),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),


                          Text(
                              'أدخل كلمة المرور الجديدة ',
                              style: GoogleFonts.tajawal(
                                textStyle: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(color: Colors.grey),
                              )
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                          //Password
                          TextFormField(
                            textDirection: TextDirection.ltr,
                            controller: password,
                            validator: (value) {
                              return UserInputValidation.ValidatePassword(value: value.toString());
                            },
                            obscureText: cubit.isPassword,
                            decoration: InputDecoration(
                              label: Text(
                                'كلمة المرور',
                                style: GoogleFonts.tajawal(
                                    textStyle:
                                    const TextStyle(color: Colors.red)),
                              ),
                              labelStyle: GoogleFonts.tajawal(
                                  textStyle: TextStyle(
                                      color: Colors.red, fontSize: 40.sp)),
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
                            height: 50.h,
                          ),


                          SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: true /*state is! LoadingState*/,
                            builder: (context) =>
                                Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextButton(
                                        onPressed: () {
                                          // if (_formKey.currentState!
                                          //     .validate()) {
                                          //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PinEntry(),));
                                          //   // cubit.userLogin(
                                          //   //     email: email.text,
                                          //   //     password: password.text);
                                          // }
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PinEntry(),));
                                        },
                                        child: Text(
                                            'تأكيد'.toUpperCase(),
                                            style: GoogleFonts.tajawal(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 70.sp),
                                            )
                                        ))),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('لا تمتلك حساب', style: GoogleFonts.tajawal(
                                textStyle: TextStyle(
                                  fontSize: 50.sp,
                                ),
                              )),
                              defaultTextButton(
                                  color: Colors.red,
                                  text: 'إنشاء حساب ',

                                  function: () {
                                    navigatorTo(context, RegisterScreen());
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: 75.h,
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
      ),
    );
  }
}
