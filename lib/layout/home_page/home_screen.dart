import 'package:blood_donation_project/Modules/home/add_request_blood/user_info.dart';
import 'package:blood_donation_project/Modules/my_posts/my_posts_screen.dart';
import 'package:blood_donation_project/cubit/AppCubit/app_cubit.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/style/icon_broken.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Modules/profile/profile.dart';
import '../../cubit/layoutCubit/home_cubit.dart';

class HomeLayout extends StatelessWidget implements PreferredSizeWidget {
  final double barHeight = 50.0;

  HomeLayout();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 100.0);
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit().get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Blood Donation App',
                        style: GoogleFonts.tajawal(
                            fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          children: [
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: ListTile(
                                title: Text('الملف الشخصي',
                                    style: GoogleFonts.tajawal(
                                      fontSize: 22,
                                    )),
                                trailing: Icon(
                                  IconBroken.Arrow___Right_2,
                                  size: 25.0,
                                ),
                                leading: Icon(
                                  IconBroken.Profile,
                                  size: 25.0,
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return Profile();
                                    },
                                  ));
                                },
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: ListTile(
                                title: Text('منشوراتي',
                                    style: GoogleFonts.tajawal(
                                      fontSize: 22,
                                    )),
                                trailing: Icon(
                                  IconBroken.Arrow___Right_2,
                                  size: 25.0,
                                ),
                                leading: Icon(
                                  IconBroken.Document,
                                  size: 25.0,
                                ),
                                onTap: () {
                                  navigatorTo(context, MyPostsScreen());
                                },
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: ListTile(
                                title: Text('بحاجة للدم ',
                                    style: GoogleFonts.tajawal(
                                      fontSize: 22,
                                    )),
                                autofocus: true,
                                focusColor: Colors.amber,
                                trailing: Icon(
                                  IconBroken.Arrow___Right_2,
                                  size: 25.0,
                                ),
                                leading: Icon(
                                  IconBroken.Paper_Plus,
                                  size: 45.0,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return AddRequestBlood();
                                    },
                                  ));
                                },
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: ListTile(
                                title: Text('الاعدادات',
                                    style: GoogleFonts.tajawal(
                                      fontSize: 22,
                                    )),
                                trailing: Icon(
                                  IconBroken.Arrow___Right_2,
                                  size: 25.0,
                                ),
                                leading: Icon(
                                  IconBroken.Setting,
                                  size: 25.0,
                                ),
                                onTap: () {
                                  // Update the state of the app.
                                },
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: ListTile(
                                title: Text('تسجيل الخروج',
                                    style: GoogleFonts.tajawal(
                                      fontSize: 22,
                                    )),
                                trailing: Icon(
                                  IconBroken.Arrow___Right_2,
                                  size: 25.0,
                                ),
                                leading: Icon(
                                  IconBroken.Document,
                                  size: 25.0,
                                ),
                                onTap: () {
                                  AppCubit.get(context).logOutUser(context);
                                },
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: ListTile(
                                title: Text('حذف الحساب',
                                    style: GoogleFonts.tajawal(
                                      fontSize: 22,
                                    )),
                                trailing: Icon(
                                  IconBroken.Arrow___Right_2,
                                  size: 25.0,
                                ),
                                leading: Icon(
                                  IconBroken.Document,
                                  size: 25.0,
                                ),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        new AlertDialog(
                                      title: Center(
                                        child: new Text(
                                          'تأكيد الحذف؟',
                                          style: GoogleFonts.tajawal(
                                            fontSize: 80.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.amber,
                                          ),
                                        ),
                                      ),
                                      content: Text(
                                        'إذا كنت متأكد من الحذف, قم بالضغط على زر الحذف,وإلا ألغ العمليّة',
                                        style: GoogleFonts.tajawal(
                                          fontSize: 40.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.only(
                                                  bottom: 30.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: new IconButton(
                                                  icon: new Icon(
                                                    IconBroken.Close_Square,
                                                    size: 50.0,
                                                    color: Colors.blue,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: new IconButton(
                                                    icon: new Icon(
                                                      IconBroken.Delete,
                                                      size: 50.0,
                                                      color: Colors.red,
                                                    ),
                                                    onPressed: () {
                                                      AppCubit.get(context)
                                                          .deleteUser(context);
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: ListTile(
                                title: Text('من نحن ',
                                    style: GoogleFonts.tajawal(
                                      fontSize: 22,
                                    )),
                                trailing: Icon(
                                  IconBroken.Arrow___Right_2,
                                  size: 25.0,
                                ),
                                leading: Icon(
                                  IconBroken.Info_Circle,
                                  size: 25.0,
                                ),
                                onTap: () {
                                  // Update the state of the app.
                                  // ...
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: cubit.screen[cubit.indexScreen],
            bottomNavigationBar: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: cubit.indexScreen,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              color: Colors.redAccent,
              height: 175.h,
              animationCurve: Curves.easeOutExpo,
              items: <Widget>[
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    child: iconNavBar(
                      'assets/images/blood_nav.svg',
                      'حالة أسعافية',
                    )),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    child: iconNavBar(
                      'assets/images/blood_nav.svg',
                      'الرئيسية',
                    )),
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    child: iconNavBar(
                      'assets/images/blood_nav.svg',
                      'الملف الشخصي',
                    )),
              ],
              onTap: (index) {
                // layoutCubit.getHomeData();
                cubit.changeScreen(index);
              },
            ),
          );
        },
      ),
    );
  }

  Widget iconNavBar(String image, String name) {
    return Column(
      children: [
        SvgPicture.asset(
          image,
          width: 30,
          height: 30,
        ),
        Text(
          name,
          style: GoogleFonts.tajawal(
              fontWeight: FontWeight.bold,
              fontSize: 35.sp,
              color: Colors.black),
        )
      ],
    );
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
