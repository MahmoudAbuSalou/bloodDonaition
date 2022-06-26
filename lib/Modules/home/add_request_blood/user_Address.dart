


import 'package:blood_donation_project/Modules/home/add_request_blood/blood_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/validation/userValidation.dart';

class AddRequestBlood extends StatefulWidget {
  const AddRequestBlood({Key? key}) : super(key: key);





  @override
  State<AddRequestBlood> createState() => _AddRequestBloodState();
}

class _AddRequestBloodState extends State<AddRequestBlood> {

  TextEditingController city = TextEditingController();

  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,

        title: Text('تسجيل عنوان المريض',
            style: GoogleFonts.tajawal(color:Color(0xFF192747),fontWeight: FontWeight.bold)),

        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).maybePop();
              },
              child: Icon(
                  Icons.arrow_forward_ios,
                  color:Color(0xFF192747)
              )),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Container(
        //   color: Color(0xFFFDA4BA).withOpacity(.1),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key:formKey ,
              child: Column(
                textDirection: TextDirection.rtl,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20,top: 20),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                            spreadRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextFormField(

                        controller: F_name,
                        validator: (String  ?value){
                          return  UserInputValidation.ValidateName(value: value);
                          return null;
                        },
                        textDirection: TextDirection.rtl,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          border: InputBorder.none,
                          hintText: 'الاسم ',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(color:Color(0xFF192747), fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: L_name,
                        validator: (String  ?value){
                          return  UserInputValidation.ValidateName(value: value);
                          return null;
                        },
                        textDirection: TextDirection.rtl,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsetsDirectional.only(end: 20),

                          border: InputBorder.none,
                          //label: Text('الاسم الاول '),
                          hintText: 'العائلة ',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(color: Color(0xFF192747), fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                            spreadRadius: 0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextFormField(
                        controller: phone,
                        validator: (String  ?value){
                          return  UserInputValidation.ValidatePhone(value: value);
                          return null;
                        },
                        textDirection: TextDirection.rtl,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsetsDirectional.only(end: 20),

                          border: InputBorder.none,
                          //label: Text('الاسم الاول '),
                          hintText: 'الهاتف ',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(color: Color(0xFF192747), fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                              spreadRadius: 0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Slider(
                            divisions: 20,
                            label: value.toInt().toString(),
                            value: value,
                            onChanged: (v) {
                              setState(() {
                                value = v;
                              });
                            },
                            min: 0,
                            max: 20,
                          ),
                          Center(
                              child: Text(
                                "عدد اكياس الدم المطلوبة : ${value.toInt()}",
                                style: TextStyle(
                                    color: Color(0xFF192747), fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ),
                  ),

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: InkWell(
                      child: Container(
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'المدينة',
                            labelStyle: GoogleFonts.tajawal(
                                textStyle: TextStyle(
                                    color: Color(0xFF192747), fontSize: 55.sp)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                          ),
                          child: Text(
                            city.text,
                            style: TextStyle(
                                color: Color(0xFF192747), fontWeight: FontWeight.bold),

                          ),
                        ),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                  SizedBox(height: 80.h,),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: InkWell(
                      child: Container(
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'تاريخ الانتهاء',
                            labelStyle: GoogleFonts.tajawal(
                                textStyle: TextStyle(
                                    color: Color(0xFF192747), fontSize: 55.sp)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                          ),
                          child: Text(
                            date.text,
                            style: TextStyle(
                                color: Color(0xFF192747), fontWeight: FontWeight.bold),

                          ),
                        ),
                      ),
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse('2200-01-01'))
                            .then((value) {

                          print(value.toString().substring(0, 10));
                          setState(() {
                            date.text = value.toString().substring(0, 10);
                          });
                          print(date.text);
                        }).catchError((error) {
                          print(error.toString());
                        });
                      },
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[
                        Text(':لمن تريد الدم ',style: TextStyle(
                            color: Color(0xFF192747)
                        ), )
                      ]
                  ),
                  Container(
                    //  height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                          spreadRadius: 0,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Radio(
                          value: '1',
                          groupValue: _val,
                          onChanged: (value) {
                            setState(() {
                              _val = value.toString();
                            });
                          },
                          activeColor: Colors.red,
                        ),
                        Text('لك'),
                        Radio(
                          value: '2',
                          groupValue: _val,
                          onChanged: (value) {
                            setState(() {
                              _val = value.toString();
                            });
                          },
                          activeColor: Colors.red,
                        ),
                        Text('لقريبك'),
                        Radio(
                          value: '3',
                          groupValue: _val,
                          onChanged: (value) {

                            setState(() {
                              _val = value.toString();
                            });
                          },
                          activeColor: Colors.red,
                        ),
                        Text('لشخص اخر'),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h,),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: "key",
        onPressed: () {

          if(formKey.currentState!.validate())
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BloodType()));
        },
        child: Icon(Icons.add),
        // mini: true,
      ),

    );
  }
}


