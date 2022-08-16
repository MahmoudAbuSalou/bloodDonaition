import 'package:blood_donation_project/Models/SinglePost/SinglePost.dart';
import 'package:blood_donation_project/Modules/donate/donate_screen.dart';
import 'package:blood_donation_project/cubit/SinglePost/single_post_cubit.dart';
import 'package:blood_donation_project/cubit/SinglePost/single_post_state.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  int postId;
  String? name;
  String _val = '1';
  double value = 10;

  DetailsScreen({required this.postId, required this.name});

  @override
  Widget build(BuildContext context) {
    SinglePostData singlePostData = new SinglePostData();
    return BlocProvider(
      create: (context) => SinglePostCubit()..getSinglePost(id: postId),
      child: BlocConsumer<SinglePostCubit, SinglePostState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetSinglePostSuccessfully) {
            singlePostData = state.singlePost.data!;
          }
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
                  onPressed: () async {
                    await Share.share(
                      ' مريض بحاجة إلى زمرة دم: ${singlePostData.bloodType}\n'
                      ' عدد الأكياس المطلوبة: ${singlePostData.bloodBags}\n'
                      'من يستطيع التبرع أو يعرف شخصا قادر على التبرع يتواصل معنا مباشرة على الرقم التالي:\n'
                      '${singlePostData.phone} \n',
                      subject: 'أحتاج مساعدة!',
                    );
                  },
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
                              ),
                            ),
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
                                          ),
                                        ),
                                        Expanded(
                                            child: Text(
                                          'عدد الوحدات المجموعة ',
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
                                              '${singlePostData.bloodBags}',
                                              style: GoogleFonts.tajawal(
                                                  color: Color(0xff384e7b),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 60.sp),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '${(singlePostData.bloodBagsCollect)}',
                                              style: GoogleFonts.tajawal(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 60.sp),
                                            ),
                                          ),
                                        ),
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
                                        '${singlePostData.bloodType}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0,
                                        ),
                                      )),
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 7),
                                        Text(
                                          'طلب تبرُّع بالدم',
                                          style: GoogleFonts.tajawal(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40.sp,
                                            fontStyle: FontStyle.italic,
                                            color: Color(0xff384e7b),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'قيد التقدُّم',
                                          style: GoogleFonts.tajawal(
                                            fontSize: 30.sp,
                                            color: Colors.grey,
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
                                          '${singlePostData.firstName} ${singlePostData.lastName}',
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
                                          '${singlePostData.hospitalName}',
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
                                          '${singlePostData.expiryDate}',
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
                                          '${name}',
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
                                      onPressed: () {
                                        String number =
                                            '+963' + '${singlePostData.phone}';
                                        FlutterPhoneDirectCaller.callNumber(
                                            number);
                                      },
                                      icon: Icon(
                                        Icons.phone,
                                        color: Colors.green,
                                      ),
                                    ),
                                  )
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
                        'زمر الدم التي تستطيع التبرُّع',
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
                        itemCount: canDonate(bloodType: singlePostData.bloodType)?.length,
                        itemBuilder: (context, index) {
                          return Container(
                              alignment: Alignment.center,
                              width: 160.w,
                              margin: EdgeInsets.symmetric(horizontal: 15.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(60),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 8,
                                      offset: Offset(0, 2)),
                                ],
                              ),
                              child: Text(
                                '${canDonate(bloodType: singlePostData.bloodType)![index]}',
                                style: TextStyle(
                                    fontSize: 60.sp, color: Colors.redAccent),
                              ));
                        },
                      ),
                    ),
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
                navigatorTo(
                  context,
                  DonateScreen(
                    postID: postId,
                    userId: singlePostData.userId,
                  ),
                );
              },
              label: Text(
                '    تبرّع الان    ',
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

  // Widget bloodTypeItem() => ;

  List<String>? canDonate({required String? bloodType}) {
    List<String> donors = [];
    switch (bloodType) {
      case 'A+':
        {
          donors = ['A+', 'A-', 'O+', 'O-'];
          break;
        }
      case 'A-':
        {
          donors = ['A-', 'O-'];
          break;
        }
      case 'B+':
        {
          donors = ['B+', 'B-', 'O+', 'O-'];
          break;
        }
      case 'B-':
        {
          donors = ['B-', 'O-'];
          break;
        }
      case 'AB+':
        {
          donors = ['AB+', 'AB-', 'A+', 'A-', 'O+', 'O-'];
          break;
        }
      case 'AB-':
        {
          donors = ['AB-', 'A-', 'B-', 'O-'];
          break;
        }
      case 'O+':
        {
          donors = ['O+', 'O-'];
          break;
        }
      case 'O-':
        {
          donors = ['O-'];
          break;
        }
      case 'بلازما':
        {
          donors = ['AB+', 'AB-', 'A+', 'A-', 'O+', 'O-'];
          break;
        }
    }

    return donors;
  }
}
