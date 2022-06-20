import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/register_cubit/register_states.dart';
import '../../shared/components/components.dart';
import '../login/login_screen.dart';

class EditPorfile extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(

          body: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () =>
                            Navigator.pop(context),
                      ),
                      SizedBox(
                        height: 150.h,
                      ),
                      Text('تعديل الملف الشخصي',
                          style: GoogleFonts.tajawal(
                            textStyle: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                      ),

                      SizedBox(
                        height: 30.h,
                      ),

                      /*Text('مساهمتك تنقذ حياة غيرك',
                          style: GoogleFonts.tajawal(
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: Colors.grey),
                          )),*/

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
                          label: Text(
                            'البريد الإلكتروني',
                            style: GoogleFonts.tajawal(
                              textStyle: TextStyle(color: Colors.red),
                            ),
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

                      //Password
                      /*TextFormField(
                        textDirection: TextDirection.ltr,
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال كلمة المرور بشكل صحيح ';
                          }
                          return null;
                        },
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
                      ),*/

                      SizedBox(
                        height: 50.h,
                      ),

                      MaterialButton(onPressed: (){
                        if(formKey.currentState!.validate()){
                          Fluttertoast.showToast(msg: 'تم تعديل الملف الشخصي',textColor: Colors.white,backgroundColor: Colors.green,gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_LONG);
                        }
                        else Fluttertoast.showToast(msg: 'فشل تعديل الملف الشخصي',textColor: Colors.white,backgroundColor: Colors.red,gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_LONG);
                      },child: Text('تعديل الملف الشخصي'),color: Colors.red,minWidth: double.infinity,)


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
