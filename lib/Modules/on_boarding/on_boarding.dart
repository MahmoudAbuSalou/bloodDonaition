import 'package:blood_donation_project/Modules/login/login_screen.dart';
import 'package:blood_donation_project/cubit/AppCubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cachehelper.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen() : super();

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController onBoardingController = PageController();

  bool isLast = false;

  @override
  initState() {
    AppCubit.get(context).CheckNet();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        //cubit.CheckNet();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            actions: [
              TextButton(
                  onPressed: () {
                    if (cubit.netConnected) submit(context);
                  },
                  child: Text((cubit.netConnected) ? 'Skip' : ''))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: (cubit.netConnected)
                ? Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          onPageChanged: (int index) {
                            if (onBoardingObject.length - 1 == index) {
                              isLast = true;
                            } else {
                              isLast = false;
                            }
                          },
                          controller: onBoardingController,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              buildOnBoardingScreen(onBoardingObject[index]),
                          itemCount: onBoardingObject.length,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        children: [
                          SmoothPageIndicator(
                            controller: onBoardingController,
                            count: onBoardingObject.length,
                            axisDirection: Axis.horizontal,
                            effect: ExpandingDotsEffect(
                              spacing: 8.0,
                              //radius:  4.0,
                              //expansionFactor: 2,
                              dotWidth: 20.0,
                              dotHeight: 16.0,
                              strokeWidth: 1.5,
                              dotColor: Colors.grey,
                              activeDotColor: Colors.red,
                            ),
                          ),
                          Spacer(),
                          FloatingActionButton(
                            //  mini: true,
                            onPressed: () {
                              if (isLast) {
                                submit(context);
                              } else {
                                onBoardingController.nextPage(
                                    duration: Duration(seconds: 2),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              }
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 60.sp,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                : Column(
                    children: [
                      Image.asset('assets/images/noConnection.jpg'),
                      Text(
                        'يرجى التحقق من الاتصال بالإنترنت',
                        style: GoogleFonts.tajawal(
                          fontSize: 50.h,
                        ),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
          ),
        );
      },
    );
  }

  void submit(context) {
    CacheHelper.saveData(key: "onBoarding", value: true).then((value) {
      if (value) {
        navigatorToNew(context, LogInScreen());
      }
    });
  }
}
