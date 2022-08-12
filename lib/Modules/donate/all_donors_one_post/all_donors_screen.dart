import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../my_posts/my_posts_screen.dart';

class AllDonorsScreen extends StatelessWidget {

  final int? postID;
  AllDonorsScreen({required this.postID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          'جميع المتبرّعين على هذا المنشور',
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
      body: Center(
        child: Text('All Donors'),
      ),
    );
  }
}
