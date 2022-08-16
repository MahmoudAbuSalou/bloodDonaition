import 'package:blood_donation_project/Models/blood_post/blood_request.dart';
import 'package:blood_donation_project/Modules/home/add_request_blood/blood_type.dart';
import 'package:blood_donation_project/cubit/AppCubit/app_cubit.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/validation/userValidation.dart';

// ignore: must_be_immutable
class UserAddress extends StatefulWidget {
  BloodRequest bloodRequest;

  UserAddress({Key? key, required this.bloodRequest}) : super(key: key);

  @override
  State<UserAddress> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  TextEditingController city = TextEditingController();

  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  final LatLng initialCameraPosition =
      const LatLng(33.51177742614248, 36.262189082469476);
  late GoogleMapController controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 2,
            backgroundColor: Colors.red,
            title: Text('تسجيل عنوان المريض',
                style: GoogleFonts.tajawal(
                    color: Color(0xFF192747), fontWeight: FontWeight.bold)),
            centerTitle: true,
          ),
          body: Container(
            //   color: Color(0xFFFDA4BA).withOpacity(.1),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    textDirection: TextDirection.rtl,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 500,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                              target: initialCameraPosition, zoom: 15.0),
                          onMapCreated: onMapCreated,
                          myLocationEnabled: true,
                          onTap: (LatLng latLng) async {
                            widget.bloodRequest.position_Lat = latLng.latitude;
                            widget.bloodRequest.position_Lang =
                                latLng.longitude;
                            print(widget.bloodRequest.position_Lat);
                            print(widget.bloodRequest.position_Lang);

                            city.text = await cubit.convertPosToReality(latLng);

                            print(city.text.toString());
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
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
                                        color: Color(0xFF192747),
                                        fontSize: 55.sp)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40.r),
                                ),
                              ),
                              child: Text(
                                city.text,
                                style: TextStyle(
                                    color: Color(0xFF192747),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      if (state is ConvertLocationLoading)
                        CircularProgressIndicator(),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                              onPressed: () {
                                /// TODO
                                if (city.text.isNotEmpty) {
                                  widget.bloodRequest.cityName =
                                      city.text.toString();
                                  navigatorTo(
                                      context,
                                      BloodType(
                                        bloodRequest: widget.bloodRequest,
                                      ));
                                } else {
                                  showToast(
                                      msg: 'الرجاء تحديد الموقع أولا ',
                                      state: ToastState.WARING);
                                }
                              },
                              child: Text('التالي'.toUpperCase(),
                                  style: GoogleFonts.tajawal(
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  )))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void onMapCreated(GoogleMapController googleMapController) {
    controller = googleMapController;
  }
}
