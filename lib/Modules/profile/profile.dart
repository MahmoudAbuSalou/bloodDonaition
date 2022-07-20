import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:blood_donation_project/shared/network/local/cachehelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/components/components.dart';
import '../../shared/style/icon_broken.dart';
import 'edit_profile/edit_profile.dart';

class Profile extends StatelessWidget {
  TextEditingController textEditingController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(physics: BouncingScrollPhysics(), children: [
        Stack(
          alignment: Alignment.center,
          children: [
            buildImage(),
            Positioned(
              bottom: 0,
              right: MediaQuery.of(context).size.width / 3,
              child: ClipOval(
                child: Container(
                  color: Colors.redAccent,
                  padding: EdgeInsets.all(3.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    //child: Text("AB+"),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        buildNameEmail(),
        buildContainer(),
        Padding(
          padding:EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
          child: Column(
            children: [

              buildTextTile(title: 'زمرة الدم',subtitle: '',trailing: '${AppSharedPreferences.getBlood_type}',leading: Icon(Icons.location_on)),
              buildTextTile(title: 'رقم الهاتف',subtitle: '',trailing: '${AppSharedPreferences.getPhone}',leading: Icon(Icons.phone_enabled)),
              buildTextTile(title: 'العنوان',subtitle: '',trailing: '${AppSharedPreferences.getAddress}',leading: Icon(Icons.location_on)),
              buildTextTile(title: 'البريد الإلكتروني',subtitle: '',trailing: '${AppSharedPreferences.getEmail}',leading: Icon(Icons.email_outlined)),

            /*  buildFormFiled(
                text: 'الأسم',
                onTap: () {},
                rIcon: Icons.location_on,
                text2: '${CacheHelper.getData(key: 'name')}',
              ),
              buildFormFiled(
                  text: 'رقم الهاتف',
                  onTap: () {},
                  rIcon: Icons.phone_enabled,
                  text2: '${CacheHelper.getData(key: 'phone')}'),
              buildFormFiled(
                text: 'البريد الإلكتروني',
                onTap: () {},
                rIcon: Icons.email_outlined,
                text2: '${CacheHelper.getData(key: 'email')}',
              ),*/
            ],
          ),
        )
      ]),
    );
  }
}

PreferredSize buildAppBar(BuildContext context) {
  return PreferredSize(
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
                      'الملف الشخصي',
                      style: TextStyle(color: Colors.white, fontSize: 70.sp),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 15.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        navigatorTo(context, EditPorfile());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(kToolbarHeight + 100.h));
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 10);

    var firstControlPoint = Offset(size.width / 3, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 3), size.height);
    var secondPoint = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

Widget buildImage() {
  return ClipOval(
    child: Material(
      color: Colors.transparent,
      child: Ink.image(
        image: AssetImage('assets/images/profile.jpg'),
        width: 120,
        height: 120,
        child: InkWell(
          onTap: () {},
        ),
      ),
    ),
  );
}

Widget buildNameEmail() => Column(
      children: [
        Text(
          "Mohammad Kh",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "Mohammad alkhateb880@gmail.com",
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );

Widget buildContainer() => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 150,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "هل تبرعت بالدم من قبل ؟",
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  //Text("154"),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ]),
          ),
          Spacer(),
          Container(
            height: 60,
            width: 150,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "هل تبرعت بالدم من قبل ؟",
                    style: TextStyle(fontSize: 14, color: Colors.red),
                  ),
                ),
                // Text("154"),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ]),
          ),
        ],
      ),
    );

Widget buildFormFiled(
        {required IconData rIcon,
        required String text,
        required String text2,
        required var onTap}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          /*IconButton(
        color: Colors.redAccent,
        onPressed: onTap,
        icon: Icon(Icons.edit,size: 20,),
    ),*/
          CustomListTile(text, onTap, text2),
          Icon(
            rIcon,
          ),
        ],
      ),
    );

class CustomListTile extends StatelessWidget {
  String text;
  String text2;
  var onTap;

  CustomListTile(this.text, this.onTap, this.text2);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(19.0, 0, 19.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        child: InkWell(
          splashColor: Colors.redAccent,
          onTap: this.onTap,
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text2,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black45,
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTextTile(
    {required String title,
    required String subtitle,
    required String trailing,
    required Icon leading}) {
  return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(

        leading: leading,
        title:Container(
          decoration: BoxDecoration(

            border: Border(

              bottom: BorderSide(
                color: Colors.grey.shade400,
                width: 1.5,
              ),
            ),
          ),
          height: 45,
          child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight:FontWeight.bold,
            color: Colors.black,
          ),
        ),
        ),

        /* */
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black45,
          ),
        ),
        trailing:Directionality(
          textDirection: TextDirection.ltr,
          child:Text(

          trailing,
          overflow: TextOverflow.ellipsis ,
          style: TextStyle(

            fontSize: 12,
            color: Colors.black45,
          ),
        ),) ,

      ),
  );
}
