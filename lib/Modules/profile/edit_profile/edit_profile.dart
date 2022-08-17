import 'package:blood_donation_project/cubit/profile_cubit/profile_cubit.dart';
import 'package:blood_donation_project/cubit/profile_cubit/profile_state.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../cubit/UsenManagmentCubits/Register/GlobalSettingCubit/global_setting_register_cubit.dart';
import '../../../shared/components/components.dart';
import '../../login/login_screen.dart';

class EditPorfile extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileCubit(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
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
                                onPressed: () => Navigator.pop(context),
                              ),
                              SizedBox(
                                height: 150.h,
                              ),
                              Text(
                                'تعديل الملف الشخصي',
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
                                height: 120.h,
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
                                      textStyle:
                                          const TextStyle(color: Colors.red),
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
                              //email
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


                              //type of blood
                              Container(
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    labelText: 'زمر الدم',
                                    labelStyle: GoogleFonts.tajawal(
                                      textStyle: TextStyle(
                                          color: Colors.red, fontSize: 55.sp),
                                    ),
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

                              Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: Container(
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                      labelText: 'الوزن',
                                      labelStyle: GoogleFonts.tajawal(
                                        textStyle: TextStyle(
                                            color: Colors.red, fontSize: 55.sp),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Text(
                                                  'KG',
                                                  style: GoogleFonts.tajawal(
                                                    textStyle: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.red),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 3.0,
                                                ),
                                                Text(
                                                  '${ProfileCubit.get(context).value_slider.floor()}',
                                                  style: GoogleFonts.tajawal(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18.0,
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Slider(
                                          max: 120,
                                          min: 40,
                                          value: ProfileCubit.get(context)
                                              .value_slider,
                                          onChanged: (double value) {
                                            ProfileCubit.get(context)
                                                .changValue(value);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 50.h,
                              ),

                              MaterialButton(

                                onPressed: () {

                                  if (formKey.currentState!.validate()) {

                                    String bloodTypeSelected=GlobalSettingRegisterCubit.get(context)
                                        .list[GlobalSettingRegisterCubit.get(context).indexG]
                                        .Content;
                                    // *unSubscribe* with old topic
                                    FirebaseMessaging.instance.unsubscribeFromTopic("${AppSharedPreferences.getBlood_type.substring(0,AppSharedPreferences.getBlood_type.length - 1)}");
                                    // *subscribe* with old topic
                                    FirebaseMessaging.instance.subscribeToTopic("${bloodTypeSelected.substring(0, bloodTypeSelected.length - 1)}");


                                    ProfileCubit.get(context).updateUserData(
                                      context: context,
                                        name: name.text,
                                        phone: int.parse(phone.text),
                                        email: email.text,
                                        bloodType:bloodTypeSelected,
                                        weight: ProfileCubit.get(context).value_slider.round(),
                                    );

                                    Fluttertoast.showToast(
                                        msg: 'تم تعديل الملف الشخصي',
                                        textColor: Colors.white,
                                        backgroundColor: Colors.green,
                                        gravity: ToastGravity.BOTTOM,
                                        toastLength: Toast.LENGTH_LONG);


                                  } else
                                    Fluttertoast.showToast(
                                        msg: 'فشل تعديل الملف الشخصي',
                                        textColor: Colors.white,
                                        backgroundColor: Colors.red,
                                        gravity: ToastGravity.BOTTOM,
                                        toastLength: Toast.LENGTH_LONG);
                                },
                                child: Text('تعديل الملف الشخصي',
                                style: TextStyle(color: Colors.white),),
                                color: Colors.red,
                                minWidth: double.infinity,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));

    /* */
  }
}
