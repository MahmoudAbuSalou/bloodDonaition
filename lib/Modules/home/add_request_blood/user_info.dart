


import 'package:blood_donation_project/Models/blood_post/blood_request.dart';
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
  BloodRequest bloodRequest = BloodRequest(firstName: '', lastName: '', bloodBags: '0', cityName: '', hospitalName: '', gender: '', postType: false, bloodType: '', bloodOwner: '', phone:'', expiryDate:'');
  double bloodBagsRequired = 0;

  TextEditingController F_name = TextEditingController();
  TextEditingController L_name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController date = TextEditingController();
  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  String _val = '1';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,

        title: Text('تسجيل بيانات المريض',
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
                  TextFormInfo(hintText: 'الاسم', controller: F_name,type: TextInputType.name,function: (String  ?value)=>UserInputValidation.ValidateName(value: value)),
                  TextFormInfo(hintText: 'العائلة', controller: L_name,type: TextInputType.name,function: (String  ?value)=>UserInputValidation.ValidateName(value: value)),
                  TextFormInfo(hintText: 'الهاتف', controller: phone,type: TextInputType.phone,function: (String  ?value)=>UserInputValidation.ValidatePhone(value: value)),
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
                            label: bloodBagsRequired.toInt().toString(),
                            value: bloodBagsRequired,
                            onChanged: (v) {
                              setState(() {
                                bloodBagsRequired = v;
                                bloodRequest.bloodBags = v.toString();
                              });
                            },
                            min: 0,
                            max: 20,
                          ),
                          Center(
                              child: Text(
                            "عدد اكياس الدم المطلوبة : ${bloodBagsRequired.toInt()}",
                            style: TextStyle(
                                color: Color(0xFF192747), fontWeight: FontWeight.bold),
                          ))
                        ],
                      ),
                    ),
                  ),
                  /// TODO
                  Padding(
                    padding: EdgeInsets.only(bottom: 50),
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
                        controller: city,
                        validator: (String  ?value){
                          return  UserInputValidation.ValidateName(value: value);

                        },
                        textDirection: TextDirection.rtl,

                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsetsDirectional.only(end: 20),

                          border: InputBorder.none,
                          //label: Text('الاسم الاول '),
                          hintText: 'المدينة ',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(color: Color(0xFF192747), fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  /// TODO
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
                        controller: date,
                        validator: (String  ?value){
                          return  UserInputValidation.ValidateDate(value: value);

                        },
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2200-01-01'))
                              .then((value) {
                            print(value.toString().substring(0, 10));
                            date.text = value.toString().substring(0, 10);
                            print(date.text);
                            //DateFormat.yMMMd().format(value!);
                          }).catchError((error) {
                            print(error.toString());
                          });
                        },
                        // textDirection: TextDirection.rtl,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsetsDirectional.only(end: 20),

                          border: InputBorder.none,
                          //label: Text('الاسم الاول '),
                          hintText: 'تاريخ الاْنتهاء ',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(color: Color(0xFF192747), fontSize: 20),
                        ),
                      ),
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
                              bloodRequest.bloodOwner = 'لي';
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
                              bloodRequest.bloodOwner = 'لقريبي';
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
                              bloodRequest.bloodOwner = 'لشخص اخر';
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
            bloodRequest.firstName=F_name.text;
            bloodRequest.lastName=L_name.text;
            bloodRequest.expiryDate=date.text;
            bloodRequest.phone=phone.text;
            bloodRequest.cityName=city.text;

            print(bloodRequest.firstName);
          print(bloodRequest.lastName);
          print(bloodRequest.phone);
          print(bloodRequest.cityName);
          print(bloodRequest.bloodOwner);
          print(bloodRequest.expiryDate);
          print(bloodRequest.bloodBags);

          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BloodType()));

        },
        child: Icon(Icons.add),
       // mini: true,
      ),

    );
  }
  Widget TextFormInfo({required TextEditingController controller,required String hintText,required TextInputType type,required Function function}){
    return  Padding(
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

          controller: controller,
          validator: (String  ?value){
            return  function(value);

          },
          textDirection: TextDirection.rtl,
          keyboardType: type,

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            border: InputBorder.none,
            hintText: hintText,
            hintTextDirection: TextDirection.rtl,
            hintStyle: TextStyle(color:Color(0xFF192747), fontSize: 20),
          ),
        ),
      ),
    );
  }
}
