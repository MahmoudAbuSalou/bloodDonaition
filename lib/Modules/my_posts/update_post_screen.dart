import 'package:blood_donation_project/Models/SinglePost/SinglePost.dart';
import 'package:blood_donation_project/Models/post/Post.dart';
import 'package:blood_donation_project/cubit/donate_cubit/donate_cubit.dart';
import 'package:blood_donation_project/cubit/donate_cubit/donate_state.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/style/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_posts_screen.dart';

// ignore: must_be_immutable
class UpdatePostScreen extends StatelessWidget {
  Data singlePostData;

  UpdatePostScreen({required this.singlePostData});

  var formKey = GlobalKey<FormState>();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneController = TextEditingController();
  var userIdController = TextEditingController();
  var bloodBagsController = TextEditingController();
  var cityNameController = TextEditingController();
  var hospitalNameController = TextEditingController();
  var genderController = TextEditingController();
  var postTypeController = TextEditingController();
  var expiredDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyPostsCubit(),
      child: BlocConsumer<MyPostsCubit, MyPostsStates>(
        listener: (context, state) {
          if (state is UpdateSinglePostForDonorsSuccessfullyState) {
            MyPostsCubit.get(context).getMyPosts();
          }
        },
        builder: (context, state) {
          firstNameController.text = singlePostData.firstName!;
          lastNameController.text = singlePostData.lastName!;
          phoneController.text = (singlePostData.phone!).toString();
          userIdController.text = (singlePostData.userId!).toString();
          bloodBagsController.text = (singlePostData.bloodBags!).toString();
          cityNameController.text = singlePostData.cityName!;
          hospitalNameController.text = singlePostData.hospitalName!;
          genderController.text = singlePostData.gender!;
          postTypeController.text = (singlePostData.postType!).toString();
          expiredDateController.text = singlePostData.expiryDate!;

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
                                'تعديل معلومات الطلب',
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
            body: SingleChildScrollView(
              child: Conditional.single(
                context: context,
                conditionBuilder: (context) => singlePostData != null,
                widgetBuilder: (context) => Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          if (state is UpdateSinglePostForDonorsLoadingState)
                            LinearProgressIndicator(),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultTextFormField(
                              controller: firstNameController,
                              type: TextInputType.text,
                              label: 'الإسم الأوّل',
                              valid: (String value) {
                                if (value.isEmpty) {
                                  return 'هذا الحقل لا يمكن أن يكون فارغاّ';
                                }
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultTextFormField(
                              controller: lastNameController,
                              type: TextInputType.text,
                              label: 'الإسم الأخير',
                              valid: (String value) {
                                if (value.isEmpty) {
                                  return 'هذا الحقل لا يمكن أن يكون فارغاّ';
                                }
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultTextFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              label: 'الهاتف',
                              valid: (String value) {
                                if (value.isEmpty) {
                                  return 'هذا الحقل لا يمكن أن يكون فارغاّ';
                                }
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultTextFormField(
                              controller: bloodBagsController,
                              type: TextInputType.number,
                              label: 'عدد الوحدات المطلوبة',
                              valid: (String value) {
                                if (value.isEmpty) {
                                  return 'هذا الحقل لا يمكن أن يكون فارغاّ';
                                }
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultTextFormField(
                              controller: cityNameController,
                              type: TextInputType.text,
                              label: 'إسم المدينة',
                              valid: (String value) {
                                if (value.isEmpty) {
                                  return 'هذا الحقل لا يمكن أن يكون فارغاّ';
                                }
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultTextFormField(
                              controller: hospitalNameController,
                              type: TextInputType.text,
                              label: 'إسم المستشفى',
                              valid: (String value) {
                                if (value.isEmpty) {
                                  return 'هذا الحقل لا يمكن أن يكون فارغاّ';
                                }
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultTextFormField(
                              enable: false,
                              controller: genderController,
                              type: TextInputType.text,
                              label: 'الجنس',
                              valid: (String value) {
                                if (value.isEmpty) {
                                  return 'هذا الحقل لا يمكن أن يكون فارغاّ';
                                }
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultTextFormField(
                              controller: expiredDateController,
                              enable: false,
                              type: TextInputType.text,
                              label: 'تاريخ الإنتهاء',
                              valid: (String value) {
                                if (value.isEmpty) {
                                  return 'هذا الحقل لا يمكن أن يكون فارغاّ';
                                }
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultTextButton(
                            text: 'حفظ التعديلات',
                            function: () {
                              if (formKey.currentState!.validate()) {
                                MyPostsCubit.get(context).updatePost(
                                    postId: singlePostData.postId!,
                                    firstName: firstNameController.text,
                                    userId: int.parse(userIdController.text),
                                    lastName: lastNameController.text,
                                    bloodBags: bloodBagsController.text,
                                    cityName: cityNameController.text,
                                    hospitalName: hospitalNameController.text,
                                    gender: genderController.text,
                                    postType: postTypeController.text,
                                    phone: phoneController.text,
                                    expiredDate: expiredDateController.text);
                                Navigator.pop(context);
                                MyPostsCubit.get(context).getMyPosts();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                fallbackBuilder: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
