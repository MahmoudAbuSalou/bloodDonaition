import 'package:blood_donation_project/Modules/login/login_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/register_cubit/register_cubit.dart';
import '../../cubit/register_cubit/register_states.dart';
import '../../shared/components/components.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen() : super();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () => navigatorTo(context, LogInScreen()),
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('إنشاء حساب',
                            style: GoogleFonts.tajawal(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    color: Colors.black,
                                  ),
                            )),

                        SizedBox(
                          height: 30.h,
                        ),

                        Text('مساهمتك تنقذ حياة غيرك',
                            style: GoogleFonts.tajawal(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: Colors.grey),
                            )),

                        SizedBox(
                          height: 80.h,
                        ),

                        //Name
                        TextFormField(
                          textDirection: TextDirection.rtl,
                          controller: name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى إدخال الاسم كاملاً بشكل صحيح';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              'الاسم',
                              style: GoogleFonts.tajawal(
                                textStyle: const TextStyle(color: Colors.red),
                              ),
                            ),
                            labelStyle: GoogleFonts.tajawal(
                                textStyle: TextStyle(
                                    color: Colors.red, fontSize: 40.sp)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.red,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 50.h,
                        ),

                        //Phone
                        TextFormField(
                          textDirection: TextDirection.ltr,
                          controller: phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى إدخال رقم الهاتف  بشكل صحيح (9XXXXXXXX)';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              'الهاتف',
                              style: TextStyle(color: Colors.red),
                            ),
                            labelStyle: GoogleFonts.tajawal(
                                textStyle: TextStyle(
                                    color: Colors.red, fontSize: 40.sp)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: Colors.red,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 50.h,
                        ),

                        //Password
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

                        //BirthDate
                        IconButton(
                          onPressed: () => showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1960),
                            lastDate: DateTime.now(),
                          ),
                          icon: Icon(
                            Icons.calendar_today,
                            color: Colors.red,
                          ),
                        ),

                        SizedBox(
                          height: 50.h,
                        ),

                        //Group Bloods
                        Container(
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'زمر الدم',
                              labelStyle: GoogleFonts.tajawal(
                                  textStyle: TextStyle(
                                      color: Colors.red, fontSize: 55.sp)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GroupBlood(
                                        Content: 'A+',
                                      id: 0,
                                        ),
                                    GroupBlood(
                                        Content: 'B+',
                                      id: 1,
                                        ),
                                    GroupBlood(
                                        Content: 'AB+',
                                      id: 2,
                                        ),
                                    GroupBlood(
                                        Content: 'O+',
                                      id: 3,
                                        ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GroupBlood(
                                      Content: 'A-',
                                      id: 4,
                                    ),
                                    GroupBlood(
                                      Content: 'B-',
                                      id: 5,
                                    ),
                                    GroupBlood(
                                      Content: 'AB-',
                                      id: 6,
                                    ),
                                    GroupBlood(
                                      Content: 'O-',
                                      id: 7,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 70.h,
                        ),

                        //Register Button
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => Container(
                              width: double.infinity,
                              height: 100.h,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {}
                                  },
                                  child: Text(
                                    'Register'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 50.sp),
                                  ))),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
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
