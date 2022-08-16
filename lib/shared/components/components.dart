import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/onBoarding/onBoardingModel.dart';

import '../../cubit/UsenManagmentCubits/Register/GlobalSettingCubit/global_setting_register_cubit.dart';
import 'constants.dart';

Widget buildItem(business, context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${business['urlToImage']}'),
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          // ignore: sized_box_for_whitespace
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    "${business['title']}",
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    "${business['publishedAt']}",
                    style: const TextStyle(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
    );

void navigatorTo(context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void navigatorToNew(context, Widget screen) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => screen), (route) => false);
}

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  Icon? prefix,
  required Function valid,
  bool correct = true,
  bool focus = true,
  bool isPassword = false,
  bool enable = true,
  Icon? suffix,
  Function? onChanged,
  Function? onSubmitted,
  Function? suffixPressed,
  //Function ?onTap,
}) =>
    TextFormField(
      enabled: enable,
      validator: (s) {
        valid;
        return null;
      },
      // onTap: (){
      //   onTap!();
      // },
      controller: controller,
      keyboardType: type,
      autocorrect: true,
      autofocus: true,
      textAlign: TextAlign.start,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(
                icon: suffix,
                onPressed: () {
                  suffixPressed!();
                },
              )
            : null,
      ),
      onChanged: (s) {
        onChanged;
      },
      onFieldSubmitted: (s) {
        onSubmitted;
      },
    );

Widget defaultTextButton(
    {required String text,
    required Function function,
    Color color = Colors.amber}) {
  return TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text.toUpperCase(),
        style: GoogleFonts.tajawal(
          textStyle: TextStyle(
            color: color,
            fontSize: 65.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));
}

void showToast({required String msg, required ToastState state}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: toastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

// ignore: must_be_immutable
class GroupBlood extends StatelessWidget {
  bool isSelected = false;
  String Content;
  int id;

  GroupBlood({required this.Content, isSelected, required this.id}) : super();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalSettingRegisterCubit, GlobalSettingRegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = GlobalSettingRegisterCubit.get(context);
        cubit.list.add(GroupBlood(
          id: this.id,
          Content: this.Content,
          isSelected: this.isSelected,
        ));
        return InkWell(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              width: 200.w,
              height: 130.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.redAccent),
                borderRadius: BorderRadius.circular(30.r),
                gradient: (cubit.list[id].isSelected)
                    ? LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.red.shade900,
                          Colors.red.shade600,
                          Colors.red.shade400,
                          Colors.red,
                        ],
                      )
                    : LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.white,
                          Colors.white70,
                        ],
                      ),
              ),
              child: Center(
                child: Text(
                  this.Content,
                  style: TextStyle(
                      color: (cubit.list[id].isSelected)
                          ? Colors.white
                          : Colors.red,
                      fontSize: 100.sp),
                ),
              ),
            ),
          ),
          onTap: () {
            print(id);
            // isSelected=!isSelected;
            GlobalSettingRegisterCubit.get(context).changeelectedGroupBlood(id);
          },
        );
      },
    );
  }
}

Widget Choice(
    int value, int groupValue, String content, context, String TypeQues) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 100.w),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Radio(
            value: value,
            groupValue: groupValue,
            onChanged: (val) {
              int temp = int.parse(val.toString());
              (TypeQues == 'Gen')
                  ? GlobalSettingRegisterCubit.get(context)
                      .changeSelectGen(temp)
                  : GlobalSettingRegisterCubit.get(context)
                      .changeSelectWeight(temp);
            }),
        //  SizedBox(width: 20.w,),
        Text(
          content,
          style: GoogleFonts.tajawal(
              textStyle:
                  TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold)),
        )
      ],
    ),
  );
}

Widget buildOnBoardingScreen(OnBoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.urlImage),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          model.tittle,
          textDirection: TextDirection.rtl,
          style: GoogleFonts.tajawal(
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
        ),
        SizedBox(
          height: 20,
        ),
        Text(model.details,
            textDirection: TextDirection.rtl,
            style: GoogleFonts.tajawal(
              textStyle: TextStyle(fontSize: 14),
            ))
      ],
    );
