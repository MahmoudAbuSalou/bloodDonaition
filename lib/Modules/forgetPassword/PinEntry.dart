
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../shared/components/components.dart';
import '../register/register_screen.dart';
import 'ResetPassword.dart';

class PinEntry extends StatelessWidget {
  PinEntry({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Directionality(
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
                             IconButton(onPressed: (){
                               Navigator.of(context).pop();
                             }, icon: Icon(Icons.arrow_back_ios)),
                           ],
                         )
                       ],
                     ),
                   ),
                  Text(
                    'إدخال رمز التحقق',
                    style: GoogleFonts.tajawal(
                      textStyle: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                   SizedBox(height: 30.h),
                   Text('يرجى التحقق من وصول الرمز إلى بريدك الإلكتروني',style: GoogleFonts.tajawal(
                     fontSize: 50.h,

                   ),),
                   SizedBox(height: 80.h),
                  Container(
                    height: 1800.h,
                    child: PinCodeWidget(

                      deleteButtonColor: Colors.teal,

                      filledIndicatorColor:Colors.teal ,

                      onPressColorAnimation: Colors.lightBlueAccent,
                      buttonColor: Colors.blueGrey,
                      numbersStyle: GoogleFonts.tajawal(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 70.sp
                        )
                      ),
                      emptyIndicatorColor: Colors.black12,
                      onFullPin: (_, __) {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPassword(),));
                      },
                      initialPinLength: 5,
                      onChangedPin: (_) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
