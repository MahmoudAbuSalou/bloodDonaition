import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  bool netConnected=false;
  static AppCubit get(context) => BlocProvider.of(context);


  IconData suffx = Icons.visibility_outlined;
  bool isPassword = true;
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
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
}
