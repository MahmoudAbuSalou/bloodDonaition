
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/AppCubit/app_cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/validation/userValidation.dart';
import '../register/register_screen.dart';
import 'PinEntry.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
   ForgetPassword({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

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

                            IconButton(onPressed: (){
                              Navigator.of(context).pop();
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
                            child: Image.asset('assets/images/forget.jpg',),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),


                      Text(
                          'سنقوم بإرسال رمز التحقق إلى البريدالإلكتروني الخاص بك ',
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
                      TextFormField(
                        textDirection: TextDirection.ltr,
                        controller: email,

                        validator: (value) {
                          return UserInputValidation.ValidateEmail(value: value.toString());
                        },

                        enableSuggestions: true,


                        decoration: InputDecoration(
                          label: Text('البريد الإلكتروني',style: GoogleFonts.tajawal(
                            textStyle: TextStyle(color: Colors.red)
                          ),),

                          border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined, color: Colors.red,),


                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),



                      SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: true/*state is! LoadingState*/,
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
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PinEntry(),));
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
                          Text('لا تمتلك حساب',style: GoogleFonts.tajawal(
                            textStyle: TextStyle(
                              fontSize: 50.sp,
                            ),
                          )),
                          BlocConsumer<AppCubit, AppState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              return defaultTextButton(
                                  color: Colors.red,
                                  text: 'إنشاء حساب ',
                                  function: () async {
                                    String address = await AppCubit.get(context)
                                        .determinePosition(context);
                                    navigatorTo(context, RegisterScreen(Address: address,));
                                  });
                            },
                          ),
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
      ),
    );
  }
}
