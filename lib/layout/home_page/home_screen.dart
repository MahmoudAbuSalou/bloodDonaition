
import 'package:blood_donation_project/Modules/home/add_request_blood/user_info.dart';
import 'package:blood_donation_project/layout/cubit/home_cubit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
          HomeCubit  cubit = HomeCubit().get(context);
          return  Scaffold(
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
                        child: Text('Blood Donation App',style: GoogleFonts.tajawal(
                          fontSize: 22,
                          color: Colors.white
                        ),),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      width:double.infinity,
                      height: 500,

                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(

                          children: [
                            ListTile(
                              title:  Text('الملف الشخصي',style: GoogleFonts.tajawal(
                                fontSize: 22,

                              )),
                              onTap: () {
                                // Update the state of the app.
                                // ...
                              },
                            ),
                            ListTile(
                              title:  Text('بحاجة للدم ',style: GoogleFonts.tajawal(
                                fontSize: 22,

                              )),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder:(context){
                                  return   AddRequestBlood();
                                },));
                              },
                            ),
                            ListTile(
                              title:  Text('الاعدادات',style: GoogleFonts.tajawal(
                                fontSize: 22,

                              )),
                              onTap: () {
                                // Update the state of the app.
                                // ...
                              },
                            ),
                            ListTile(
                              title:  Text('من نحن ',style: GoogleFonts.tajawal(
                                fontSize: 22,

                              )),
                              onTap: () {
                                // Update the state of the app.
                                // ...
                              },
                            ),
                          ],
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
              items:  <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                    child: iconNavBar('assets/images/blood_nav.svg','حالة أسعافية',)),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                    child: iconNavBar('assets/images/blood_nav.svg','الرئيسية',)),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 15.w),
                    child: iconNavBar('assets/images/blood_nav.svg','الملف الشخصي',)),

              ],
              onTap: (index) {

                // cubit.getHomeData();
                cubit.changeScreen(index);

              },
            ),

          );
        },
      ),
    );
  }
  Widget  iconNavBar(String image,String name)
  {
    return Column(
      children: [
        SvgPicture.asset(image,width: 30,height: 30,),
        Text(
          name,
          style: GoogleFonts.tajawal(
            fontWeight: FontWeight.bold,
              fontSize: 35.sp,
            color: Colors.black
          ),
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
