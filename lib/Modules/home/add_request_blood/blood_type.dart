
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodType extends StatelessWidget {
  const BloodType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsetsDirectional.all(20),
          child: Column(
            textDirection:TextDirection.rtl ,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width:150.w,
                height: 150.h,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image(
                    image:AssetImage('images/blood.jpg'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('الرجاءاختيار زمرة الدم المطلوبة',
                style: TextStyle(
                    fontSize: 80.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.red

                ),

              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 60.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 320.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(child: Text("A",
                          style: TextStyle(
                            fontSize: 120.sp
                          ),)),
                      ),
                    ),
                    SizedBox(width: 70.w,),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 350.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(child: Text("B",
                          style: TextStyle(
                              fontSize: 120.sp
                          ),)),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 60.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 320.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(child: Text("O",
                          style: TextStyle(
                            fontSize: 120.sp
                          ),)),
                      ),
                    ),
                    SizedBox(width: 70.w,),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 350.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(child: Text("AB",
                          style: TextStyle(
                              fontSize: 120.sp
                          ),)),
                      ),
                    ),

                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 300.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(child: Text("-",
                          style: TextStyle(
                            fontSize: 120.sp
                          ),)),
                      ),
                    ),
                    SizedBox(width: 70.w,),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(child: Text("+",
                          style: TextStyle(
                              fontSize: 120.sp
                          ),)),
                      ),
                    ),

                  ],
                ),
              ),
              Spacer(),
              Container(
                width: 400.w,
                height: 200.h,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(onPressed:(){},
                    child:Text(
                  "التالي ",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 80.sp
                      ),
                )

                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
