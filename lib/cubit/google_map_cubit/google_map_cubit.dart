import 'dart:collection';
import 'dart:typed_data';

import 'package:blood_donation_project/Models/google_map_markers/hospital_marker.dart';
import 'package:blood_donation_project/cubit/google_map_cubit/google_map_states.dart';
import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapCubit extends Cubit<GoogleMapStates> {
  GoogleMapCubit() : super(GoogleMapInitialState());

  static GoogleMapCubit get(context) => BlocProvider.of(context);

  late GoogleMapController controller;
  var myMarker = HashSet<Marker>(); // Collection

  void onMapCreated(GoogleMapController googleMapController) {
    controller = googleMapController;
  }

  getCustomMarker({
    required String name,
    required LatLng position,
  }) async {
    await getBytesFromAsset('assets/images/bloodDonationMarker.png', 150)
        .then((value) {
      myMarker.add(
        Marker(
          markerId: MarkerId(name),
          position: position,
          infoWindow: InfoWindow(
            title: name,
            snippet: 'ومن أحياها فكأنما أحيا الناس جميعا',
          ),
          icon: BitmapDescriptor.fromBytes(value!),
        ),
      );
      emit(GoogleMapCreateMarkerSuccessState());
    }).catchError((error) {
      emit(GoogleMapCreateMarkerErrorState());
      print(error.toString());
    });
  }

  void getAllMarker() {
    hospitals.forEach((element) {
      getCustomMarker(name: element.name, position: element.position);
    });
  }

  // PolyLines And Polygons
  // final Polyline myPolyLine = Polyline(
  //   polylineId: PolylineId('المواساة-الاسد'),
  //   points: [cities[0].position, cities[1].position],
  //   width: 5,
  // );
  //
  // final Polygon myPolygon = Polygon(
  //   polygonId: PolygonId('hospitals'),
  //   points: [
  //     cities[0].position,
  //     cities[1].position,
  //     cities[2].position,
  //     cities[3].position
  //   ],
  //   strokeWidth: 5,
  //   fillColor: Colors.transparent,
  // );
  onChangedTextForm(String value) {
    emit(GoogleMapLoadOnChangeSearchState());
    print(value);
  }
}
