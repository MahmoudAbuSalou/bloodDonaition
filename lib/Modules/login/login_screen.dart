import 'package:blood_donation_project/Modules/forgetPassword/forgetPasswordScreen.dart';
import 'package:blood_donation_project/layout/home_page/home_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/login_cubit/login_cubit.dart';
import '../../cubit/login_cubit/login_states.dart';
import '../../shared/components/components.dart';

import '../register/register_screen.dart';


// ignore: must_be_immutable
class LogInScreen extends StatelessWidget {
  LogInScreen() : super();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // if (state is LoginSuccessState) {
          //   // if (state.loginModelResponse.status) {
          //   //   //showToast(msg:state.loginModelResponse.message , state:ToastState.SUCCESS);
          //   //   CacheHelper.saveData(
          //   //           key: 'token', value: state.loginModelResponse.data.token)
          //   //       .then((value) {
          //   //     token = state.loginModelResponse.data.token;
          //   //     showToast(
          //   //         msg: state.loginModelResponse.message,
          //   //         state: ToastState.SUCCESS);
          //   //     navigatorToNew(context, AppScreen());
          //   //   }
          //   //   );
          //   // } else {
          //   //   showToast(
          //   //       msg: state.loginModelResponse.message, state: ToastState.ERROR);
          //   // }
          // }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(

              body: Container(
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
                          SizedBox(
                            height: 100.h,
                          ),
                          Center(
                            child: Container(
                              width: 600.w,
                              height: 600.h,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset('images/logo.jpg',),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),

                          Text(
                            'تسجيل الدخول',
                            style:
                            GoogleFonts.tajawal(
                              textStyle: Theme.of(context).textTheme.headline4?.copyWith(
                                color: Colors.black,
                              fontSize: 100.sp,
                             // fontWeight: FontWeight.w700,
                            //  fontStyle: FontStyle.italic,
                            ),

                            // Theme
                            //     .of(context)
                            //     .textTheme
                            //     .headline4
                            //     ?.copyWith(
                            //   color: Colors.black,
                            //
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'تبرعك بالدم إنقاذ لحياة إنسان بحاجته ',
                            style: GoogleFonts.tajawal(
                              textStyle: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: Colors.grey),
                            )
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          TextFormField(
                            textDirection: TextDirection.ltr,
                            controller: email,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى إدخال بريد إلكتروني بشكل صحيح';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text('البريد الإلكتروني',style: TextStyle(color: Colors.red),),

                              border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined, color: Colors.red,),


                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),

                          TextFormField(
                            textDirection: TextDirection.ltr,
                            controller: password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يرجى إدخال كلمة المرور بشكل صحيح ';
                              }
                              return null;
                            },
                            obscureText: cubit.isPassword,

                            decoration: InputDecoration(
                              label: Text('كلمة المرور',style: TextStyle(color: Colors.red),),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),

                              prefixIcon: IconButton(icon:Icon((cubit.isPassword)?Icons.visibility_off:Icons.visibility,color: Colors.red,),
                                onPressed: ()=>cubit.changePasswordIcon(),

                              ),



                            ),
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: state is! LoadingState,
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
                                          navigatorToNew(context, HomeLayout());
                                          if (_formKey.currentState!
                                              .validate()) {
                                            // cubit.userLogin(
                                            //     email: email.text,
                                            //     password: password.text);
                                          }
                                        },
                                        child: Text(
                                          'تسجيل دخول'.toUpperCase(),
                                          style: GoogleFonts.tajawal(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
                                          )
                                        ))),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('لا تمتلك حساب',style: GoogleFonts.tajawal(
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
      ),
    );
  }
}
