
import 'dart:io';
import 'package:blood_donation_project/Models/user/userModel.dart';
import 'package:blood_donation_project/Modules/forgetPassword/PinEntry.dart';
import 'package:blood_donation_project/Modules/login/login_screen.dart';
import 'package:blood_donation_project/shared/components/components.dart';
import 'package:blood_donation_project/shared/components/constants.dart';
import 'package:blood_donation_project/shared/network/local/appSharedPrefernce.dart';
import 'package:blood_donation_project/shared/network/local/cachehelper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../Models/Pin/pin.dart';
import '../../Models/user/User_Respnse.dart';
import '../../Modules/register/register_screen.dart';
import '../../shared/network/end_point.dart';
import '../../shared/network/remote/dio_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  bool netConnected = false;
  late UserResponse userModel;
  late UserModel userGlobal;

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

  void CheckNet() async {
    emit(checkNet());
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        netConnected = true;
        emit(checkNet());
      }
    } on SocketException catch (_) {
      netConnected = false;
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
    emit(getLocationLoading());
    try {
      myLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(myLocation.latitude);
      print(myLocation.longitude);
      final location = await convertPosToReality(this.myLocation);
      print(location);
      emit(getLocationSuccess(location: location));
      if (state is getLocationSuccess) {
        navigatorTo(
            context,
            RegisterScreen(
              Address: location,
            ));
      }
    } catch (error) {
      var localError = 'تأكد من كونك متصلاً بالإنترنت';
      if (error is DioError) {
        emit(getLocationError(error: localError));
      } else {
        localError = error.toString();
        emit(getLocationError(error: localError));
      }
      if (state is getLocationError) {
        showToast(msg: localError, state: ToastState.ERROR);
      }
    }
  }

  //Convert Lat And Lang To Real Location
  convertPosToReality(myLocation) async {
    //  List<Placemark> placemarks = await placemarkFromCoordinates(myLocation.latitude, myLocation.longitude);
    //
    //  Placemark place = placemarks[0];
    // var Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    //  print(Address);
    try {
      emit(ConvertLocationLoading());
      final response = await DioHelper.getData(
          url:
              'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=${myLocation.latitude}&longitude=${myLocation.longitude}&localityLanguage=ar');
      String Address =
          "${response.data['principalSubdivision']}-${response.data['localityInfo']['administrative'][2]['name']}";

      emit(ConvertLocationSuccess());

      return Address;
    } catch (err) {
      showToast(msg: 'تأكد من كونك متصلاً بالإنترنت', state: ToastState.ERROR);
      emit(ConvertLocationError(error: err.toString()));
    }
/*


https://api.geoapify.com/v1/geocode/reverse?lat=33.4972255&lon=36.3164525&type=postcode&format=json&apiKey=d548c5ed24604be6a9dd0d989631f783
 */
  }

  late Pin pin;

  generatePin(String email) async {
    try {
      emit(genPinLoading());
      final response = await DioHelper.postData(url: Urls.genPinUrl, data: {
        'email': email,
      });
      pin = Pin.fromJson(response.data);

      if (pin.status == 'true') {
        emit(genPinSuccess(pin: pin));
        print(pin);
      } else
        emit(genPinError(error: pin.message));
    } catch (error) {
      if (error is DioError) {
        emit(genPinError(error: 'Error'));
      } else {
        emit(genPinError(error: error.toString()));
      }
    }
  }

  deleteUser(context) async {
    emit(deleteUserLoading());
    try {
      await DioHelper.getData(
          url: Urls.deleteUserUrl, token: AppSharedPreferences.getToken);

      emit(deleteUserSuccess());
      if (state is deleteUserSuccess) {
        //Navigator.of(context).pop();
        navigatorToNew(context, LogInScreen());
      }
    } catch (error) {
      if (error is DioError) {
        emit(deleteUserError(error: 'Error'));
      }
      emit(deleteUserError(error: error.toString()));
      if (state is deleteUserError) {
        showToast(msg: 'خطأ في حذف المستخدم', state: ToastState.ERROR);
      }
    }
  }
  logOutUser(context) async {
    emit(LogOutUserLoading());
    try {
      await DioHelper.getData(
          url: Urls.logOutUserUrl, token: AppSharedPreferences.getToken);

      emit(LogOutUserSuccess());
      if (state is LogOutUserSuccess) {
        CacheHelper.removeAllData();
        //Navigator.of(context).pop();
        navigatorToNew(context, LogInScreen());
      }
    } catch (error) {
      if (error is DioError) {
        emit(LogOutUserError(error: 'Error'));
      }
      emit(LogOutUserError(error: error.toString()));
      if (state is LogOutUserError) {
        showToast(msg: 'خطأ في تسجيل الخروج', state: ToastState.ERROR);
      }
    }
  }

  changePassword(String password, String email, context) async {
    emit(ChangePasswordLoading());
    try {
      final response = await DioHelper.postData(
          url: Urls.changePasswordUrl,
          data: {'email': email, 'password': password});
      if (response.data['status'] == 'true') {
        emit(ChangePasswordSuccess());
        if (state is ChangePasswordSuccess) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LogInScreen(),
          ));
        }
      } else {
        emit(ChangePasswordError(error: 'Error'));
        showToast(msg: 'Error', state: ToastState.ERROR);
      }
    } catch (error) {
      String localError = '';
      if (error is DioError) {
        localError = 'Error';
      } else {
        localError = error.toString();
      }
      emit(ChangePasswordError(error: localError));
      showToast(msg: localError, state: ToastState.ERROR);
    }
  }

  checkEmail(UserModel user, context) async {
    emit(CheckEmailLoadingState());
    try {
      this.userGlobal = user;
      final response = await DioHelper.postData(
        url: Urls.checkAccountUrl,
        data: user.toJson(),
      );

      userModel = UserResponse.fromJson(response.data);

      if (userModel.status == "true") {
        emit(CheckEmailSuccessState(user_Response: userModel));
        if (state is CheckEmailSuccessState) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PinEntry(email: user.email, page: 'Register'),
          ));
        }
      } else {
        emit(CheckEmailErrorState(error: userModel.message));
        if (state is CheckEmailSuccessState) {
          showToast(msg: 'Error', state: ToastState.ERROR);
        }
      }
    } catch (error) {
      if (error is DioError) {
        emit(CheckEmailErrorState(error: 'Error'));
        if (state is CheckEmailSuccessState) {
          showToast(msg: 'Error', state: ToastState.ERROR);
        }
      } else {
        emit(CheckEmailErrorState(error: error.toString()));
        if (state is CheckEmailSuccessState) {
          showToast(msg: error.toString(), state: ToastState.ERROR);
        }
      }
    }
  }
}
