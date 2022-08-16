import 'package:blood_donation_project/Modules/donate/all_donors_one_post/all_donors_screen.dart';
import 'package:blood_donation_project/Modules/home/home_details/details.dart';
import 'package:blood_donation_project/Modules/my_posts/update_post_screen.dart';
import 'package:blood_donation_project/cubit/donate_cubit/donate_cubit.dart';
import 'package:blood_donation_project/cubit/donate_cubit/donate_state.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/style/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class MyPostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyPostsCubit, MyPostsStates>(
      listener: (context, state) {
        if (state is DeletePostSuccessState) {
          MyPostsCubit.get(context).getMyPosts();
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.ltr, //it's Need More design
          child: Scaffold(
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
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                IconBroken.Arrow___Left_2,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 20.w),
                              child: Text(
                                'منشوراتي',
                                style: GoogleFonts.tajawal(
                                  fontSize: 60.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
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
                itemBuilder: (context, index) {
                  return postItem(
                      context, MyPostsCubit.get(context).myPosts[index]);
                },
                separatorBuilder: (context, index) => myDivider(),
                itemCount: MyPostsCubit.get(context).myPosts.length),
          ),
        );
      },
    );
  }

  Widget postItem(context, post) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: () {
          navigatorTo(
              context,
              DetailsScreen(
                postId: post.postId,
                name: post.user.name,
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
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
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
                          'قيد التقدُّم',
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
                          onPressed: () async {
                            await MyPostsCubit.get(context)
                                .getDonors(post.postId);
                            navigatorTo(
                              context,
                              AllDonorsScreen(postID: post.postId),
                            );
                          },
                          child: Text(
                            'المتبرّعين',
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
                  child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Column(
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
                              '${post.firstName} ${post.lastName}',
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
                          mainAxisAlignment: MainAxisAlignment.start,
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
                              '${post.cityName}',
                              style: TextStyle(color: Color(0xff041b2d)),
                            ),
                          ],
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  Spacer(),
                  Row(
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
                        '${post.hospitalName}',
                        style: TextStyle(color: Color(0xff94b0b7)),
                      ),
                    ],
                  ),
                ],
              )),
              SizedBox(
                height: 1,
              ),
              Divider(height: 1),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            await Share.share(
                                ' مريض بحاجة إلى زمرة دم ${post.bloodType} عدد الأكياس المطلوبة ${post.bloodBags} من يستطيع التبرع أو يعرف شخصا قادر على التبرع يتواصل معنا مباشرة على الرقم التالي : ${post.phone}',
                                subject: 'need Help!');
                          },
                          icon: Icon(
                            Icons.share,
                            color: Color(0xff384e7b),
                          ),
                        )),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.redAccent[100],
                        ),
                        child: IconButton(
                          onPressed: () async {
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
                                    padding: const EdgeInsetsDirectional.only(bottom: 30.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                                MyPostsCubit.get(context)
                                                    .deletePost(
                                                        postId: post.postId);
                                                Navigator.pop(context);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: Icon(IconBroken.Delete,
                              color: Colors.yellow, size: 24.0),
                        )),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            navigatorTo(context, UpdatePostScreen(singlePostData: post,));
                          },
                          icon: Icon(IconBroken.Edit_Square,
                              color: Color(0xff384e7b), size: 24.0),
                        )),
                  ),
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
