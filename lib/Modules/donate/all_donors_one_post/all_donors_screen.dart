import 'package:blood_donation_project/cubit/donate_cubit/donate_cubit.dart';
import 'package:blood_donation_project/cubit/donate_cubit/donate_state.dart';
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
        if(state is GetDonorsSuccessState){
        }
      },
      builder: (context, state) {
        var cubit = MyPostsCubit.get(context);
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
          body:  Conditional.single(
          context: context,
          // ignore: unnecessary_null_comparison
          conditionBuilder: (context) => cubit.dataMode.length != null,
          widgetBuilder: (context) =>SingleChildScrollView(
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
                        image: NetworkImage(
                            'https://img.freepik.com/free-photo/portrait-happy-contented-satisfied-attractive-man-denim-trendy-shirt-showing-with-his-index-finger-top-right-cornerxt_295783-1217.jpg?w=996'),
                        fit: BoxFit.cover,
                        height: 200.0,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'عدد الأشخاص الذين ساهموا بالتبرُّع: ${cubit.dataMode.length}',
                          style: Theme
                              .of(context)
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
                    itemBuilder: (context, index)=> buildPostItem(context),
                    separatorBuilder: (context, index) => SizedBox(height: 10.0,),
                    itemCount: MyPostsCubit.get(context).dataMode.length,
                ),
                SizedBox(height: 8.0,),
              ],
            ),
          ),
          fallbackBuilder: (context) => Center(child: CircularProgressIndicator()),
        )

        );
      },
    );
  }



  Widget buildPostItem(context) =>
      Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                              'Your Name',
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
                          'Date',
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .caption
                              ?.copyWith(
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
                'Your Post Here',
                style: Theme
                    .of(context)
                    .textTheme
                    .subtitle1,
              ),
              // if(model.postImage != '')
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    width: double.infinity,
                    height: 160.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/blood.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0,),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                IconBroken.Heart,
                                size: 16.0,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Like',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .caption,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                IconBroken.Chat,
                                size: 16.0,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '0 comment',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .caption,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage: AssetImage('assets/images/blood.png'),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            'write a comment ...',
                            style:
                            Theme
                                .of(context)
                                .textTheme
                                .caption
                                ?.copyWith(),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Heart,
                          size: 16.0,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Like',
                          style: Theme
                              .of(context)
                              .textTheme
                              .caption,
                        ),
                      ],
                    ),
                    onTap: () {
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );






}
