import 'package:blood_donation_project/Modules/donate/all_donors_one_post/all_donors_screen.dart';
import 'package:blood_donation_project/Modules/donate/donate_screen.dart';
import 'package:blood_donation_project/Modules/google_maps/google_maps_screen.dart';
import 'package:blood_donation_project/Modules/home/home_details/details.dart';
import 'package:blood_donation_project/cubit/donate_cubit/donate_cubit.dart';
import 'package:blood_donation_project/cubit/layoutCubit/home_cubit.dart';
import 'package:blood_donation_project/cubit/notification/notification_cubit.dart';
import 'package:blood_donation_project/cubit/search_cubit/search_screen.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:blood_donation_project/shared/style/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Models/post/Post.dart';
import '../../../cubit/home/all_post_cubit.dart';

class HomePage extends StatelessWidget implements PreferredSizeWidget {
  final double barHeight = 50.0;
  bool type;

  HomePage({required this.type});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 100.0);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllPostCubit, AllPostState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              child: ClipPath(
                clipper: WaveClip(),
                child: Container(
                  color: Colors.redAccent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 20.w),
                            child: Text(
                              'قائمة الطلبات',
                              style: GoogleFonts.tajawal(
                                fontSize: 60.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 8.0),
                            child: IconButton(
                              icon: Icon(
                                IconBroken.Location,
                                size: 35.0,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                navigatorTo(context, GoogleMapsScreen());
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.only(end: 15.0),
                            child: IconButton(
                              icon: Icon(
                                IconBroken.Search,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                navigatorTo(context, SearchScreen());
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              preferredSize: Size.fromHeight(kToolbarHeight + 100.h)),
          body: state is GetPostSuccessfully
              ? SmartRefresher(
                  controller: AllPostCubit.get(context).refreshController1,
                  enablePullUp: true,
                  enablePullDown: true,
                  onRefresh: () async {
                    AllPostCubit.get(context).getPost();
                  },
                  onLoading: () async {
                    AllPostCubit.get(context).getPost();
                  },
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: type == false
                        ? state.Emergency.length
                        : state.normal.length,
                    itemBuilder: (context, index) {
                      return listItem(
                          context,
                          type == false
                              ? state.Emergency[index]
                              : state.normal[index]);
                    },
                  ),
                )
              : state is GetPostLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: Text("Empty"),
                    ),
        );
      },
    );
  }

  Widget listItem(context, Data post) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
      child: GestureDetector(
        onTap: () {
          navigatorTo(
              context,
              DetailsScreen(
                postId: post.postId!,
                name: post.user!.name,
              ));
        },
        child: Container(
          height: 500.h,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 3)],
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(35), topLeft: Radius.circular(50)),
          ),
          child: Column(
            children: [
              Expanded(
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
                          '${post.bloodType}',
                          style: GoogleFonts.tajawal(
                            fontSize: 60.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(width: 7),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 7),
                          Text(
                            'طلب تبرُّع بالدم',
                            style: TextStyle(
                              color: Color(0xff041b2d),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${post.phone}',
                            style: TextStyle(
                              color: Color(0xffddddda),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (AppSharedPreferences.getUserId != post.userId)
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xfffe676e),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 4)
                              ]),
                          child: TextButton(
                            onPressed: () {
                              navigatorTo(
                                  context,
                                  DonateScreen(
                                    postID: post.postId,
                                    userId: post.userId,
                                  ));
                            },
                            child: Text(
                              'تَبَرَّع الآن',
                              style: GoogleFonts.tajawal(
                                fontSize: 45.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    else
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 4)
                              ]),
                          child: TextButton(
                            onPressed: () async {
                              await MyPostsCubit.get(context)
                                  .getDonors(post.postId!);
                              navigatorTo(
                                context,
                                AllDonorsScreen(
                                  postID: post.postId,
                                ),
                              );
                            },
                            child: Text(
                              'المتبرّعين',
                              style: GoogleFonts.tajawal(
                                fontSize: 40.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(width: 7),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Divider(height: 4),
              Expanded(
                  child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(
                              '    :المريض',
                              style: TextStyle(
                                color: Color(0xff041b2d),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${post.firstName} ${post.lastName}',
                              style: GoogleFonts.tajawal(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(
                              '    :العنوان ',
                              style: GoogleFonts.tajawal(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${post.cityName}',
                              style: GoogleFonts.tajawal(
                                fontSize: 25.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Location,
                          size: 25.0,
                          color: Color(0xff384e7b),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '${post.hospitalName}',
                          style: TextStyle(color: Color(0xff94b0b7)),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 2.0,
              ),
              Divider(height: 1),
              Expanded(
                  child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        margin: EdgeInsetsDirectional.only(end: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            await Share.share(
                              ' مريض بحاجة إلى زمرة دم: ${post.bloodType}\n'
                              ' عدد الأكياس المطلوبة: ${post.bloodBags}\n'
                              'من يستطيع التبرع أو يعرف شخصا قادر على التبرع يتواصل معنا مباشرة على الرقم التالي:\n'
                              '${post.user!.phone} \n',
                              subject: 'أحتاج مساعدة!',
                            );
                          },
                          icon: Icon(
                            Icons.share,
                            size: 30.0,
                            color: Color(0xff384e7b),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          margin: EdgeInsetsDirectional.only(end: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              await FlutterPhoneDirectCaller.callNumber(
                                  '0' + (post.phone).toString());
                            },
                            icon: Icon(
                              IconBroken.Calling,
                              size: 30.0,
                              color: Color(0xff384e7b),
                            ),
                          )),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          margin: EdgeInsetsDirectional.only(end: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              int? number = post.phone;
                              print(number);
                              launchWhatsApp(
                                number: "+963" + (number).toString(),
                                message:
                                    " مريض بحاجة إلى زمرة دم: ${post.bloodType}\n"
                                    " عدد الأكياس المطلوبة: ${post.bloodBags}\n"
                                    "من يستطيع التبرع أو يعرف شخصا قادر على التبرع يتواصل معنا مباشرة على الرقم التالي:\n"
                                    "${post.user!.phone} \n",
                              );
                            },
                            icon: SvgPicture.asset(
                              'assets/images/whatsapp.svg',
                              height: 30.0,
                              width: 30.0,
                            ),
                          )),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  void launchWhatsApp({
    required number,
    required message,
  }) async {
    var url = "whatsapp://send?phone=" + number + "&text=" + message;
    launchUrl(Uri.parse(url));
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    final lowPoint = size.height - 30;
    final highPoint = size.height - 60;
    //
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
