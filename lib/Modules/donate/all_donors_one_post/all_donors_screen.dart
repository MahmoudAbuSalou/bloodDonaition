import 'package:blood_donation_project/Models/donation/donors_model.dart';
import 'package:blood_donation_project/cubit/donate_cubit/donate_cubit.dart';
import 'package:blood_donation_project/cubit/donate_cubit/donate_state.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:blood_donation_project/shared/style/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../my_posts/my_posts_screen.dart';

class AllDonorsScreen extends StatelessWidget {
  final int? postID;

  AllDonorsScreen({required this.postID});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyPostsCubit, MyPostsStates>(
      listener: (context, state) {
        if (state is ConfirmDonorSuccessState) {
          showToast(
              msg: 'تم تأكيد عمليّة التبرُّع بنجاح, شكراً لكم❤️',
              state: ToastState.SUCCESS);
          MyPostsCubit.get(context).getDonors(postID!);
        }
      },
      builder: (context, state) {
        var cubit = MyPostsCubit.get(context);
        List<int> count;
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
            body: Conditional.single(
              context: context,
              // ignore: unnecessary_null_comparison
              conditionBuilder: (context) => cubit.dataModel.length != null,
              widgetBuilder: (context) => SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5.0,
                      margin: EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          Image(
                            image: AssetImage('assets/images/img.png'),
                            fit: BoxFit.cover,
                            height: 200.0,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'الأشخاص المتبرُّعين: ${cubit.dataModel.length}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildPostItem(context, cubit.dataModel[index],
                            cubit.dataModel[index].donateId);
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10.0,
                      ),
                      itemCount: MyPostsCubit.get(context).dataModel.length,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
              fallbackBuilder: (context) =>
                  Center(child: CircularProgressIndicator()),
            ));
      },
    );
  }

  Widget buildPostItem(context, model, donateId) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage('assets/images/blood.png'),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${model.user.name}',
                              style: TextStyle(
                                height: 1.4,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 16.0,
                            ),
                          ],
                        ),
                        Text(
                          '${model.user.createdAt}',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                height: 1.4,
                              ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      size: 16.0,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                '${model.user.name} يريد التبرُّع بالدُّم لكم. ',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                '${model.user.email}',
                style: TextStyle(color: Colors.blue, fontSize: 16.0),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 15.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        MyPostsCubit.get(context).confirmDonor(donateId, context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 4)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Document,
                                size: 25.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'قبول',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 4)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Delete,
                                size: 25.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'حذف',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.grey, blurRadius: 4)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Calling,
                                size: 25.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'اتصال',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
