import 'dart:async';

import 'package:blood_donation_project/Models/user/User_Respnse.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';




import 'package:blood_donation_project/cubit/Register/register_cubit/register_states.dart';
import 'package:blood_donation_project/shared/network/remote/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geolocator/geolocator.dart';


import 'package:geocoding/geocoding.dart';


import '../../../Models/user/userModel.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/end_point.dart';
import '../../../shared/network/remote/ExceptionHandler.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(RegisterState initialState) : super(RegisterInitialState());


  static RegisterCubit get(context) => BlocProvider.of(context);
  //////////////////////////

  List<Placemark>? placemarks;
  late var myLocation;

/////////////////////////////
void signUp({required UserModel user}) async{

  late UserResponse userModel;

  emit(RegisterLoadingState());
  try {

  final response = await DioHelper.postData(
  url: Urls.singupUrl,

  data: user.toJson(),
  );

  userModel = UserResponse.fromJson(response.data);

  if(userModel.status=="true"){
  emit(RegisterSuccessState(userModel: userModel));
  AppSharedPreferences.saveToken(userModel.token!);
  AppSharedPreferences.saveEmail(userModel.user!.email);
  AppSharedPreferences.saveAddress(userModel.user!.address);
  AppSharedPreferences.saveBlood_type(userModel.userprofile!.bloodType);
  AppSharedPreferences.saveBirthDate(userModel.user!.birthDate);
  AppSharedPreferences.saveGender(userModel.userprofile!.gender);
  AppSharedPreferences.savePhone(userModel.user!.phone.toString());
  AppSharedPreferences.saveWeight(userModel.userprofile!.weight);
  AppSharedPreferences.saveName(userModel.user!.name);
  }
  else
    emit(RegisterErrorState(error: userModel.message));

  } catch (error) {
  if (error is DioError) {

  emit(RegisterErrorState(error: 'Error'));
  } else {

  emit(RegisterErrorState(error: error.toString()));
  }
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
   dynamic location= await convertPosToReality(this.myLocation);

   return location;
  }

  //Convert Lat And Lang To Real Location
  convertPosToReality(myLocation) async {
    placemarks = await placemarkFromCoordinates(
        myLocation.latitude, myLocation.longitude,
        localeIdentifier: 'en');

    print(placemarks![0].locality);
    return placemarks![0].street;
 //    var googleGeocoding = GoogleGeocoding("AIzaSyB5MZDCjsbRNinF3NztkmEs-wwSfmN_EU4");
 //    late final risult;
 // risult = await googleGeocoding.geocoding.getReverse(LatLon(myLocation.latitude,myLocation.longitude));
 //
 //     print( risult);
 //    return risult;


    /*  List<Placemark> placemarks = await placemarkFromCoordinates(myLocation.latitude, myLocation.longitude);

      Placemark place = placemarks[0];
     var Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      print(Address);
     return Address;*/




  }

}
//Mahmoud
