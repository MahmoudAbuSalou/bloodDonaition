import 'package:blood_donation_project/Models/post/Post.dart';
import 'package:blood_donation_project/Modules/donate/donate_screen.dart';
import 'package:blood_donation_project/Modules/home/home_details/details.dart';
import 'package:blood_donation_project/cubit/search_cubit/cubit/search_cubit.dart';
import 'package:blood_donation_project/cubit/search_cubit/cubit/search_states.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/style/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 5.0),
                    child: TextFormField(
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      autocorrect: true,
                      autofocus: true,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        labelText: 'بـحــث',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        prefixIcon: Icon(IconBroken.Search),
                        suffixIcon: IconButton(
                          icon: Icon(IconBroken.Send),
                          onPressed: () {
                            SearchCubit.get(context)
                                .search(searchController.text);
                          },
                        ),
                      ),
                      onChanged: (String value) {
                        SearchCubit.get(context).search(value.toString());
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Must not be Empty!';
                        }
                        return null;
                      },
                    ),
                  ),
                  if (state is SearchLoadingState) LinearProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  if (state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => listItem(
                            context,
                            SearchCubit.get(context)
                                .searchModel
                                .data![index]),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount:
                            SearchCubit.get(context).searchModel.data!.length,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget listItem(context, Data post) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: () {
          print('PostID Is: ');
          print(post.postId);
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
                            )),
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
