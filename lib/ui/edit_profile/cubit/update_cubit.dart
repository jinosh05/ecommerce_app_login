import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_login/domain/db/database_helper.dart';
import 'package:ecommerce_app_login/services/auth_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit() : super(UpdateInitial());

  Uint8List? _image;

  void setImage({required Uint8List? image}) {
    _image = image;
  }

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String address,
  }) async {
    emit(UpdateLoading());

    try {
      var email = await AuthService().getEmail();
      await DBHelper.updateProfile(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        address: address,
        image: _image,
      );

      emit(UpdateSuccess());
    } catch (e) {
      emit(UpdateFailure('Registration failed: ${e.toString()}'));
    }
  }
}
