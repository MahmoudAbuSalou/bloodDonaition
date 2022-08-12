import 'package:blood_donation_project/Modules/donate/donate_screen.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../cubit/SinglePost/single_post_cubit.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  int id;
  String _val = '1';
  double value = 10;

  DetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SinglePostCubit()..getSinglePost(id: id),
      child: BlocConsumer<SinglePostCubit, SinglePostState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xff384e7b),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share, color: Color(0xff192747)),
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150.h,
                      alignment: Alignment.centerRight,
                      child: Text(
                        '...تفاصيل التبرع',
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.bold,
                          fontSize: 65.sp,
                          fontStyle: FontStyle.italic,
                          color: Color(0xff384e7b),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 400.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 12),
                          ]),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                                padding: EdgeInsetsDirectional.only(end: 30.w),
                                child: SvgPicture.asset(
                                  'assets/images/blood_bags.svg',
                                  width: 150.w,
                                  height: 180.h,
                                )),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.w, right: 20.w, top: 70.h),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          'عدد الوحدات المطلوبة',
                                          style: GoogleFonts.tajawal(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35.sp),
                                        )),
                                        Expanded(
                                            child: Text(
                                          'عدد الوحدات المتبقي ',
                                          style: GoogleFonts.tajawal(
                                              color: Color(0xff384e7b),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 35.sp),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 20.h),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '15',
                                                  style: GoogleFonts.tajawal(
                                                      color: Color(0xff384e7b),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 60.sp),
                                                ))),
                                        Expanded(
                                            child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '5',
                                                  style: GoogleFonts.tajawal(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 60.sp),
                                                ))),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Slider(
                                      autofocus: false,
                                      value: 10,
                                      onChanged: (v) {},
                                      min: 0,
                                      max: 15,
                                      inactiveColor: Colors.grey,
                                      activeColor: Colors.redAccent[100],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      height: 600.h,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 3)
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: double.infinity,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Color(0xff0B0742),
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(35),
                                          )),
                                      child: Center(
                                          child: Text(
                                        'AB+',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 7),
                                        Text(
                                          'Request Blood',
                                          style: TextStyle(
                                            color: Color(0xff041b2d),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'in progress',
                                          style: TextStyle(
                                            color: Color(0xffddddda),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 1,
                          ),
                          Divider(height: 22.h),
                          Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 30.w, left: 2.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(
                                          '    :المريض',
                                          style: GoogleFonts.tajawal(
                                            color: Color(0xff041b2d),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '  غصن خالد محسن',
                                          style: TextStyle(
                                              color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(
                                          '    :العنوان ',
                                          style: GoogleFonts.tajawal(
                                            color: Color(0xff041b2d),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'مشفى المجتهد',
                                          style: TextStyle(
                                              color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 35.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(
                                          ': تاريخ الانتهاء',
                                          style: GoogleFonts.tajawal(
                                            color: Color(0xff041b2d),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '2022/11/02',
                                          style: TextStyle(
                                              color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'غصن خالد محسن',
                                          style: GoogleFonts.tajawal(
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          ': صاحب الطلب ',
                                          style: GoogleFonts.tajawal(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff384e7b),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          right: 9.w, bottom: 3.h),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 10),
                                          ]),
                                      child: IconButton(
                                        highlightColor: Colors.white,
                                        splashColor: Colors.white,
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.phone,
                                          color: Colors.green,
                                        ),
                                      ))
                                ],
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 150.h,
                      alignment: Alignment.centerRight,
                      child: Text(
                        'زمر الدم المطلوبة',
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.sp,
                          color: Color(0xff384e7b),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                        height: 200.h,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Container(
                                  alignment: Alignment.center,
                                  width: 160.w,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      // borderRadius: BorderRadius.circular(60),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 8,
                                            offset: Offset(0, 2)),
                                      ]),
                                  child: Text(
                                    'AB+',
                                    style: TextStyle(
                                        fontSize: 60.sp,
                                        color: Colors.redAccent),
                                  ));
                            })),
                    SizedBox(
                      height: 250.h,
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Color(0xFF192747),
              onPressed: () {
                // navigatorTo(context, DonateScreen());
              },
              label: Text(
                '    تبرع الان    ',
                style: GoogleFonts.tajawal(
                    fontSize: 60.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
