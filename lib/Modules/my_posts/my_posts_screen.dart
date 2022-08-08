import 'package:blood_donation_project/Models/SinglePost/SinglePost.dart';
import 'package:blood_donation_project/Modules/donate/donate_screen.dart';
import 'package:blood_donation_project/Modules/home/homePage/homePage.dart';
import 'package:blood_donation_project/Modules/home/home_details/details.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class MyPostsScreen extends StatelessWidget {
  const MyPostsScreen({Key? key}) : super(key: key);

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
                          'منشوراتي',
                          style: GoogleFonts.tajawal(
                              fontSize: 60.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 100.h)),
      body: ListView.separated(
        itemBuilder: (context, index)=> listItem(context),
        separatorBuilder: (context, index)=>myDivider(),
        itemCount: 1,
      ),
    );
  }

  Widget listItem(context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GestureDetector(
          onTap: () {
            navigatorTo(
                context,
                DetailsScreen(
                  id: 0,
                ));
          },
          child: Container(
            height: 500.h,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 3)],
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  topLeft: Radius.circular(50)),
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
                          'new',
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
              ],
            ),
          ),
        ));
  }
}
