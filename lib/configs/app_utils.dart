import 'package:ecommerce_app_login/domain/bloc/profile/profile_bloc.dart';
import 'package:ecommerce_app_login/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppUtils {
  Future<void> onLogout(final BuildContext context) async {
    context.read<ProfileBloc>().add(LogoutProfile());
    await AuthService().resetAll();
  }
}
