import 'package:blood_donation_project/Modules/home/blood_cubit/blood_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';



class BloodType extends StatelessWidget {
   BloodType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>BloodCubit(),
        child: BlocConsumer<BloodCubit,BloodState>(
          listener: (context, state) {},
          builder: (context, state) {
            BloodCubit cubit = BloodCubit().get(context);
            return  SafeArea(
              child: Scaffold(
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Padding(
                    padding: EdgeInsetsDirectional.all(20),
                    child: Column(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 150.w,
                          height: 150.h,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SvgPicture.asset('images/blood_add.svg'),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          '...الرجاءاختيار زمرة الدم المطلوبة',
                          style: GoogleFonts.tajawal(
                              fontSize: 60.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF192747)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: BloodItem(type:'A',index: 1,cubit: cubit,)),
                              SizedBox(
                                width: 70.w,
                              ),
                              Expanded(child: BloodItem(type:'B',index: 2,cubit: cubit,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 60.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: BloodItem(type:'O',index: 3,cubit: cubit,)),
                              SizedBox(
                                width: 70.w,
                              ),
                              Expanded(child: BloodItem(type:'AB',index: 4,cubit: cubit,)),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(bottom: 300.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: BloodItem(type:'-',index: 5,cubit: cubit,)),
                              SizedBox(
                                width: 70.w,
                              ),
                              Expanded(child: BloodItem(type:'+',index: 6,cubit: cubit,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 300.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: BloodItem(type:'بلازما',index: 7,cubit: cubit,)),

                            ],
                          ),
                        ),
                        Container(
                          width: 400.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 3,
                                offset: Offset(3,3),
                                blurStyle: BlurStyle.normal,
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "التالي ",
                                style:
                                TextStyle(color: Colors.black87, fontSize: 80.sp,fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          ),
    );
  }
}

// ignore: must_be_immutable
class BloodItem extends StatefulWidget {
  bool isSelected=false ;
  int index ;
  String type;
  BloodCubit cubit;
  BloodItem({Key? key, required this.type,isSelected,required this.index,required this.cubit}) : super(key: key);

  @override
  _BloodItemState createState() => _BloodItemState();
}

class _BloodItemState extends State<BloodItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if(widget.index==7){
            widget.cubit.currentIndex2 = 0;
            widget.cubit.changeTypeBlood(widget.index);
          }
          else{
            widget.cubit.changeTypeBlood(widget.index);
          }
               print(widget.cubit.currentIndex1);
               print(widget.cubit.currentIndex2);

        });
      },
      child: Container(

        decoration: BoxDecoration(
          color: (widget.index == widget.cubit.currentIndex1||
              widget.index == widget.cubit.currentIndex2)? Color(0xFFEF5350):Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
            )
          ]
        ),
        child: Center(
            child: Text(
              widget.type,
          style: TextStyle(fontSize: 100.sp),
        )),
      ),
    );
  }
}
