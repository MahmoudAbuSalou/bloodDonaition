import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blood_donation_project/Models/user/userModel.dart';
import 'package:blood_donation_project/Modules/home/homePage/homePage.dart';
import 'package:blood_donation_project/cubit/AppCubit/app_cubit.dart';
import 'package:blood_donation_project/cubit/UsenManagmentCubits/Register/register_cubit/register_cubit.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/UsenManagmentCubits/Register/register_cubit/register_states.dart';
import '../../layout/home_page/home_screen.dart';
import 'ResetPassword.dart';

// ignore: must_be_immutable
class PinEntry extends StatefulWidget {
  PinEntry({Key? key, required this.email, required this.page})
      : super(key: key);
  final email;

  final page;
  final forgetPass = 'ForgetPassword';
  final register = 'Register';
  bool mistake = false;

  @override
  State<PinEntry> createState() => _PinEntryState();
}

class _PinEntryState extends State<PinEntry> with WidgetsBindingObserver {
  initState() {
    super.initState();

    AppCubit.get(context).generatePin(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: SafeArea(
            child: Scaffold(
              body: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Stack(
                          children: [
                            SizedBox(height: 150.h),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(Icons.arrow_back_ios)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Text(
                        'إدخال رمز التحقق',
                        style: GoogleFonts.tajawal(
                            textStyle: Theme
                                .of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'يرجى التحقق من وصول الرمز إلى بريدك الإلكتروني',
                        style: GoogleFonts.tajawal(
                          fontSize: 50.h,
                        ),
                      ),
                      SizedBox(height: 80.h),
                      BlocProvider(
                        create: (context) =>
                            RegisterCubit(RegisterInitialState()),
                        child: BlocConsumer<RegisterCubit, RegisterState>(
                          listener: (context, state) {

                          },
                          builder: (context, state) {
                            return Container(
                              height: 1800.h,
                              child: PinCodeWidget(
                                deleteButtonColor: Colors.teal,
                                filledIndicatorColor: Colors.teal,
                                onPressColorAnimation: Colors.lightBlueAccent,
                                buttonColor: Colors.blueGrey,
                                numbersStyle: GoogleFonts.tajawal(
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 70.sp)),
                                emptyIndicatorColor: Colors.black12,
                                onFullPin: (pin, __) {

                                    if (pin == AppCubit.get(context).pin.pin) {


                                      if (widget.page == widget.register) {
                                        RegisterCubit.get(context).signUp(user: AppCubit.get(context).userGlobal);
                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                          builder: (context) => HomeLayout(),
                                        ));
                                      }
                                      if (widget.page == widget.forgetPass)
                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                          builder: (context) =>
                                              ResetPassword(
                                                  email: widget.email),
                                        ));
                                    }
                                    else {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.ERROR,
                                        animType: AnimType.BOTTOMSLIDE,
                                        title: 'رمز التحقق خاطئ',
                                        desc: 'يرجى التحقق من بياناتك المدخلة',
                                        descTextStyle: GoogleFonts.tajawal(
                                          fontSize: 40.sp,
                                        ),
                                        btnOkText: 'رمز جديد',
                                        btnCancelText: "حسناً",
                                        btnCancelOnPress: () {
                                          widget.mistake = true;
                                          if (widget.page == widget.register)
                                            AppCubit.get(context).deleteUser(
                                                context);
                                          if (widget.page == widget.forgetPass)
                                            Navigator.of(context).pop();
                                        },
                                        btnOkOnPress: () {
                                          widget.mistake = true;
                                          AppCubit.get(context)
                                              .generatePin(widget.email);
                                        },
                                      )
                                        ..show();
                                    }


                                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPassword(),));
                                },
                                initialPinLength: 6,
                                onChangedPin: (_) {},
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
