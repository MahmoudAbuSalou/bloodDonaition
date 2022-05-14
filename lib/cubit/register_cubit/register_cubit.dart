import 'package:blood_donation_project/cubit/register_cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../shared/components/components.dart';
import '../../shared/network/remote/dio_helper.dart';
import 'package:geocoding/geocoding.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(RegisterState initialState)
      : super(RegisterInitialState());
  IconData suffx = Icons.visibility_outlined;
  bool isPassword = true;
  int grpValueGen=0;
  int grpValueWeight=0;
  List <GroupBlood> list=[];
  late Position  myLocation;
  List<Placemark> ?placemarks;

 // LoginModel loginModel;

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(
      {required String email,
      required password,
      required name,
      required phone}) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: '', data: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    }).then((value) {
      print(value.data);


      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState(error));
      print(error.toString());
    });
  }

  void changePasswordIcon() {
    isPassword = !isPassword;
    if (isPassword) {
      suffx = Icons.visibility_outlined;
      emit(RegisterChangePasswordIcon());
    } else {
      suffx = Icons.visibility_off_outlined;
      emit(RegisterChangePasswordIcon());
    }
  }

  void changeelectedGroupBlood(int index) {

    list.forEach((element) {
      element.isSelected=false;
    });
    list[index].isSelected=!list[index].isSelected;

    emit(RegisterChangeSelectedGroupBlood());

  }
  void changeSelectGen(int id){
    grpValueGen=id;
    emit(RegisterChangeSelectedGender());
  }
  void changeSelectWeight(int id){
    grpValueWeight=id;
    emit(RegisterChangeSelectedWeight());
  }

  ///get Lat And Lang for device
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition(context) async {
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

    return await   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }


  //Convert Lat And Lang To Real Location
  convertPosToReality()async{

     placemarks=  await  placemarkFromCoordinates(myLocation.latitude, myLocation.longitude,localeIdentifier: 'en');
     print(placemarks![0].country);


  }



}
//Mahmoud