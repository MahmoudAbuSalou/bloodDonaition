import 'package:blood_donation_project/Models/google_map_markers/hospital_marker.dart';
import 'package:blood_donation_project/cubit/google_map_cubit/google_map_cubit.dart';
import 'package:blood_donation_project/cubit/google_map_cubit/google_map_states.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:blood_donation_project/shared/style/icon_broken.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class GoogleMapsScreen extends StatefulWidget {
  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  late LatLng initialCameraPosition =
      const LatLng(33.51177742614248, 36.262189082469476);

  TextEditingController sourceController = TextEditingController();

  TextEditingController destinationController = TextEditingController();

  TextEditingController testController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GoogleMapCubit()..getAllMarker(),
      child: BlocConsumer<GoogleMapCubit, GoogleMapStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GoogleMapCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Google Maps'),
            ),
            body: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/blood.png',
                        height: 80.0,
                        width: 80.0,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                            top: 15.0, end: 8.0),
                        child: TextFormField(
                          textDirection: TextDirection.ltr,
                          controller: sourceController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يرجى إدخال كلمة بحث صحيحة ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              '  البحث عن مشفى ',
                              style: GoogleFonts.tajawal(
                                  textStyle: TextStyle(color: Colors.red)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          onChanged: (String value) {
                            print(value);
                          },
                          onFieldSubmitted: (value) {
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                            target: initialCameraPosition, zoom: 15.0),
                        onMapCreated: cubit.onMapCreated,
                        myLocationEnabled: true,
                        markers: cubit.myMarker,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
