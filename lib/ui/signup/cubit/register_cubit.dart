import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_login/domain/db/database_helper.dart';
import 'package:ecommerce_app_login/services/auth_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  String? email;
  String? _password;
  Uint8List? _image;

  void setCredentials({
    required final String emailValue,
    required final String password,
  }) {
    email = emailValue;
    _password = password;
  }

  // ignore: use_setters_to_change_properties
  void setImage({required final Uint8List? image}) {
    _image = image;
  }

  Future<void> registerProfile({
    required final String firstName,
    required final String lastName,
    required final String phone,
    required final String address,
  }) async {
    emit(RegisterLoading());

    if (email == null || _password == null) {
      emit(RegisterFailure('Missing credentials'));
      return;
    }

    try {
      await DBHelper.createProfile(
        email: email!,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        address: address,
        image: _image,
      );
      await AuthService().setEmail(email ?? '');

      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure('Registration failed: $e'));
    }
  }
}
