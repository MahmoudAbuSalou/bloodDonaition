import 'package:blood_donation_project/Models/user/userModel.dart';
import 'package:blood_donation_project/Modules/forgetPassword/PinEntry.dart';
import 'package:blood_donation_project/Modules/login/login_screen.dart';
import 'package:blood_donation_project/cubit/AppCubit/app_cubit.dart';

import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:blood_donation_project/shared/validation/userValidation.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/UsenManagmentCubits/Register/GlobalSettingCubit/global_setting_register_cubit.dart';
import '../../cubit/UsenManagmentCubits/Register/register_cubit/register_cubit.dart';
import '../../cubit/UsenManagmentCubits/Register/register_cubit/register_states.dart';
import '../../shared/components/components.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  RegisterScreen({required this.Address}) : super();
  String Address;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController date = TextEditingController();

  late dynamic address;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalSettingRegisterCubit, GlobalSettingRegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        GlobalSettingRegisterCubit cubit =
            GlobalSettingRegisterCubit.get(context);

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
                                navigatorTo(context, LogInScreen()),
                          ),
                          SizedBox(
                            height: 150.h,
                          ),
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
                              return UserInputValidation.ValidateName(
                                  value: value.toString());
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
                              return UserInputValidation.ValidatePhone(
                                  value: value.toString());
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
                              return UserInputValidation.ValidateEmail(
                                  value: value.toString());
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
                          //Gender
                          Container(
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'الجنس',
                                labelStyle: GoogleFonts.tajawal(
                                    textStyle: TextStyle(
                                        color: Colors.red, fontSize: 55.sp)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.r),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Choice(0, cubit.grpValueGen, 'ذكر',
                                          context, 'Gen'),
                                      Choice(1, cubit.grpValueGen, 'أنثى',
                                          context, 'Gen')
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 70.h,
                          ),

                          //birthDate
                          InkWell(
                            child: Container(
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'تاريخ الميلاد',
                                  labelStyle: GoogleFonts.tajawal(
                                      textStyle: TextStyle(
                                          color: Colors.red, fontSize: 55.sp)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.r),
                                  ),
                                ),
                                child: Text(
                                  date.text,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 40.sp),
                                ),
                              ),
                            ),
                            onTap: () => showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1960),
                              lastDate: DateTime.now(),
                            ).then((value) {
                              date.text = value.toString().substring(0, 10);

                              print(date.text);
                              setState(() {});
                            }),
                          ),

                          SizedBox(
                            height: 50.h,
                          ),

                          //weight
                          Container(
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'الوزن',
                                labelStyle: GoogleFonts.tajawal(
                                    textStyle: TextStyle(
                                        color: Colors.red, fontSize: 55.sp)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.r),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Choice(
                                      0,
                                      cubit.grpValueWeight,
                                      'بين ال 40 وال 60 كيلو غرام',
                                      context,
                                      'Weight'),
                                  Choice(
                                      1,
                                      cubit.grpValueWeight,
                                      'أكثر من 60 كيلو غرام',
                                      context,
                                      'Weight'),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 70.h,
                          ),

                          //    Register Button
                          Container(
                              width: double.infinity,
                              height: 100.h,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: (state is CheckEmailLoadingState)
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: CircularProgressIndicator(
                                        color: Colors.white,
                                      )),
                                    )
                                  : TextButton(
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          AppCubit.get(context).checkEmail(
                                              UserModel(
                                                  name: name.text,
                                                  token: AppSharedPreferences.getTokenPh,
                                                  phone: int.parse(phone.text),
                                                  password: password.text,
                                                  email: email.text,
                                                  address: widget.Address,
                                                  gender:
                                                      (cubit.grpValueGen == 0)
                                                          ? 'ذكر'
                                                          : 'أنثى',
                                                  weight: (cubit
                                                              .grpValueWeight ==
                                                          0)
                                                      ? 'بين ال 40 وال 60 كيلو غرام'
                                                      : 'أكثر من 60 كيلو غرام',
                                                  bloodType: cubit
                                                      .list[cubit.indexG]
                                                      .Content,
                                                  isAdmin: false,
                                                  birthDate: date.text),context);
                                          FirebaseMessaging.instance.subscribeToTopic(
                                              '${cubit.list[cubit.indexG].Content.substring(0, cubit.list[cubit.indexG].Content.length - 1)}');
                                        }
                                        //   if (formKey.currentState!.validate()) {}
                                      },
                                      child: Text('إنشاء حساب'.toUpperCase(),
                                          style: GoogleFonts.tajawal(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 50.sp),
                                          )))),

                          SizedBox(height: 50.h)
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
    );
  }
}
