

import 'package:auto_size_text/auto_size_text.dart';
import 'package:blood_donation_project/Modules/home/add_request_blood/blood_type.dart';
import 'package:flutter/material.dart';

class AddRequestBlood extends StatefulWidget {
  const AddRequestBlood({Key? key}) : super(key: key);

  @override
  State<AddRequestBlood> createState() => _AddRequestBloodState();
}

class _AddRequestBloodState extends State<AddRequestBlood> {
  double value = 10;
  TextEditingController F_name = TextEditingController();
  TextEditingController L_name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController date = TextEditingController();
  String _val = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: AutoSizeText('تسجيل بيانات المريض',
            style: TextStyle(color: Colors.red)),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).maybePop();
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.red,
              )),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Container(
        color: Color(0xFFFDA4BA).withOpacity(.1),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              textDirection: TextDirection.rtl,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextFormField(
                      controller: F_name,
                      textDirection: TextDirection.rtl,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsetsDirectional.only(end: 20),

                        border: InputBorder.none,
                        //label: Text('الاسم الاول '),
                        hintText: 'الاسم ',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(color: Colors.red, fontSize: 20),
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
                    ),
                    child: TextFormField(
                      controller: L_name,
                      textDirection: TextDirection.rtl,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsetsDirectional.only(end: 20),

                        border: InputBorder.none,
                        //label: Text('الاسم الاول '),
                        hintText: 'العائلة ',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(color: Colors.red, fontSize: 20),
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
                    ),
                    child: TextFormField(
                      controller: phone,
                      textDirection: TextDirection.rtl,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsetsDirectional.only(end: 20),

                        border: InputBorder.none,
                        //label: Text('الاسم الاول '),
                        hintText: 'الهاتف ',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(color: Colors.red, fontSize: 20),
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
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: TextFormField(
                      controller: city,
                      textDirection: TextDirection.rtl,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsetsDirectional.only(end: 20),

                        border: InputBorder.none,
                        //label: Text('الاسم الاول '),
                        hintText: 'المدينة ',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(color: Colors.red, fontSize: 20),
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
                    ),
                    child: TextFormField(
                      controller: date,
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
                        hintStyle: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children:[
                  Text(':لمن تريد الدم ',style: TextStyle(
                    color: Colors.red
                  ), )
        ]
                ),
                Container(
                //  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
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
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: "key",
        onPressed: () { 
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BloodType()));
        },
        child: Icon(Icons.add),
       // mini: true,
      ),

    );
  }
}
