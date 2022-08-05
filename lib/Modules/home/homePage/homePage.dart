import 'package:blood_donation_project/Modules/donate/donate_screen.dart';
import 'package:blood_donation_project/Modules/google_maps/google_maps_screen.dart';
import 'package:blood_donation_project/Modules/home/home_details/details.dart';
import 'package:blood_donation_project/cubit/search_cubit/search_screen.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/style/icon_broken.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget implements PreferredSizeWidget {
  final double barHeight = 50.0;

  HomePage();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 100.0);

  @override
  Widget build(BuildContext context) {
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 70.sp),
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
                          padding: const EdgeInsetsDirectional.only(end: 15.0),
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
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 30,
            itemBuilder: (context, index) {
              return listItem(context);
            }));
  }

  Widget listItem(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: () {
          navigatorTo(context, DetailsScreen());
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
                        'AB+',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                            navigatorTo(context, DonateScreen());
                          },
                          child: Text(
                            'Donate',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  SizedBox(width: 7),
                ],
              )),
              SizedBox(
                height: 1,
              ),
              Divider(height: 1),
              Expanded(
                  child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
                          '  غصن خالد محسن',
                          style: TextStyle(color: Color(0xff041b2d)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          '    :العنوان ',
                          style: TextStyle(
                            color: Color(0xff041b2d),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'مشفى المجتهد',
                          style: TextStyle(color: Color(0xff041b2d)),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 1,
              ),
              Divider(height: 1),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_location_alt,
                          size: 18,
                          color: Color(0xff384e7b),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'مشفى المجتهد',
                          style: TextStyle(color: Color(0xff94b0b7)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Color(0xff384e7b),
                        ),
                      ))
                ],
              )),
            ],
          ),
        ),
      ),
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
