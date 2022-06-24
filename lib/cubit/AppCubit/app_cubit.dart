
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../shared/network/remote/dio_helper.dart';


part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  bool netConnected=false;
  static AppCubit get(context) => BlocProvider.of(context);


  IconData suffx = Icons.visibility_outlined;
  bool isPassword = true;
  late var myLocation;
  void changePasswordIcon() {
    isPassword = !isPassword;
    if (isPassword) {
      suffx = Icons.visibility_outlined;
      emit(ChangeIconPassResetScreen());
    } else {
      suffx = Icons.visibility_off_outlined;
      emit(ChangeIconPassResetScreen());
    }
  }


  void CheckNet()async{
    emit(checkNet());
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        netConnected=true;
        emit(checkNet());
      }
    } on SocketException catch (_) {
      netConnected=false;
      emit(checkNet());
    }
  }

  ///get Lat And Lang for device
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  determinePosition(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    myLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(myLocation.latitude);
    print(myLocation.longitude);
    final location=   convertPosToReality(this.myLocation);
    return location;
  }

  //Convert Lat And Lang To Real Location
  convertPosToReality(myLocation) async {




    //  List<Placemark> placemarks = await placemarkFromCoordinates(myLocation.latitude, myLocation.longitude);
    //
    //  Placemark place = placemarks[0];
    // var Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    //  print(Address);
     final response= await
    DioHelper.getData(url: 'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=33.4928577&longitude=36.3177715&localityLanguage=ar');
   String  Address="${response.data['principalSubdivision']}-${response.data['localityInfo']['administrative'][2]['name']}";

     print(Address);

    return Address;

/*


https://api.geoapify.com/v1/geocode/reverse?lat=33.4972255&lon=36.3164525&type=postcode&format=json&apiKey=d548c5ed24604be6a9dd0d989631f783
 */



  }
}
